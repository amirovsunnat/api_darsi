import 'dart:convert';
import 'dart:developer';

import 'package:api_darsi/models/post_model.dart';
import 'package:api_darsi/utils/network_constants.dart';
import 'package:api_darsi/utils/typedefs/typedefs.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<Map<String,dynamic>>? getPosts() async {
    final url = Uri.parse(NetworkConstants.POSTS_URL);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return body;
    }
    throw Exception(
        "Postlarni olishda xatolik yuz berdi, iltimos qaytadan urinib ko'ring.\nSizda ayb yo'q bizda ayb.");
  }

  Future<bool> deletePost(String id) async {
    final url = Uri.parse("${NetworkConstants.DELETE_URL}/$id");

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    }
    throw Exception(
        "Postlarni olishda xatolik yuz berdi, iltimos qaytadan urinib ko'ring.\nSizda ayb yo'q bizda ayb.");
  }
}