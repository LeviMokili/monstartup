import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:startup/models/home_post.dart';

class ApiService {
  static const String apiUrl = "http://172.16.111.15:8000/api/getall";

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Post.fromJsonList(data['posts']);
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
