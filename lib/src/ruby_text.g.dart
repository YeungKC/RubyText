// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ruby_text.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class RubySpanWidget extends HookWidget {
  const RubySpanWidget(this.data, {Key? key}) : super(key: key);

  final RubyTextData data;

  @override
  Widget build(BuildContext _context) => rubySpanWidget(_context, data);
}

class RubyText extends StatelessWidget {
  const RubyText(this.data,
      {Key? key,
      this.spacing = 0.0,
      this.style,
      this.rubyStyle,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.maxLines})
      : super(key: key);

  final List<RubyTextData> data;

  final double spacing;

  final TextStyle? style;

  final TextStyle? rubyStyle;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final bool? softWrap;

  final TextOverflow? overflow;

  final int? maxLines;

  @override
  Widget build(BuildContext _context) => rubyText(_context, data,
      spacing: spacing,
      style: style,
      rubyStyle: rubyStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines);
}
