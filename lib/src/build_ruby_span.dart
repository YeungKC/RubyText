import 'package:flutter/widgets.dart';

WidgetSpan buildRubySpan(
  String text, {
  String? ruby,
  required BuildContext context,
  TextStyle? style,
  TextStyle? rubyStyle,
  GestureTapDownCallback? onTapDown,
  GestureTapUpCallback? onTapUp,
  GestureTapCallback? onTap,
  GestureTapCancelCallback? onTapCancel,
}) {
  final defaultTextStyle = DefaultTextStyle.of(context);
  var effectiveTextStyle = style;
  if (style == null || style.inherit) {
    effectiveTextStyle = defaultTextStyle.style.merge(style);
  }
  if (MediaQuery.boldTextOverride(context)) {
    effectiveTextStyle =
        effectiveTextStyle!.merge(const TextStyle(fontWeight: FontWeight.bold));
  }

  assert(effectiveTextStyle!.fontSize != null, 'must be has a font size.');

  final defaultRubyTextStyle = effectiveTextStyle!.merge(
    TextStyle(
      fontSize: effectiveTextStyle.fontSize! / 1.5,
    ),
  );

  var effectiveRubyTextStyle = rubyStyle;
  if (style == null || style.inherit) {
    effectiveRubyTextStyle = defaultRubyTextStyle.merge(style);
  }
  if (MediaQuery.boldTextOverride(context)) {
    effectiveRubyTextStyle = effectiveRubyTextStyle!
        .merge(const TextStyle(fontWeight: FontWeight.bold));
  }

  if (ruby != null &&
      effectiveTextStyle.letterSpacing == null &&
      effectiveRubyTextStyle!.letterSpacing == null &&
      ruby.length >= 2 &&
      text.length >= 2) {
    var rubyWidth = _getWidth(ruby, effectiveRubyTextStyle);
    var textWidth = _getWidth(text, effectiveTextStyle);

    if (textWidth > rubyWidth) {
      var newLetterSpacing = (textWidth - rubyWidth) / ruby.length;
      effectiveRubyTextStyle = effectiveRubyTextStyle
          .merge(TextStyle(letterSpacing: newLetterSpacing));
    } else {
      var newLetterSpacing = (rubyWidth - textWidth) / text.length;
      effectiveTextStyle =
          effectiveTextStyle.merge(TextStyle(letterSpacing: newLetterSpacing));
    }
  }

  var texts = <Widget>[];
  if (ruby != null) {
    texts.add(
      Text(
        ruby,
        textAlign: TextAlign.center,
        style: effectiveRubyTextStyle,
      ),
    );
  }

  texts.add(
    Text(
      text,
      textAlign: TextAlign.center,
      style: effectiveTextStyle,
    ),
  );

  return WidgetSpan(
    child: GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onTap: onTap,
      child: Container(
        child: Column(
          children: texts,
        ),
      ),
    ),
  );
}

double _getWidth(String ruby, TextStyle effectiveRubyTextStyle) {
  var rubyWidth = ruby.length * effectiveRubyTextStyle.fontSize!;
  var totalLetterSpacing = effectiveRubyTextStyle.letterSpacing != null
      ? ruby.length - 1 * effectiveRubyTextStyle.letterSpacing!
      : 0.0;
  return rubyWidth + totalLetterSpacing;
}
