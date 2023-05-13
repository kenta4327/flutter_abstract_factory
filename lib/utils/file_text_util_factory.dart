import 'package:flutter_abstract_factory/utils/abstract_factory.dart';
import 'package:flutter_abstract_factory/utils/file_text_reader.dart';
import 'package:flutter_abstract_factory/utils/file_text_writer.dart';
import 'package:flutter_abstract_factory/utils/text_reader.dart';
import 'package:flutter_abstract_factory/utils/text_writer.dart';

class FileTextUtilFactory implements AbstractFactory {
  @override
  TextReader createTextReader() {
    return FileTextReader();
  }

  @override
  TextWriter createTextWriter() {
    return FileTextWriter();
  }
}