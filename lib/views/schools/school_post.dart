import 'package:flutter/material.dart';

class SchoolPost extends StatefulWidget {
  const SchoolPost({super.key});

  @override
  State<SchoolPost> createState() => _SchoolPostState();
}

class _SchoolPostState extends State<SchoolPost> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('welcome'),
      ),
    );
  }
}
