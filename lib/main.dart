import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/mood.dart';
import 'screens/verse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Motivation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/mood': (context) => const MoodScreen(),
        // ignore: prefer_const_constructors
        '/verse': (context) => VerseScreen(), // No need for const because it uses arguments
      },
      debugShowCheckedModeBanner: false,
    );
  }
}