import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:startup/models/university_posts.dart';
import 'package:startup/views/universities/profile.dart';
import '../services/university_search.dart';
import 'live_search.dart';

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
    'Mbuji-Mayi',
    'Goma',
    'Bukavu',
    'Kisangani',
    'Kananga',
    'Kolwezi',
    'Matadi',
    'Boma',
    'Likasi',
    'Butembo',
    'Uvira',
    'Bandundu',
    'Beni',
    'Boende',
    'Bunia',
    'Buta',
    'Gemena',
    'Gbadolite'
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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                value: selectedCity,

                decoration: const InputDecoration(
                  labelText: 'Choisisez la Ville',
                  labelStyle: TextStyle(
                    color: Colors.blue, // Change this to any color you want
                    fontWeight: FontWeight.w500,

                  ),
                  border: InputBorder.none,
                  isDense: true, // Makes the field less tall
                  contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
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
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FAFB), // Light gray background
                 // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: facultyController,
                  decoration: const InputDecoration(
                    hintText: "Ecrivez le nom du Faculté",
                    hintStyle: TextStyle(
                      fontSize: 13
                    ),
                    border: InputBorder.none,// Remove default border
                    isDense: true, // Makes the field less tall
                    contentPadding:  EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  ),
                ),
              )

            ),

            const SizedBox(height: 12),
            IconButton(onPressed: search, icon:  Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF8FAFB)
              ),
              child: const Icon(Icons.search, size: 15),
            ),),


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
                                    Text('Université ${post.typeEtablissement}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 8),

                                    Text('/ ${post.ville}'
                                      ,
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
