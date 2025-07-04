import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:startup/views/advance_search.dart';
import 'package:startup/views/universities/profile.dart';

import '../models/university_posts.dart';
import 'home.dart';

class LiveSearch extends StatefulWidget {
  const LiveSearch({super.key});

  @override
  State<LiveSearch> createState() => _LiveSearchState();
}

class _LiveSearchState extends State<LiveSearch> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _results = [];

  Future<void> _search(String query) async {
    if (query.isEmpty) {
      setState(() {
        _results = [];
      });
      return;
    }
    final response = await http.get(
      Uri.parse('http://172.16.113.64:8000/api/search?q=$query'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);

      setState(() {
        _results = jsonData
            .map((data) => Post.fromJson(data))
            .toList(); // Ensure correct type
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Home()),
                    (route) => false);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const AdvanceSearch()),
                          (route) => false);
                },
                child: const Column(
                  children: [
                    Text('Recherche avancé', style: TextStyle(fontWeight: FontWeight.w300),),

                  ],
                ),
              ),

              const SizedBox(height: 30,),
              TextField(
                onChanged: _search,
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF8FAFB),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Recherchez...',
                  // Use hintText instead of labelText
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  // Customize hint text
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Border when not focused
                    borderRadius: BorderRadius.circular(10.0),
                    // borderSide: BorderSide.none, // No border
                  ),

                  focusedBorder: OutlineInputBorder(
                    // Border when focused
                    borderRadius: BorderRadius.circular(10.0),
                    // borderSide: BorderSide.none, // No border
                  ),

                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                          onPressed: () {
                            _controller.clear();
                            setState(() {}); // Refresh UI after clearing
                          },
                        )
                      : null,
                ),
              ),



              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _results.length,
                  itemBuilder: (context, index) {
                    final Post post = _results[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
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
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFF8FAFB)),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://172.16.113.64:8000/images/${post.type}/logo/${post.image}"),
                                    // Replace with actual image URL
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 74),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            post.nom,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          '${post.typeInstitue} ${post.typeEtablissement}',
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          post.ville,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.green,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
