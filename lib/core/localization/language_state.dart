import 'dart:ui';

abstract class LanguageState {}
class LanguageInitialState extends LanguageState {

  final Locale locale;
  LanguageInitialState(this.locale);

}
class LanguageChanged extends LanguageState {
  final Locale locale;
  LanguageChanged(this.locale);
}