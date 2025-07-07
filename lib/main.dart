import 'package:flutter/material.dart';
import 'package:startup/views/home.dart';
import 'package:startup/views/live_search.dart';
import 'package:startup/views/school_search.dart';
import 'package:startup/views/search_field_sample.dart';



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
      home:  const Home()
    );
  }
}


