import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'fr': {
      'welcome': "Bienvenue dans l'application Rugby ! Suivez vos équipes, événements et bien plus encore.",
      'settings': "Paramètres",
      'language': "Langue",
      'current_language': "Langue actuelle",
      'dark_mode': "Mode sombre",
      'notifications': "Notifications",
      'about': "À propos",
    },
    'en': {
      'welcome': "Welcome to the Rugby App! Follow your teams, events, and more.",
      'settings': "Settings",
      'language': "Language",
      'current_language': "Current Language",
      'dark_mode': "Dark Mode",
      'notifications': "Notifications",
      'about': "About",
    },
    'es': {
      'welcome': "¡Bienvenido a la aplicación de Rugby! Sigue tus equipos, eventos y más.",
      'settings': "Ajustes",
      'language': "Idioma",
      'current_language': "Idioma actual",
      'dark_mode': "Modo oscuro",
      'notifications': "Notificaciones",
      'about': "Acerca de",
    },
  };

  String getString(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['fr', 'en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
