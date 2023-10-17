import 'package:flutter/material.dart';
import 'package:lafyuu/screens/columnAndRow.dart';
import 'package:lafyuu/screens/splash_screen.dart';

void main() {
  runApp(const Lafyuu());
}

class Lafyuu extends StatelessWidget {
  const Lafyuu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
