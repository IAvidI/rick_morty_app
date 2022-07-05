// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:rick_morty_app/ui/splash_screen.dart';
import 'package:rick_morty_app/widgets/init_widget.dart';
import 'constants/app_colors.dart';
// import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'repo/repo_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repoSettings = RepoSettings();
  await repoSettings.init();
  var defaultLocale = const Locale('ru', 'RU');
  final locale = await repoSettings.readLocale();
  if (locale == 'en') {
    defaultLocale = const Locale('en');
  }

  runApp(MyApp(locale: defaultLocale));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.locale}) : super(key: key);
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: AppColors.primary,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ru', 'RU'),
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashScreen(),
      ),
    );
  }
}
