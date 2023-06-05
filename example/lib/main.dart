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
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showHiraganas = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildRubyText(showHiraganas),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RubyText(
                    [
                      RubyTextData(
                        '検査',
                        ruby: 'けんさけんさ',
                      ),
                    ],
                    showHiraganas: showHiraganas,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RubyText(
                    [
                      RubyTextData(
                        '検査検査',
                        ruby: 'けんさ',
                      ),
                    ],
                    showHiraganas: showHiraganas,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showHiraganas = !showHiraganas;
                      });
                    },
                    child: Text('Toggle Hiraganas'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRubyText(bool showHiraganas) {
    return RubyText(
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
      showHiraganas: showHiraganas,
    );
  }
}
