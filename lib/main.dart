import 'dart:async';

import 'package:basicrouting/pages/welcome_screen/WelcomeScreen.dart';
import 'package:basicrouting/ui/ListCardView.dart';
import 'package:basicrouting/utilities/Utils.dart';
import 'package:flarecode/flare_actor.dart';
import 'package:flutter/material.dart';

import 'pages/LoginPage.dart';
import 'pages/MyHomePage.dart';
import 'pages/MySecondPage.dart'; // For splash screen timer

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  static var themeColor = getColorHexFromStr('#FB5B87');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new SplashScren(),
        color: Color(Utils.getColorHexFromStr("#FB5B87")),
        theme: new ThemeData(
            primarySwatch: Colors.deepOrange,
            primaryColor: Theme.of(context).platform == TargetPlatform.android
                ? Color(themeColor)
                : Colors.deepOrange),
        routes: <String, WidgetBuilder>{
          WelcomeScreen.pageRouteName: (BuildContext context) =>
              new WelcomeScreen(),
          MyHomePage.pageRouteName: (BuildContext context) => new MyHomePage(),
          MyLoginPage.pageRouteName: (BuildContext context) =>
              new MyLoginPage(),
          MySecondPage.pageRouteName: (BuildContext context) =>
              new MySecondPage()
        });
  }
}

class SplashScren extends StatefulWidget {
  @override
  _SplashScrenState createState() => new _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  String _animation = "Build";

  startAnimation() {
    Timer(
        Duration(seconds: 0),
        () => setState(() {
              _animation = "rotate";
            }));

    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacementNamed(
            WelcomeScreen.pageRouteName)); // WelcomeScreen.pageRouteName
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor("assets/flare_animation/mountain.flr",
          animation: "rotate"),
    );
  }
}
