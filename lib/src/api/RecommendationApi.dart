import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarth_app/src/api/util/ApiConsts.dart';

abstract class RecommendationApi {
  Future<List<Recommendation>> getRecommendations(BuildContext context);
}

class RecommendationService implements RecommendationApi {
  Future<List<Recommendation>> processRecommendationRequest(
      BuildContext context) async {
    //load details
    return await getRecommendations(context);
  }

  Future<List<Recommendation>> getRecommendations(BuildContext context) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "/getRecommendations";

    return await http.get(
      Uri.encodeFull(url),
      headers: <String, String>{"Content-Type": "application/json"},
    ).then((http.Response response) {
      List<Recommendation> list =
          (jsonDecode(response.body)['recommendations'] as List)
              .map((value) => Recommendation.fromJson(value))
              .toList();
      return list;
    });
  }
}

class Recommendation {
  Recommendation({
    this.step,
    this.title,
    this.message,
  });

  final int step;
  final String title;
  final String message;

  factory Recommendation.fromJson(Map<String, dynamic> parsedJson) {
    return Recommendation(
      step: parsedJson['id'],
      title: parsedJson['message'],
      message: parsedJson['title'],
    );
  }
}
