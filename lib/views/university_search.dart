import 'package:flutter/material.dart';
import 'package:startup/models/university_posts.dart';

import '../services/university_search.dart';

class UniversitySearch extends StatefulWidget {
  const UniversitySearch({super.key});

  @override
  State<UniversitySearch> createState() => _UniversitySearchState();
}

class _UniversitySearchState extends State<UniversitySearch> {
  TextEditingController villeController = TextEditingController();
  TextEditingController facultyController = TextEditingController();

  List<Post> results = [];

  void search() async {
    try {
      final data = await fetchUniversities(
        ville: villeController.text,
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
            TextField(controller: villeController, decoration: const InputDecoration(hintText: "Ville")),
            TextField(controller: facultyController, decoration: const InputDecoration(hintText: "Faculty")),
            ElevatedButton(onPressed: search, child: const Text("Search")),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final u = results[index];
                  return ListTile(
                    title: Text(u.nom),
                    subtitle: Text('Ville: ${u.ville}'),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
