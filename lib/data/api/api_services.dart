import 'dart:convert';

import 'package:tourism/data/models/tourism_list_response.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static const String _baseURL = "https://tourism-api.dicoding.dev";

  Future<TourismListResponse> getTourismList() async {
    final endpoint = "$_baseURL/list";
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      return TourismListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Unable to load tourism list");
    }
  }

}