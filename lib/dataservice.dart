import 'package:flutter_application_testget/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://dummyjson.com/users';

class DataService {
  Future<Post> fetchData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  deleteUserData(int userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$userId'));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> postData(User? user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}

Future<bool> updateUserData(User user) async {
  final response = await http.put(
    Uri.parse('$baseUrl/${user.id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(user.toJson()),
  );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
