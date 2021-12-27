import 'package:flutter/material.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/screens/weather_screen/home_screen.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
