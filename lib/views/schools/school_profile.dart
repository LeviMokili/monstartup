import 'package:flutter/material.dart';
class SchoolProfile extends StatefulWidget {
  const SchoolProfile({super.key});

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: AppBar(
        backgroundColor:Colors.white,
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
                  padding: EdgeInsets.only(right: 60),
                  child: Text('Collège Saint Raphael',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                ),

              ],
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 7),
                  child: Text('Kinshasa, République démocratique du Congo',
                    style: TextStyle(fontSize: 11),),
                ),


              ],
            ),



          ],
        ),

        actions:const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.phone),
          )
        ],
      ),

      body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('#', style: TextStyle(color: Color(0xFFF6426C)),),
                      SizedBox(width: 1,),
                      Text('Ecole Conventionnée Catholique', style: TextStyle(fontWeight: FontWeight.w400),),
                    ],
                  ),



                  SizedBox(height: 10,),

                  Row(
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.all(0.0),
                      //   child: Icon(Icons.location_on_rounded, color: Colors.green,),
                      // ),
                      SizedBox(width: 2,),

                      Expanded(
                          child: Text('Situé dans ville dans la commune de Limeté Qartier Mososo Devant le boulevard Lumumba', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),)),
                    ],
                  )

                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 100,
              height: 30,
              color: const Color(0xFFFFEDF1),
              child: const Center(child: Text("Plus d'info", style: TextStyle(color: Color(0xFFF6426C), fontSize: 10),)),
            ),


            const SizedBox(height: 20,),
            const SchoolProfile()
          ]

      ),


    );
  }
}

