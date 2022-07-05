import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_app/constants/app_assets.dart';
import 'package:rick_morty_app/generated/l10n.dart';
import 'package:rick_morty_app/repo/repo_settings.dart';
import 'package:rick_morty_app/ui/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey[50],
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  @override
  void initState() {
    final repoSettings = Provider.of<RepoSettings>(
      context,
      listen: false,
    );
    repoSettings.init().whenComplete(() async {
      var defaultLocale = const Locale('ru', 'RU');
      final locale = await repoSettings.readLocale();
      if (locale == 'en') {
        defaultLocale = const Locale('en');
      }
      S.load(defaultLocale).whenComplete(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.images.background,
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    AppAssets.images.logo,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          AppAssets.images.morty,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          AppAssets.images.rick,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
