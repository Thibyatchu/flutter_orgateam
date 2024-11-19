import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/locale_provider.dart';
import '../../utils/theme_provider.dart';
import '../../utils/app_localizations.dart';

class ParametreScreen extends StatelessWidget {
  const ParametreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              appLocalizations?.getString('settings') ?? "Paramètres",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Langue
            ListTile(
              leading: const Icon(Icons.language, color: Colors.blue),
              title: Text(appLocalizations?.getString('language') ?? "Langue"),
              subtitle: Text(
                "${appLocalizations?.getString('current_language') ?? "Langue actuelle"}: ${localeProvider.locale.languageCode.toUpperCase()}",
              ),
              trailing: DropdownButton<Locale>(
                value: localeProvider.locale,
                items: const [
                  DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
                  DropdownMenuItem(value: Locale('en'), child: Text('English')),
                  DropdownMenuItem(value: Locale('es'), child: Text('Español')),
                ],
                onChanged: (locale) {
                  localeProvider.setLocale(locale!);
                },
              ),
            ),

            const Divider(),

            // Mode sombre
            SwitchListTile(
              title: Text(appLocalizations?.getString('dark_mode') ?? "Mode sombre"),
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },
              secondary: const Icon(Icons.dark_mode, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
