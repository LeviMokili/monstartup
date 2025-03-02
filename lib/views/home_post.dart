import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:startup/views/schools/school_profile.dart';
import 'package:startup/views/universities/university_profile.dart';
class HomePost extends StatefulWidget {
  const HomePost({super.key});

  @override
  State<HomePost> createState() => _HomePostState();
}

class _HomePostState extends State<HomePost> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              margin: const EdgeInsets.all(8),

              height: 500,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){

                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const UniversityProfile()), (route) => false);

                    },
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                              shape: BoxShape.circle,

                            ),
                            // child: Image.asset(
                            //   'assets/logo.png', // Replace with your image path
                            //   width: double.infinity,
                            //   height: 300, // Adjust height for better spacing
                            //   fit: BoxFit.cover,
                            // ),

                          ),
                        ),

                        const Column(
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
                            Text('Kinshasa, République démocratique du Congo',
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),)
                          ],
                        )

                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),

                  Container(
                    margin: const EdgeInsets.only(right: 190),
                    height: 20,
                    color: const Color(0xFFFFEDF1),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text('##Conventionnée Catholique',style: TextStyle(fontSize: 8, color: Color(0xFFF6426C)),),
                      ),

                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 330,
                    width: double.infinity,
                    color: Colors.blueGrey,
                    child: Image.asset(
                      'assets/homeposts/post.jpg', // Replace with your image path
                      width: double.infinity,
                      height: 300, // Adjust height for better spacing
                      fit: BoxFit.cover,
                    ),

                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){

                          },
                          child: const LikeButton(
                            size: 25,
                            likeCount:45
                          )
                        ),
                         // const Padding(
                         //   padding: EdgeInsets.only(bottom: 4),
                         //   child: Text('243', style: TextStyle(fontSize: 12),),
                         // ),


                        GestureDetector(
                          onTap: () => showModalBottomSheet(
                            backgroundColor: Colors.white,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.9, // 90% of screen height
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ListView(
                                        padding: const EdgeInsets.all(10),
                                        children: [
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(left: 100),
                                                child: Text(
                                                  "Commentaires",
                                                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 50),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.close,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Comment section


                                          Row(
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.blueGrey,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(width: 10), // Added spacing
                                              const Expanded( // Ensures text does not overflow
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 30),
                                                      child: Row(
                                                        children: [
                                                          Text('levimokili' ,style: TextStyle(
                                                            fontWeight: FontWeight.w400
                                                          ),),
                                                          SizedBox(width: 30,),
                                                          Text('il y a 4 jours', style: TextStyle(
                                                            color: Color(0xFF444444),
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w300
                                                          ),),
                                                        ],
                                                      ),
                                                    ),

                                                    Text(
                                                      "I lobve it even more without the baby hair Let’s start that trend. Frontal lace wigs, zero bady hairee, more natural looking! I’m here for it.",
                                                      overflow: TextOverflow.ellipsis, // Prevents overflow
                                                      maxLines: 20,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w300,
                                                          fontSize: 12
                                                      ),
                                                    )


                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 3),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset('assets/comment_icon.png'),
                            ),
                          ),
                        )



                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  const Padding(
                    padding: EdgeInsets.only(right: 240),
                    child: Text('Il y a  deux jours',
                      style: TextStyle(
                          color: Color(0xFF777070), fontSize: 10),),
                  ),



                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
