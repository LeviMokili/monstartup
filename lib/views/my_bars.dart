import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:startup/views/home_post.dart';
class MyBars extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter TabBar'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Profile"),
              Tab(text: "Settings"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Home Screen")),
            Center(child: Text("Profile Screen")),
            Center(child: Text("Settings Screen")),
          ],
        ),
      ),
    );
  }
}
