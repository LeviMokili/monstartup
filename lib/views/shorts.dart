import 'package:flutter/material.dart';
class Shorts extends StatefulWidget {
  const Shorts({super.key});

  @override
  State<Shorts> createState() => _ShortsState();
}

class _ShortsState extends State<Shorts> {
  @override
  Widget build(BuildContext context) {
   return SizedBox(
      height: 170,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       itemCount: 10,
       itemBuilder: (context, index){

         return Container(
           width: 100,
           margin: const EdgeInsets.all(5),
           color: Colors.deepPurpleAccent,
         );
       },
     ),
   );
  }
}
