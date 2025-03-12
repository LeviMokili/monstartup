import 'package:flutter/material.dart';
import 'package:startup/views/home_post.dart';
import 'package:startup/views/live_search.dart';
import 'package:startup/views/shorts.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: AppBar(

        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset('assets/logo.png', width: 50, height: 50),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>  const LiveSearch()),
                    (route) => false);
          }, icon:  Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF8FAFB)
            ),
            child: const Icon(Icons.search, size: 15),
          ),)
        ],

      ),


     body:  const Column(
       children:  [
         Padding(
           padding: EdgeInsets.only(right: 260),
           child: Text('Shorts', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         ),
         SizedBox(height: 5,),
         // Shorts(),

         SizedBox(height: 10,),
         HomePost()

       ],
     ),
    );
  }
}
