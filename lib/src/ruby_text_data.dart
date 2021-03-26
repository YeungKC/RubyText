import 'package:flutter/widgets.dart';

class RubyTextData {
  final String text;
  final String? ruby;
  final TextStyle? style;
  final TextStyle? rubyStyle;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTap;
  final GestureTapCancelCallback? onTapCancel;

  RubyTextData(
    this.text, {
    this.ruby,
    this.style,
    this.rubyStyle,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
  });
}
