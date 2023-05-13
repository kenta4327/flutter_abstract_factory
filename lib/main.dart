import 'package:flutter/material.dart';
import 'package:flutter_abstract_factory/utils/file_text_util_factory.dart';
import 'package:flutter_abstract_factory/utils/text_reader.dart';
import 'package:flutter_abstract_factory/utils/text_writer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  String _outputText = '';
  TextWriter? _textWriter;
  TextReader? _textReader;

  @override
  void initState() {
    super.initState();

    final abstractFactory = FileTextUtilFactory();
    _textWriter = abstractFactory.createTextWriter();
    _textReader = abstractFactory.createTextReader();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _saveText() {
    _textWriter?.save(_textController.text);
    print('保存したよ');
  }

  void _readText() async {
    final text = await _textReader?.read();
    print('読み込んだよ');
    setState(() {
      _outputText = text!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '文字を入力してください',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveText,
                  child: Text('保存する'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _readText,
                  child: Text('読み込む'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              _outputText,
            ),
          ],
        ),
      ),
    );
  }
}
