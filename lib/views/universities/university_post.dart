import 'package:flutter/material.dart';

import '../../models/university_posts.dart';
class UniversityPost extends StatefulWidget {
  final Post university;
  const UniversityPost({super.key, required this.university});

  @override
  State<UniversityPost> createState() => _UniversityPostState();
}

class _UniversityPostState extends State<UniversityPost> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: widget.university.unimages.length,
        itemBuilder: (context, index) {
          final unimage = widget.university.unimages[index];
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
                    child: Image.network(
                      "http://172.16.117.145:8000/images/universityposts/${unimage.image}",
                      fit: BoxFit.cover,
                    ),
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
