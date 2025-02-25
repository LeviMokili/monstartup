import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:startup/views/home.dart';
import 'package:startup/views/schools/school_post.dart';
class SchoolProfile extends StatefulWidget {
  const SchoolProfile({super.key});

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(

      leading: Container(
        margin: const EdgeInsets.all(6.0),
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.circle
        ),
      ),

      title: const Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 60),
                child: Text('Collège Saint Raphael',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),
              ),

            ],
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7),
                child: Text('Kinshasa, République démocratique du Congo',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),),
              ),

            ],
          )
        ],
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
           width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color:  Color(0xFFFFEDF1),
            ),

            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const Home()), (route) => false);
                }, icon: const Icon(Icons.arrow_forward,size: 16,color: Color(0xFFF6426C),),

            ),
          ),
        )
      ],
    ),

      body: const Column(
        children: [
          SizedBox(height: 20,),
          SchoolPost()

        ],
      ),
    );
  }
}


