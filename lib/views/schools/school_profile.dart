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
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context, builder: (BuildContext contex){
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.9, // 90% of screen height
                          width: double.infinity,
                          child:  Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20,),
                               const Text("Informations suplementaire", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                              const SizedBox(height: 20,),

                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(6.0),
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF7779F8),
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  const Text('Ecole Conventionnée Catholique'),

                                ]
                              ),


                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('##', style: TextStyle(color: Color(0xFFF6426C)),),
                                  ),
                                  Expanded(child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("Situé dans la commune de Limeté Qartier Mososo Devant le boulevard Lumumba.", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                                  )),
                                ],
                              ),
                              const SizedBox(height: 30,),



                              const Padding(
                                padding: EdgeInsets.only(right: 120),
                                child: Text('Modalité de payement :',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),),
                              ),

                              const SizedBox(height: 10,),
                              const Padding(
                                padding: EdgeInsets.only(right: 240),
                                child: Text('#Martenel'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text('Inspirational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our 300 dollars', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
                              ),

                              const SizedBox(height: 5,),

                              const Padding(
                                padding: EdgeInsets.only(right: 240),
                                child: Text('#Primière'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text('Inspirational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our 300 dollars', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
                              ),

                              const SizedBox(height: 5,),

                              const Padding(
                                padding: EdgeInsets.only(right: 220),
                                child: Text('#Secondaire'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text('Inspirational designs, illustrations, and graphic elements from the world’s best designers.Want more inspiration? Browse our 300 dollars', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
                              ),





                              //SECTION DISPONIBLE

                              const SizedBox(height: 20,),
                              const Padding(
                                padding: EdgeInsets.only(right: 110),
                                child: Text('Programmes disponible :',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(right: 220),
                                child: Text('#Literaire'),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(right: 200),
                                child: Text('#Mecanique'),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(right: 160),
                                child: Text('#Coupe et couture'),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(right: 220),
                                child: Text('#Science'),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(right: 205),
                                child: Text('#Pedagogie'),
                              ),

                            ],
                          ),

                        );


                  }
                  );
                }, icon: const Icon(Icons.remove_red_eye,size: 16,color: Color(0xFFF6426C),),

            ),
          ),
        )
      ],
    ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 320),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const Home()), (route) => false);
                  },
                  icon: const Icon(Icons.arrow_back),

              ),

          ),
          const SizedBox(height: 10,),
          const SchoolPost()

        ],
      ),
    );
  }
}


