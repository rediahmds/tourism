import 'dart:convert';

import 'package:tourism/data/models/tourism_detail_response.dart';
import 'package:tourism/data/models/tourism_list_response.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static const String _baseURL = "https://tourism-api.dicoding.dev";

  Future<TourismListResponse> getTourismList() async {
    final endpoint = "$_baseURL/list";
    final response = await http.get(Uri.parse(endpoint));

    if (isResponseOK(response.statusCode)) {
      return TourismListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Unable to load tourism list");
    }
  }

  Future<TourismDetailResponse> getTourismDetail(int id) async {
    final endpoint = "$_baseURL/detail/$id";
    final response = await http.get(Uri.parse(endpoint));

    if (isResponseOK(response.statusCode)) {
      return TourismDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Unable to fetch tourism detail with id of $id");
    }
  }

  bool isResponseOK(int statusCode) {
    return statusCode == 200 ? true : false;
  }
}