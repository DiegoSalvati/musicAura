import 'package:com/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:com/screens/auth_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:google_sign_in/google_sign_in.dart';

final List<String> Url_list = [
//  testa:
  'https://www.youtube.com/watch?v=38rQO3dMZrc',
//  third eye:
  'https://www.youtube.com/watch?v=s2ddLEfSEIA',
//gola
  'https://www.youtube.com/watch?v=QJs4iCV-g6I',
//  cuore
  'https://www.youtube.com/watch?v=q1Ng7FgDsNQ',
//  addome
  'https://www.youtube.com/watch?v=8s8R8vR53n4',
//  sacral
  'https://www.youtube.com/watch?v=ueV0WPUUAj0',
//  root
  'https://www.youtube.com/watch?v=OMPaU5L3zy0',
];

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
    );
  } else {
    throw 'Could not launch $url';
  }
  print('cant launch ulr');
}

class MusicScreen extends StatefulWidget {
  static const routeName = '/music-screen';

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool isHover = false;

  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];
  GlobalKey key1 = GlobalKey();

  @override
  void initState() {
    targets.addAll([
      TargetFocus(keyTarget: key1, color: AppColors.darkPink, contents: [
        TargetContent(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tap on any of the Chakra to start the healing',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ))
      ]),
    ]);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TutorialCoachMark(targets: targets)..show(context: context);
    });
  }

  void startTutorialMode() {
    TutorialCoachMark(
      targets: targets,
    )..show(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(
        onTap: () {},
      ),
      backgroundColor: AppColors.lightPink,
      appBar: AppBar(
        shadowColor: AppColors.lightPink,
        backgroundColor: AppColors.midPink,
        title: Text(
          'musicAura',
          style: Theme.of(context).appBarTheme.textTheme!.headline6,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  right: -70,
                  child: Container(
                    height: 520,
                    width: 520,
                    padding: EdgeInsets.only(top: 70),
                    child: Image.asset('images/Meditation.png'),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 124,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 150,
                    child: Image.asset('images/testa.png'),
                  ),
                ),
                Positioned(
                  key: key1,
                  top: 73,
                  left: 179,
                  child: PulsatingCircleIconButton(
                    () {
                      _launchURL(Url_list[0]);
                    },
                  ),
                ),
                Positioned(
                  top: 105,
                  left: 120,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 150,
                    child: Image.asset('images/occhio.png'),
                  ),
                ),
                Positioned(
                  top: 139,
                  left: 179,
                  child: PulsatingCircleIconButton(
                    () {
                      _launchURL(Url_list[1]);
                    },
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 129,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 150,
                    child: Image.asset('images/gola.png'),
                  ),
                ),
                Positioned(
                  top: 203,
                  left: 180,
                  child: PulsatingCircleIconButton(
                    () {
                      _launchURL(Url_list[2]);
                    },
                  ),
                ),
                Positioned(
                  top: 245,
                  left: 93,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    height: 100,
                    width: 200,
                    child: Image.asset('images/cuore.png'),
                  ),
                ),
                Positioned(
                  top: 280,
                  left: 180,
                  child: PulsatingCircleIconButton(
                    () {
                      _launchURL(Url_list[3]);
                    },
                  ),
                ),
                Positioned(
                  top: 317,
                  left: 83,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    height: 100,
                    width: 200,
                    child: Image.asset('images/addome.png'),
                  ),
                ),
                Positioned(
                  top: 350,
                  left: 180,
                  child: PulsatingCircleIconButton(
                    () {
                      _launchURL(Url_list[4]);
                    },
                  ),
                ),
                Positioned(
                  top: 392,
                  left: 122,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: 160,
                    child: Image.asset('images/sacro.png'),
                  ),
                ),
                Positioned(
                  top: 425,
                  left: 179,
                  child: PulsatingCircleIconButton(
                    () {
                      _launchURL(Url_list[5]);
                    },
                  ),
                ),
                Positioned(
                  top: 467,
                  left: 126,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    width: 160,
                    child: Image.asset('images/root.png'),
                  ),
                ),
                Positioned(
                  top: 500,
                  left: 178,
                  child: PulsatingCircleIconButton(
                    () {
                      _launchURL(Url_list[6]);
                    },
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

class MainDrawer extends StatefulWidget {
  final Function()? onTap;

  MainDrawer({required this.onTap});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final googleSignIn = GoogleSignIn();
  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  Future<void> _logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 95,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            color: AppColors.lightPink,
            alignment: Alignment.centerLeft,
            child: Row(children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.displayName!,
                    style: (TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
                  ),
                  Text(
                    user.email!,
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, AuthScreen.routeName);
              logout();
              _logOut();
            },
          ),
        ],
      ),
    );
  }
}

class PulsatingCircleIconButton extends StatefulWidget {
  final GestureTapCallback onTap;

  PulsatingCircleIconButton(this.onTap);

  @override
  _PulsatingCircleIconButtonState createState() =>
      _PulsatingCircleIconButtonState();
}

class _PulsatingCircleIconButtonState extends State<PulsatingCircleIconButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: 0.0, end: 12.0).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.easeOut));
    _animationController!.repeat(reverse: true);
    super.initState();
  }

//  @override
//  void dispose() {
//    _animationController!.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 100,
      borderRadius: BorderRadius.circular(50),
      onTap: widget.onTap,
      splashColor: AppColors.Violet,
      child: AnimatedBuilder(
        animation: _animation!,
        builder: (context, _) {
          return Ink(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.midBlue,
              shape: BoxShape.circle,
              boxShadow: [
                for (int i = 1; i <= 2; i++)
                  BoxShadow(
                    color: AppColors.lightBlue
                        .withOpacity(_animationController!.value / 2),
                    spreadRadius: _animation!.value * i,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
//
//
//if (_auth.signInWithGoogle()) {
//_auth.signOut();
//} else if (_accessToken != null) {
//_logOut();
//} else {}

//final FirebaseServices _auth = FirebaseServices();
