import 'dart:convert';

import 'package:startup/models/university_posts.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchUniversities({String? ville, String? faculty}) async {
  final uri = Uri.http(
    '172.16.113.64:8000',
    '/api/universities/search',
    {
      if (ville != null && ville.isNotEmpty) 'ville': ville,
      if (faculty != null && faculty.isNotEmpty) 'faculty': faculty,
    },
  );

  print("Requesting: $uri"); // DEBUGGING PURPOSE

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    return data.map((e) => Post.fromJson(e)).toList();
  } else {
    final body = jsonDecode(response.body);
    throw Exception(body['message'] ?? 'Failed to load universities');
  }
}

