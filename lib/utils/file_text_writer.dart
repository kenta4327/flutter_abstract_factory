import 'dart:io';

import 'package:flutter_abstract_factory/utils/text_writer.dart';
import 'package:path_provider/path_provider.dart';

class FileTextWriter implements TextWriter {

  @override
  void save(text) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/hoge.txt');

    // ファイルがなかったら生成する
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsString(text);
  }
}