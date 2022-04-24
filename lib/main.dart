import 'package:data_base/pref/shared_preference.dart';
import 'package:data_base/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screen/home Screen.dart';
import 'Screen/login Screen.dart';
import 'Screen/lunch Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider(),
        )
      ],
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LanguageProvider>(context).language),
      initialRoute: '/LunchScreen',
      routes: {
        '/LunchScreen': (context) => const LunchScreen(),
        '/LoginScreen': (context) => const LoginScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
      },
    );
  }
}
