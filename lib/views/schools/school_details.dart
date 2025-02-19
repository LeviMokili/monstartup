import 'package:flutter/material.dart';

class SchoolDetails extends StatefulWidget {
  const SchoolDetails({super.key});

  @override
  State<SchoolDetails> createState() => _SchoolDetailsState();
}

class _SchoolDetailsState extends State<SchoolDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.all(9.0),
          width: 40,
          height: 40,
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
                  padding: EdgeInsets.only(right: 74),
                  child: Text('Collège Saint Raphael',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                ),

              ],
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text('Kinshasa, République démocratique du Congo',
                    style: TextStyle(fontSize: 11),),
                ),


              ],
            ),

          ],
        ),

        actions: const [
            Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(Icons.phone),
          )
        ],
      ),

      body: const Column(
        children: [
          SizedBox(height: 10,),

        ]

      ),





    );
  }
}
