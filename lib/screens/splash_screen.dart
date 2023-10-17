import 'package:flutter/material.dart';
import 'package:lafyuu/screens/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return LoginScreen();
          }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff40BFFF),
        body: Center(
          child : Image.asset('assets/images/white_logo.png', height: 72,width: 72),
        )
    );
  }
}
