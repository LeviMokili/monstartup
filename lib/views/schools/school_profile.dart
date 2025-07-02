import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:startup/models/university_posts.dart';
import 'package:startup/views/home.dart';
import 'package:startup/views/schools/school_post.dart';

class SchoolProfile extends StatefulWidget {
  final Post school;
  const SchoolProfile({super.key, required this.school});

  @override
  State<SchoolProfile> createState() => _SchoolProfileState();
}

class _SchoolProfileState extends State<SchoolProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(

      leading: Container(
        margin: const EdgeInsets.all(8.0),
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
            color: Colors.blueGrey, shape: BoxShape.circle),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              "http://172.16.113.64:8000/images/school/logo/${widget.school.image}"),
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
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    context: context, builder: (BuildContext context){
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9, // 90% of screen height
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: [
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const Padding(
                                    padding:  EdgeInsets.only(left: 20),
                                    child:  Text("Informations supplémentaires",
                                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                                    ),
                                  ),

                                  IconButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),


                              const SizedBox(height: 20,),

                             const SizedBox(
                                width: 100,
                                height: 30,
                                // color: const Color(0xFFE6F8EB),
                                child:  Center(
                                  child:  Text(
                                    "##Ecole Conventionnée Catholique",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF2EC456),
                                        fontSize: 12
                                    ),
                                  ),
                                ),
                              ),
                              //
                              const SizedBox(height: 20,),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.directions_rounded, size: 15,color: Colors.white,),
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("Situé dans la commune de Limeté Qartier Mososo Devant le boulevard Lumumba.", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                                  )),
                                ],
                              ),
                              // const SizedBox(height: 20,),
                              // const Padding(
                              //   padding:  EdgeInsets.only(right: 250),
                              //   child:  Text('Contact'),
                              // ),
                              const SizedBox(height: 30,),

                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFFFEDF1),
                                              shape: BoxShape.circle
                                          ),
                                          child: const Icon(
                                            Icons.mail,
                                            size: 15,
                                            color: Color(0xFFF6426C),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'levimp8d@gmail.com',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10,),
                                    Row(
                                      children: [
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFE6F8EB),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                              Icons.mail,
                                              size: 15,
                                              color: Color(0xFF2EC456)
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            '+243 973468606',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20,),
                              const Padding(
                                padding:  EdgeInsets.only(right: 250),
                                child:  Text('Niveaux'),
                              ),
                              const SizedBox(height: 10,),

                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle
                                          ),
                                          child: const Icon(
                                            Icons.pentagon,
                                            size: 15,
                                            color: Color(0xFF5458F6),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Maternel',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10,),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                              Icons.pentagon,
                                              size: 15,
                                              color: Color(0xFF5458F6)
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Primaire',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10,),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                              Icons.pentagon,
                                              size: 15,
                                              color: Color(0xFF5458F6)
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            'Secondaire',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),





                              const SizedBox(height: 30,),

                              const Center(
                                child: Text('Programmes disponible',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300
                                  ),),
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      color: const Color(0xFFF8FAFB),
                                      child: const Center(
                                        child: Text('Science',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                          ),),
                                      ),

                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      color: const Color(0xFFF8FAFB),
                                      child: const Center(
                                        child: Text('Math Physique',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                          ),),
                                      ),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      color: const Color(0xFFF8FAFB),
                                      child: const Center(
                                        child: Text('Cout et Couture',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                          ),),
                                      ),

                                    ),
                                  ),




                                ],
                              ),
                              const SizedBox(height: 10,),


                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      color: const Color(0xFFF8FAFB),
                                      child: const Center(
                                        child: Text('Literaire',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                          ),),
                                      ),

                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      color: const Color(0xFFF8FAFB),
                                      child: const Center(
                                        child: Text('Macanique',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                          ),),
                                      ),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      color: const Color(0xFFF8FAFB),
                                      child: const Center(
                                        child: Text('Sociale',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                          ),),
                                      ),

                                    ),
                                  ),




                                ],
                              ),
                              const SizedBox(height: 30,),

                              const Center(
                                child: Text('Frais Scolaire',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300
                                  ),),
                              ),

                              const SizedBox(height: 20,),
                              Container(
                                width: 300,
                                height: 30,
                                color: const Color(0xFFF8FAFB),
                                child: const Padding(
                                  padding:  EdgeInsets.all(4.0),
                                  child:  Text(
                                    'Science',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('##', style: TextStyle(color: Color(0xFFF6426C)),),
                                        ),



                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Text('Situé dans la commune de Limeté Qartier Mososo Devant le boulevard Lumumba Limeté Qartier Mososo Devant le boulevard Lumumba',
                                        style: TextStyle(fontWeight: FontWeight.w300),),
                                    )


                                  ],
                                ),
                              ),

                              const SizedBox(height: 10,),
                              const SizedBox(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('##', style: TextStyle(color: Color(0xFFF6426C)),),
                                        ),


                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Text('Situé dans la commune de Limeté Qartier Mososo Devant le boulevard Lumumba Limeté Qartier Mososo Devant le boulevard Lumumba',
                                        style: TextStyle(fontWeight: FontWeight.w300),),
                                    )


                                  ],
                                ),
                              ),

                              const SizedBox(height: 20,),
                              Container(
                                width: 300,
                                height: 30,
                                color: const Color(0xFFF8FAFB),
                                child: const Padding(
                                  padding:  EdgeInsets.all(4.0),
                                  child:  Text(
                                    'Faculté de Lettres',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('##', style: TextStyle(color: Color(0xFFF6426C)),),
                                        ),


                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Text('Situé dans la commune de Limeté Qartier Mososo Devant le boulevard Lumumba Limeté Qartier Mososo Devant le boulevard Lumumba',
                                        style: TextStyle(fontWeight: FontWeight.w300),),
                                    )


                                  ],
                                ),
                              ),

                              const SizedBox(height: 10,),
                              const SizedBox(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('##', style: TextStyle(color: Color(0xFFF6426C)),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2),
                                          child: Text("Departement B", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Dure de 4 ans', style: TextStyle(color: Color(0xFFF6426C)),),
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 30),
                                      child: Text('Situé dans la commune de Limeté Qartier Mososo Devant le boulevard Lumumba Limeté Qartier Mososo Devant le boulevard Lumumba',
                                        style: TextStyle(fontWeight: FontWeight.w300),),
                                    )


                                  ],
                                ),
                              ),


                            ],
                          ),
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

          SchoolPost(school: widget.school,)
        ],
      ),
    );
  }
}


