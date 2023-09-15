import 'dart:convert';

import 'package:messaging_app/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load POSTS');
    }
  }

  Future<Map<String, dynamic>> updatePost(
      String id, String title, String body) async {
    final sendingData = {'title': title, 'body': body};
    try {
      final request = await http.put(
        Uri.parse(
          '$baseUrl/posts/$id',
        ),
        headers: {'Accept': 'application/json'},
        body: json.encode(sendingData),
      );
      if (request.statusCode == 200 || request.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(request.body);
        return responseData;
      } else {
        return {};
      }
    } catch (e) {
      print(e);
      throw Future.error(e);
    }
  }

  Future<dynamic> deletePost(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/posts/$id'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return jsonData;
    } else {
      throw Exception('Failed to load POSTS');
    }
  }

  Future<Post> getPostId() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("Data found********************************************");

      return Post.fromJson(jsonData);
    } else {
      print("Data not found********************************************");
      throw Exception('Failed to load POSTS');
    }
  }
}
