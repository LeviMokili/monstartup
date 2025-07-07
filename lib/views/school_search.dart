import 'package:flutter/material.dart';

class SchoolSearch extends StatefulWidget {
  const SchoolSearch({super.key});

  @override
  State<SchoolSearch> createState() => _SchoolSearchState();
}

class _SchoolSearchState extends State<SchoolSearch> {
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // Optional: match the background in image
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isToggled ? 'Université' : 'Ecoles',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 12),
            Switch(
              value: isToggled,
              onChanged: (bool value) {
                setState(() {
                  isToggled = value;
                });
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

