import 'dart:io';
import 'package:com/screens/auth_screen.dart';
import 'package:com/screens/music_screen.dart';
import 'package:com/screens/splash_screen.dart';
import 'package:com/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Varela',
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'Varela', fontSize: 20, color: Colors.white),
              ),
        ),
        primaryColor: AppColors.lightPink,
        accentColor: AppColors.lightBlue,
        dividerColor: Colors.white,
        buttonColor: Colors.white,
        backgroundColor: Colors.black,
        highlightColor: Colors.transparent,

        // Define the default Font Family
      ),
      home: Splash_Screen(),
      routes: {
        Splash_Screen.routeName: (context) => Splash_Screen(),
        AuthScreen.routeName: (context) => AuthScreen(),
        MusicScreen.routeName: (context) => MusicScreen(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

//
//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[],
//        ),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
