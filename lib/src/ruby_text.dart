import 'package:flutter/widgets.dart';
import 'package:ruby_text/ruby_text.dart';

class RubyText extends StatelessWidget {
  RubyText(
    this.data, {
    this.style,
    this.rubyStyle,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  final List<RubyTextData> data;
  final TextStyle? style;
  final TextStyle? rubyStyle;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;

  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    data.map(
      (data) => buildRubySpan(
        data.text,
        ruby: data.ruby,
        context: context,
        style: data.style,
        rubyStyle: data.rubyStyle,
        onTapDown: data.onTapDown,
        onTapUp: data.onTapUp,
        onTap: data.onTap,
        onTapCancel: data.onTapCancel,
      ),
    );
    return Text.rich(
      TextSpan(
        children: data
            .map<InlineSpan>(
              (data) => buildRubySpan(
                data.text,
                ruby: data.ruby,
                context: context,
                style: data.style,
                rubyStyle: data.rubyStyle,
                onTapDown: data.onTapDown,
                onTapUp: data.onTapUp,
                onTap: data.onTap,
                onTapCancel: data.onTapCancel,
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
  }
}
