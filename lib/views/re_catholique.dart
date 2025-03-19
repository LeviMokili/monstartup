import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:startup/models/university_posts.dart';
import 'package:startup/services/post_service.dart';
import 'package:startup/services/post_service.dart';
import 'package:startup/views/universities/profile.dart';
class ReCatholique extends StatefulWidget {
  const ReCatholique({super.key});

  @override
  State<ReCatholique> createState() => _ReCatholiqueState();
}

class _ReCatholiqueState extends State<ReCatholique> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = ApiService.fetchPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder<List<Post>>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No Data Found"));
              }
              final posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 500,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(university: post),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      // color: Colors.blueGrey,
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFF9CE34), // Yellow
                                          Color(0xFFEE2A7B), // Pink
                                          Color(0xFF6228D7), // Purple
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2), // Space for border effect
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "http://192.168.1.4:8000/images/${post.image}"), // Replace with actual image URL
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // child: CircleAvatar(
                                    //   radius: 50,
                                    //   backgroundImage: NetworkImage("http://192.168.100.4:8000/images/${post.image}"),
                                    //
                                    // ),


                                    // child: Image.asset(
                                    //   'assets/homeposts/newphoto.jpg', // Replace with your image path
                                    //   width: double.infinity,
                                    //   height: 300, // Adjust height for better spacing
                                    //   fit: BoxFit.cover,
                                    // ),


                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 74),
                                            child: Text(
                                              post.nom,
                                              style: const TextStyle(
                                                  fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${post.ville} /République Démocratique du Congo',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w200),
                                          )
                                        ],
                                      )

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 400,
                            margin: const EdgeInsets.only(right: 120),
                            height: 22,
                            color: const Color(0xFFFFEDF1),

                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  '##${post.typeEtablissement}',
                                  style: const TextStyle(
                                      fontSize: 9, color: Color(0xFFF6426C)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 340,
                            width: double.infinity,
                            color: Colors.blueGrey,
                            child: Image.network(
                              "http://192.168.1.4:8000/images/${post.imageCover}",
                              fit: BoxFit.cover,
                            ),
                            // child: Image.asset(
                            //   'assets/homeposts/post.jpg',
                            //   // Replace with your image path
                            //   width: double.infinity,
                            //   height: 300, // Adjust height for better spacing
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: () {},
                                    child:  const LikeButton(
                                        size: 20, likeCount: 45)),
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
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.9,
                                        // 90% of screen height
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              child: ListView(
                                                padding:
                                                const EdgeInsets.all(10),
                                                children: [
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                        EdgeInsets.only(
                                                            left: 100),
                                                        child: Text(
                                                          "Commentaires",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(left: 50),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
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
                                                        decoration:
                                                        const BoxDecoration(
                                                          color:
                                                          Colors.blueGrey,
                                                          shape:
                                                          BoxShape.circle,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      // Added spacing
                                                      const Expanded(
                                                        // Ensures text does not overflow
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          // Align text to left
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  top: 30),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'levimokili',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                        FontWeight.w400),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 30,
                                                                  ),
                                                                  Text(
                                                                    'il y a 4 jours',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF444444),
                                                                        fontSize:
                                                                        10,
                                                                        fontWeight:
                                                                        FontWeight.w300),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              "I lobve it even more without the baby hair Let’s start that trend. Frontal lace wigs, zero bady hairee, more natural looking! I’m here for it.",
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              // Prevents overflow
                                                              maxLines: 20,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                                  fontSize: 12),
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
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 3),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                          'assets/comment_icon.png'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }));;
  }
}
