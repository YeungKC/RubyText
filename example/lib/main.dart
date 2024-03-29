import 'package:flutter/material.dart';
import 'package:ruby_text/ruby_text.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(64),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RubyText(
                      [
                        RubyTextData(
                          'でいごの',
                        ),
                        RubyTextData(
                          '花',
                          ruby: 'はな',
                        ),
                        RubyTextData(
                          'が',
                        ),
                        RubyTextData(
                          '咲',
                          ruby: 'さ',
                        ),
                        RubyTextData(
                          'き',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          '風',
                          ruby: 'かぜ',
                        ),
                        RubyTextData(
                          'を',
                        ),
                        RubyTextData(
                          '呼',
                          ruby: 'よ',
                        ),
                        RubyTextData(
                          'び',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          '嵐',
                          ruby: 'あらし',
                        ),
                        RubyTextData(
                          'が',
                        ),
                        RubyTextData(
                          '来',
                          ruby: 'き',
                        ),
                        RubyTextData(
                          'た',
                        ),
                        RubyTextData(
                          '呼',
                          ruby: 'よ',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          'でいごが',
                        ),
                        RubyTextData(
                          '咲',
                          ruby: 'さ',
                        ),
                        RubyTextData(
                          'き',
                        ),
                        RubyTextData(
                          '乱',
                          ruby: 'みだ',
                        ),
                        RubyTextData(
                          'れ',
                        ),
                        RubyTextData(
                          '、',
                        ),
                        RubyTextData(
                          '嵐',
                          ruby: 'あらし',
                        ),
                        RubyTextData(
                          'が',
                        ),
                        RubyTextData(
                          '来',
                          ruby: 'き',
                        ),
                        RubyTextData(
                          'た。',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RubyText(
                      [
                        RubyTextData(
                          '検査',
                          ruby: 'けんさけんさ',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RubyText(
                      [
                        RubyTextData(
                          '検査検査',
                          ruby: 'けんさ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
