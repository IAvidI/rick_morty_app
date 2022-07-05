import 'package:flutter/material.dart';
import 'package:rick_morty_app/constants/app_colors.dart';
import 'package:rick_morty_app/constants/app_styles.dart';

import 'package:intl/intl.dart';
import 'package:rick_morty_app/repo/repo_settings.dart';
import '../../generated/l10n.dart';
import '../widgets/app_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).settings,
          style: AppStyles.s20w500,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: AppColors.mainText,
        elevation: 0.0,
      ),
      bottomNavigationBar: const AppNavBar(current: 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${S.of(context).language}: '),
              DropdownButton<String>(
                value: Intl.getCurrentLocale(),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      S.of(context).english,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ru_RU',
                    child: Text(
                      S.of(context).russian,
                    ),
                  ),
                ],
                onChanged: (value) async {
                  if (value == 'ru_RU') {
                    await S.load(
                      const Locale('ru', 'RU'),
                    );
                    setState(() {});
                  } else if (value == 'en') {
                    await S.load(
                      const Locale('en'),
                    );
                    setState(() {});
                  }
                  RepoSettings().saveLocale(value!);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('${S.of(context).language}: '),
//               DropdownButton<String>(
//                 value: Intl.getCurrentLocale(),
//                 items: [
//                   DropdownMenuItem(
//                     value: 'en',
//                     child: Text(
//                       S.of(context).english,
//                     ),
//                   ),
//                   DropdownMenuItem(
//                     value: 'ru_RU',
//                     child: Text(
//                       S.of(context).russian,
//                     ),
//                   ),
//                 ],
//                 onChanged: (value) async {
//                   if (value == 'ru_RU') {
//                     await S.load(
//                       const Locale('ru', 'RU'),
//                     );
//                     setState(() {});
//                   } else if (value == 'en') {
//                     await S.load(
//                       const Locale('en'),
//                     );
//                     setState(() {});
//                   }
//                 },
//               )
//             ],
//           ),
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     S.of(context).counterValue,
//                   ),
//                   Text(
//                     '$_counter',
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   setState(
//                     () {
//                       _counter++;
//                     },
//                   );
//                 },
//                 child: const Text('+'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(
//                     () {
//                       _counter--;
//                     },
//                   );
//                 },
//                 child: const Text('-'),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20.0),
//         ],
//       ),
//     );
//   }
// }
