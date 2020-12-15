import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_cat_test_app/pages/login_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Colors.white,
      image: Image.asset('assets/cat.png'),
      loaderColor: Colors.black,
      photoSize: 150.0,
      navigateAfterSeconds: LoginPage(),
    );
  }
}


