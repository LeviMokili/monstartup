import 'package:flutter/material.dart';
import 'package:startup/views/home.dart';
import 'package:startup/views/schools/school_post.dart';
import 'package:startup/views/universities/university_post.dart';

class UniversityProfile extends StatefulWidget {
  const UniversityProfile({super.key});

  @override
  State<UniversityProfile> createState() => _UniversityProfileState();
}

class _UniversityProfileState extends State<UniversityProfile> {
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
                    width: double.infinity,);


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
          const UniversityPost()

        ],
      ),
    );
  }
}
