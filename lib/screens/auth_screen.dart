import 'package:com/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:com/screens/music_screen.dart';
import 'package:com/utilities/login_social_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    try {
      return await _googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightPink,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80),
                bottomLeft: Radius.circular(80),
              ),
            ),
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            height: 500,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset('images/logo_animated.gif'),
                    height: 400,
                    width: 350,
                  ),
                ],
              ),
            ),
          ),
          LoginSocialButton(
            onPressed: () async {
              FacebookAuth.instance.login(
                  permissions: ["public_profile", "email"]).then((value) {
                FacebookAuth.instance.getUserData().then((userData) async {
                  setState(() {
                    _isLoggedIn = true;
                    _userObj = userData;
                    Navigator.pushNamed(context, MusicScreen.routeName);
                  });
                });
              });
            },
            title: ' | Sign in with Facebook',
            colour: Colors.blueAccent,
            icon: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
              size: 15.0,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          LoginSocialButton(
            onPressed: () async {
              await FirebaseServices().signInWithGoogle();
              Navigator.pushNamed(context, MusicScreen.routeName);
            },
            colour: Colors.orangeAccent,
            title: ' | Sign in with Google',
            icon: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
              size: 15.0,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, MusicScreen.routeName),
                  child: Text(
                    '  Continue as a guest',
                    style: TextStyle(
                      color: AppColors.midBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//// Add this to the header of your file, e.g. in ViewController.swift
//import FacebookLogin
//
//// Add this to the body
//class ViewController: UIViewController {
//override func viewDidLoad() {
//  super.viewDidLoad()
//
//  let loginButton = FBLoginButton()
//  loginButton.center = view.center
//  view.addSubview(loginButton)
//}
//}
