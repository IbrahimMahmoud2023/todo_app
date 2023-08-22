import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/layout/home_layout.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "splash";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 2,
        ), () {
      Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assest/image/splash.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Image.asset(
            "assest/image/splash.png",
            height: mediaQuery.height,
            width: mediaQuery.width,
            fit: BoxFit.fill,
          ),
        ));
  }
}
