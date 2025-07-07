import 'package:flutter/material.dart';
import 'package:startup/models/university_posts.dart';
import 'package:startup/views/universities/profile.dart';
import '../services/university_search.dart';

class UniversitySearch extends StatefulWidget {
  const UniversitySearch({super.key});

  @override
  State<UniversitySearch> createState() => _UniversitySearchState();
}

class _UniversitySearchState extends State<UniversitySearch> {
  String? selectedCity;
  TextEditingController facultyController = TextEditingController();
  List<Post> results = [];

  List<String> cities = [
    'Kinshasa',
    'Lubumbashi',
    'Goma',
    'Kisangani',
    'Bukavu',
    'Mbuji-Mayi',
  ];

  void search() async {
    try {
      final data = await fetchUniversities(
        ville: selectedCity ?? '',
        faculty: facultyController.text,
      );
      setState(() {
        results = data;
      });
    } catch (e) {
      setState(() {
        results = [];
      });
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('No Results'),
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                value: selectedCity,
                decoration: const InputDecoration(
                  labelText: 'Ville',
                  border: OutlineInputBorder(),
                ),
                items: cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: facultyController,
                decoration: const InputDecoration(
                  hintText: "Faculty",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 12),
            ElevatedButton(onPressed: search, child: const Text("Search")),

            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final Post post = results[index];
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
                              color: Color(0xFFF8FAFB),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "http://172.16.113.64:8000/images/university/logo/${post.image}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.nom,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      post.type == 'university'
                                          ? 'Université ${post.typeEtablissement}'
                                          : 'École ${post.typeEtablissement}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      post.ville,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
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
      ),
    );
  }
}
