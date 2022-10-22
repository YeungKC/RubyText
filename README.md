# RubyText

[![Pub](https://img.shields.io/pub/v/ruby_text.svg)](https://pub.dartlang.org/packages/ruby_text)

A ruby text widget with flutter.

|         Hiragana On         |         Hiragana Off         |
| :-------------------------: | :--------------------------: |
| ![](./docs/hiragana_on.png) | ![](./docs/hiragana_off.png) |

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
    showHiraganas: true,
  );
```

## Other

```dart
const RubyText(
  List<RubyTextData> data, {
  double spacing = 0.0,
  TextStyle? style,
  TextStyle? rubyStyle,
  TextAlign? textAlign,
  TextDirection? textDirection,
  bool? softWrap,
  TextOverflow? overflow,
  int? maxLines,
  bool showHiraganas,
});

const RubyTextData(
  String text, {
  String? ruby,
  TextStyle? style,
  TextStyle? rubyStyle,
  TextDirection textDirection = TextDirection.rtl,
});

const RubySpanWidget(BuildContext context, RubyTextData data, bool showHiraganas: true);
```
