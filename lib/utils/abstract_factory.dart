import 'package:flutter_abstract_factory/utils/text_reader.dart';
import 'package:flutter_abstract_factory/utils/text_writer.dart';

abstract class AbstractFactory {
  TextWriter createTextWriter();
  TextReader createTextReader();
}