// ----- STRINGS ------

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const baseURL = 'http://192.168.100.4:8000/api';
const postsURL = '$baseURL/get_all';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

// --- input decoration

Expanded kLikeAndComment (int value, IconData icon, Color color, Function onTap) {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: color,),
              SizedBox(width:4),
              Text('$value')
            ],
          ),
        ),
      ),
    ),
  );
}