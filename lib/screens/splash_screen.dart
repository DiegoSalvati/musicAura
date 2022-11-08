import 'package:com/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:com/utilities/constants.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash_Screen extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, loginRoute);
  }

  loginRoute() {
    Navigator.pushNamed(context, AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightPink,
//            gradient: LinearGradient(
//              colors: [(Color(0xfffceae0)), (Color(0xff8f5d3c1))],
//              begin: Alignment.topCenter,
//              end: Alignment.bottomCenter,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
//              padding: EdgeInsets.only(bottom: 30),
                  child: Image.asset(
                    'images/logo.png',
//                    width: MediaQuery.of(context).size.width * 0.55,
                    //height: MediaQuery.of(context).size.height*0.4,
                  ),
                  height: 500.0,
                ),
                SpinKitSpinningLines(
                  size: 50,
                  color: AppColors.midBlue,
                  duration: Duration(seconds: 2),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//  Widget build(BuildContext context) {
//    return SplashScreen(
//        seconds: 4,
//        navigateAfterSeconds: AuthScreen(),
//        image: Image.asset('images/logo.png'),
////        backgroundColor: AppColors.lightGrey,
//        photoSize: 100.0,
//        loaderColor: AppColors.darkGrey,
//        pageRoute: _createRoute());
//  }
//}
//
//Route _createRoute() {
//  return PageRouteBuilder(
//    pageBuilder: (context, animation, secondaryAnimation) => AuthScreen(),
//    transitionsBuilder: (context, animation, secondaryAnimation, child) {
//      var begin = Offset(0.0, 1.0);
//      var end = Offset.zero;
//      var curve = Curves.ease;
//
//      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//      return SlideTransition(
//        position: animation.drive(tween),
//        child: child,
//      );
//    },
//  );
//}
