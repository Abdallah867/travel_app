import 'package:appwrite/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  Language selectedLanguage = Language.english;
  void switchLanguage(Language language) {
    switch (language) {
      case Language.english:
        emit(const SettingsLanguageChanged(language: 'en'));
        break;
      case Language.arabic:
        emit(const SettingsLanguageChanged(language: 'ar'));
        break;
      case Language.french:
        emit(const SettingsLanguageChanged(language: 'fr'));
        break;
    }
  }
}

enum Language {
  english,
  arabic,
  french,
}
