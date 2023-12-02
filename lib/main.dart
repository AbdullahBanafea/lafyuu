import 'package:flutter/material.dart';
import 'package:lafyuu/provider/favoriter_provider.dart';
import 'package:lafyuu/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Lafyuu());
}

class Lafyuu extends StatelessWidget {
  const Lafyuu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavoriteProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash(),
    )
    );
  }
}
