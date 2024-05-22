import 'package:flutter/material.dart';
import 'package:group_5_mohandseen_apis/screens/create_post_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
      ),
      home: CreatePostScreen(),
    );
  }
}
