import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/app/language/controller/language_controller.dart';
import 'package:myapp/app/language/state/language_state.dart';

final languageProvider = NotifierProvider<LanguageController, LanguageState>(
  LanguageController.new,
);
