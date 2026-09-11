import 'package:html_unescape/html_unescape_small.dart';

extension StringExt on String? {
  String get toContent =>
      HtmlUnescape().convert(this ?? '').replaceAll('\n', ' ').trim();
}
