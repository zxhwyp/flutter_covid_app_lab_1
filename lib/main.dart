import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_covid_app_lab_1/Controller/BottomNavigationBar/HomeController.dart';
import 'package:flutter_covid_app_lab_1/Screens/home_screen/statistics.dart';
import 'package:flutter_covid_app_lab_1/Screens/login_screen/login_screen.dart';
import 'package:flutter_covid_app_lab_1/Screens/prevention/prevention.dart';
import 'package:flutter_covid_app_lab_1/Screens/qrcode_screen/qrcode_screen.dart';
import 'package:flutter_covid_app_lab_1/Screens/register_screen/signup_screen.dart';
import 'package:flutter_covid_app_lab_1/Screens/self_check/self_check.dart';
import 'package:flutter_covid_app_lab_1/constants.dart';
import 'package:flutter_covid_app_lab_1/vms/vm_covid19.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  if (Platform.isAndroid) {
    /// 设置android状态栏为透明的沉浸
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

final routes = {
  '/login': (BuildContext context) => LoginScreen(),
  '/register': (BuildContext context) => SignUpScreen(),
  '/home': (BuildContext context) => HomeController(),
  '/self_check': (BuildContext context) => SelfCheck(),
  '/qrcode': (BuildContext context) => QRScreen(),
  '/prevention': (BuildContext context) => Prevention(),
  '/statistics': (BuildContext context) => Statistics(),
  '/': (BuildContext context) => LoginScreen()
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Covid19VM>(create: (_) => Covid19VM()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid App',
        routes: routes,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
