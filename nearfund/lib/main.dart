import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nearfund/app/Auth/Register_page.dart';
import 'package:nearfund/app/Auth/auth_page.dart';
import 'package:nearfund/app/Auth/login_page.dart';
import 'package:nearfund/app/UserDetils/userdetails_page.dart';
import 'package:nearfund/app/loading/loading_page.dart';
import 'package:nearfund/app/mainPage/main_page.dart';
import 'package:nearfund/app/payment/request_payment.dart';
import 'package:nearfund/app/payment/withdraw_earn.dart';
import 'package:nearfund/app/settings/Setting_page.dart';
import 'package:nearfund/firebase_options.dart';
import 'package:nearfund/services/authService.dart';
import 'package:nearfund/theme/config.dart';
import 'package:nearfund/theme/custom_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkAutState = ref.watch(authServiceProvide).getCurrentUser();
    return MaterialApp(
      title: 'NearFund Demo',
      debugShowCheckedModeBanner: false,

      theme: CustomTheme.lightTheme, //3
      darkTheme: CustomTheme.darkTheme, //4
      themeMode: currentTheme.currentTheme,
      home: checkAutState != null ? MainAppPage() : AuthPage(),
      // home: SettingPage(),
    );
  }
}
