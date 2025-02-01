// To parse this JSON data, do
//
//     final tourismDetailResponse = tourismDetailResponseFromJson(jsonString);

import 'dart:convert';

import 'package:tourism/data/models/tourism.dart';

TourismDetailResponse tourismDetailResponseFromJson(String str) =>
    TourismDetailResponse.fromJson(json.decode(str));

class TourismDetailResponse {
  bool error;
  String message;
  Tourism place;

  TourismDetailResponse({
    required this.error,
    required this.message,
    required this.place,
  });

  factory TourismDetailResponse.fromJson(Map<String, dynamic> json) =>
      TourismDetailResponse(
        error: json["error"],
        message: json["message"],
        place: Tourism.fromJson(json["place"]),
      );
}
