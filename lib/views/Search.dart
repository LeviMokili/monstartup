import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSchool = true; // Default: School
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("School/University Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(

              decoration: InputDecoration(labelText: "Enter Name"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isSchool ? "School" : "University"),
                Switch(
                  value: isSchool,
                  onChanged: (value) {
                    setState(() => isSchool = value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){},
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );;
  }
}
