import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:startup/models/home_post.dart';

class ApiService {
  static const String apiUrl = "http://192.168.100.4:8000/api/get_all";

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
