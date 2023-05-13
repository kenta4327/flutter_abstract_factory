
import 'dart:io';

import 'package:flutter_abstract_factory/utils/text_reader.dart';
import 'package:path_provider/path_provider.dart';

class FileTextReader implements TextReader {

  @override
  Future<String> read() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/hoge.txt');

    // ファイルがあった時だけ読み込む
    if (await file.exists()) {
      final data = await file.readAsString();
      return data;
    }

    return '';
  }
}