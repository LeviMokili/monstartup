import 'package:flutter/material.dart';
import 'package:startup/constant.dart';
import 'package:startup/models/home_post.dart';
import 'package:startup/views/home.dart';
import 'package:startup/views/universities/university_post.dart';

class SecondPage extends StatelessWidget {
  final Post university;

  const SecondPage({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                "http://172.16.113.204:8000/images/${university.image}"),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text(
                    university.nom,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Text(
                    '${university.ville} République Démocratique du Congo',
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  ),
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
                color: Color(0xFFFFEDF1),
              ),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext contex) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.9, // 90% of screen height
                          width: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.all(10),
                                  children: [
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

                                    SizedBox(
                                      width: 100,
                                      height: 30,
                                      // color: const Color(0xFFE6F8EB),
                                      child:  Center(
                                        child:  Text(
                                          university.typeEtablissement,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF2EC456),
                                              fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
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
                                        Expanded(child: Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Text(university.adresse, style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                                        )),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Column(
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
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Text(
                                                  university.email,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w300
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
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
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Text(
                                                  university.telephone,
                                                  style: const TextStyle(
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

                                    //NIVEAUX
                                    const Padding(
                                      padding:  EdgeInsets.only(right: 250),
                                      child:  Text('Niveaux'),
                                    ),

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
                                                  'Licence',
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
                                                  'Master',
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
                                                  'Doctorat',
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

                                    const SizedBox(height: 50,),

                                    //FACULTIES
                                    const Center(
                                      child: Text('Facultés disponible',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300
                                        ),),
                                    ),
                                   const SizedBox(height: 15,),
                                    SizedBox(
                                      height: 150,
                                      child: GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3, // 3 columns
                                          childAspectRatio: 2, // Adjust aspect ratio
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,

                                        ),
                                        itemCount: university.faculties.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final faculty = university.faculties[index]; // Access each faculty
                                          return Container(
                                            color: const Color(0xFFF8FAFB),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Center(
                                                child: Text(faculty.nom,maxLines: 3,
                                                  style: const TextStyle(fontSize: 12, ),
                                                  ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    const Center(
                                      child: Text('Modalité de paiement',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300
                                        ),),
                                    ),

                                    const SizedBox(height: 15,),
                                    SizedBox(
                                      height: 150,
                                      child: GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1, // 3 columns
                                          childAspectRatio: 4, // Adjust aspect ratio
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 10,

                                        ),
                                        itemCount: university.departements.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final departement = university.departements[index]; // Access each faculty

                                          return Container(
                                            color: const Color(0xFFFFEDF1),
                                            child: Column(
                                              children: [
                                                 Padding(
                                                  padding:  const EdgeInsets.all(8.0),
                                                  child:  Row(
                                                    children: [
                                                      Text('Faculté /${departement.facultyName}',maxLines: 3,
                                                        style:  const TextStyle(fontSize: 12, ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                    Text(departement.nom,maxLines: 3,
                                                       style:  const TextStyle(fontSize: 12, fontWeight: FontWeight.w300 ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Text(departement.duree, style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.red
                                                      ),),

                                                    ],
                                                  ),
                                                ),
                                                 Flexible(child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Text(departement.description,
                                                     maxLines: 2,
                                                     overflow: TextOverflow.visible, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                                                   ),
                                                 ))

                                              ],
                                            ),

                                          );
                                        },
                                      ),
                                    ),


                                  ],
                                ),
                              )
                            ],
                          ),
                          // child: GridView.builder(
                          //   gridDelegate:
                          //       SliverGridDelegateWithFixedCrossAxisCount(
                          //     //
                          //
                          //     crossAxisCount: 3, // 3 columns
                          //     childAspectRatio: 2, // Adjust aspect ratio
                          //     crossAxisSpacing: 10,
                          //     mainAxisSpacing: 10,
                          //   ),
                          //
                          //   itemCount: university.faculties.length,
                          //   // Number of containers
                          //   itemBuilder: (context, index) {
                          //     final faculty = university
                          //         .faculties[index]; // Access each faculty
                          //
                          //     return Container(
                          //         decoration: BoxDecoration(
                          //           border: Border.all(
                          //               color: Colors.black, width: 2),
                          //         ),
                          //         alignment: Alignment.center,
                          //         child: Text(faculty.nom));
                          //   },
                          // ),

                        );
                      });
                },
                icon: const Icon(
                  Icons.remove_red_eye,
                  size: 16,
                  color: Color(0xFFF6426C),
                ),
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
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Home()),
                    (route) => false);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          UniversityPost(university: university)
        ],
      ),
    );
  }
}
