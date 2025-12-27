import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(): super(LanguageInitialState(Locale('en')));
  static LanguageCubit get(context) => BlocProvider.of(context);

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('language') ?? 'en';
    emit(LanguageInitialState(Locale(langCode)));
  }


String language ='en';
  Future<void> changeLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', langCode);
    language = langCode;
    emit(LanguageChanged(Locale(langCode)));
  }

}
