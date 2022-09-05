import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Auth/auth_page.dart';
import 'package:nearfund/firebase_options.dart';
import 'package:nearfund/theme/config.dart';
import 'package:nearfund/theme/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NearFund Demo',
      theme: CustomTheme.lightTheme, //3
      darkTheme: CustomTheme.darkTheme, //4
      themeMode: currentTheme.currentTheme,
      home: AuthPage(),
    );
  }
}
