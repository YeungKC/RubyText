import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:tuple/tuple.dart';

import 'ruby_text_data.dart';

part 'ruby_text.g.dart';

typedef BuildRubySpanResult = Tuple2<TextStyle, TextStyle>;

@hwidget
Widget rubySpanWidget(BuildContext context, RubyTextData data) {
  final defaultTextStyle = DefaultTextStyle.of(context).style;
  final boldTextOverride = MediaQuery.boldTextOverride(context);

  final result = useMemoized(
    () {
      // text style
      var effectiveTextStyle = data.style;
      if (effectiveTextStyle == null || effectiveTextStyle.inherit) {
        effectiveTextStyle = defaultTextStyle.merge(effectiveTextStyle);
      }
      if (boldTextOverride) {
        effectiveTextStyle = effectiveTextStyle
            .merge(const TextStyle(fontWeight: FontWeight.bold));
      }
      assert(effectiveTextStyle.fontSize != null, 'must be has a font size.');
      final defaultRubyTextStyle = effectiveTextStyle.merge(
        TextStyle(fontSize: effectiveTextStyle.fontSize! / 1.5),
      );

      // ruby text style
      var effectiveRubyTextStyle = data.rubyStyle;
      if (effectiveRubyTextStyle == null || effectiveRubyTextStyle.inherit) {
        effectiveRubyTextStyle =
            defaultRubyTextStyle.merge(effectiveRubyTextStyle);
      }
      if (boldTextOverride) {
        effectiveRubyTextStyle = effectiveRubyTextStyle
            .merge(const TextStyle(fontWeight: FontWeight.bold));
      }

      // spacing
      final ruby = data.ruby;
      final text = data.text;
      if (ruby != null &&
          effectiveTextStyle.letterSpacing == null &&
          effectiveRubyTextStyle.letterSpacing == null &&
          ruby.length >= 2 &&
          text.length >= 2) {
        final rubyWidth = _measurementWidth(
          ruby,
          effectiveRubyTextStyle,
          textDirection: data.textDirection,
        );
        final textWidth = _measurementWidth(
          text,
          effectiveTextStyle,
          textDirection: data.textDirection,
        );

        if (textWidth > rubyWidth) {
          final newLetterSpacing = (textWidth - rubyWidth) / ruby.length;
          effectiveRubyTextStyle = effectiveRubyTextStyle
              .merge(TextStyle(letterSpacing: newLetterSpacing));
        } else {
          final newLetterSpacing = (rubyWidth - textWidth) / text.length;
          effectiveTextStyle = effectiveTextStyle
              .merge(TextStyle(letterSpacing: newLetterSpacing));
        }
      }

      return BuildRubySpanResult(effectiveTextStyle, effectiveRubyTextStyle);
    },
    [defaultTextStyle, boldTextOverride, data],
  );

  final effectiveTextStyle = result.item1;
  final effectiveRubyTextStyle = result.item2;

  final texts = <Widget>[];
  if (data.ruby != null) {
    texts.add(
      Text(
        data.ruby!,
        textAlign: TextAlign.center,
        style: effectiveRubyTextStyle,
      ),
    );
  }

  texts.add(
    Text(
      data.text,
      textAlign: TextAlign.center,
      style: effectiveTextStyle,
    ),
  );

  return Column(
    children: texts,
  );
}

@swidget
Widget rubyText(
  BuildContext context,
  List<RubyTextData> data, {
  double spacing = 0.0,
  TextStyle? style,
  TextStyle? rubyStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  bool? softWrap,
  TextOverflow? overflow,
  int? maxLines,
}) =>
    Text.rich(
      TextSpan(
        children: data
            .map<InlineSpan>(
              (RubyTextData data) => WidgetSpan(
                child: RubySpanWidget(
                  data.copyWith(
                    style: style,
                    rubyStyle: rubyStyle,
                    textDirection: textDirection,
                  ),
                ),
              ),
            )
            .toList(),
      ),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );

double _measurementWidth(
  String text,
  TextStyle style, {
  TextDirection textDirection = TextDirection.rtl,
}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: textDirection,
    textAlign: TextAlign.center,
  )..layout();
  return textPainter.width;
}

extension ListExtension<T> on List<T> {
  List<T> joinObject(T separator) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return [];
    final buffer = <T>[];
    if (separator == null) {
      do {
        buffer.add(iterator.current);
      } while (iterator.moveNext());
    } else {
      buffer.add(iterator.current);
      while (iterator.moveNext()) {
        buffer
          ..add(separator)
          ..add(iterator.current);
      }
    }

    return buffer;
  }
}
