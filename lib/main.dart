import 'package:flutter/material.dart';
import 'package:startup/views/auth/login.dart';
import 'package:startup/views/auth/signup.dart';
import 'package:startup/views/home.dart';
import 'package:startup/views/live_search.dart';
import 'package:startup/views/mypost.dart';
import 'package:startup/views/schools/school_profile.dart';
import 'package:startup/views/universities/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LiveSearch()
    );
  }
}


