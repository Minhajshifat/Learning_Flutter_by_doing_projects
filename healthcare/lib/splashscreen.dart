import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/home.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
     Timer(const Duration(seconds: 20), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>const HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffD9A48E) ,
      body: Center(
        child:SvgPicture.asset('assets/images/splash.svg',
        
        ),
      ),
    );
  }
}