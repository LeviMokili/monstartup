import 'package:flutter/material.dart';
class UniversityPost extends StatefulWidget {
  const UniversityPost({super.key});

  @override
  State<UniversityPost> createState() => _UniversityPostState();
}

class _UniversityPostState extends State<UniversityPost> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    color: Colors.blueGrey,
                    // child: Image.asset(
                    //   'assets/homeposts/post.jpg', // Replace with your image path
                    //   width: double.infinity,
                    //   height: 300, // Adjust height for better spacing
                    //   fit: BoxFit.cover,
                    // ),
                  ),

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
