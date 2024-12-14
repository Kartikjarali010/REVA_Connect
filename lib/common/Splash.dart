import 'dart:async';
import 'package:flutter/material.dart';
import 'package:revaconnect/common/wrapper.dart';

class splash_Screen extends StatefulWidget {
  const splash_Screen({super.key});

  @override
  State<splash_Screen> createState() => _splash_ScreenState();
}

class _splash_ScreenState extends State<splash_Screen> {
  
  
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), (){ 
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => Wrapper(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash_screen.png',
         
        ),
      )
    );
  }
}

