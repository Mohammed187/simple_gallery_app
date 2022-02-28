import 'dart:convert';
import 'package:flutter_application_1/model/photo.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://picsum.photos/v2/list';

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody) as List;

  return parsed.map<Photo>(
      (json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(baseUrl));

  return parsePhotos(response.body);
}
