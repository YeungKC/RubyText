# RubyText

[![Pub](https://img.shields.io/pub/v/ruby_text.svg)](https://pub.dartlang.org/packages/ruby_text)

A ruby text widget with flutter.

![](./Screenshot.png)

## Install
```yaml
dependencies:
    ruby_text: <Latest version.>
```

## Example

```dart
  RubyText(
    [
      RubyTextData(
        '検査',
        ruby: 'けんさ',
      ),
    ],
  );
```

## Other

```dart
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
  });

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

// if you want to can use buildRubySpan 

WidgetSpan buildRubySpan(
  String text, {
  String ruby,
  BuildContext context,
  TextStyle style,
  TextStyle rubyStyle,
  GestureTapDownCallback onTapDown,
  GestureTapUpCallback onTapUp,
  GestureTapCallback onTap,
  GestureTapCancelCallback onTapCancel,
})
```
