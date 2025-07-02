import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:startup/models/university_posts.dart';


class SchoolPost extends StatefulWidget {
  final Post school;
  const SchoolPost({super.key, required this.school});

  @override
  State<SchoolPost> createState() => _SchoolPostState();
}

class _SchoolPostState extends State<SchoolPost> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemCount: widget.school.schoolimages.length,
        itemBuilder: (context, index) {
          final image = widget.school.schoolimages[index];
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
                      "http://172.16.113.64:8000/images/schoolposts/${image.image}",
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
