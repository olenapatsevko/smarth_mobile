import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarth_app/src/api/util/ApiConsts.dart';
import 'package:smarth_app/src/dto/bmiresponse.dart';

import 'holder/AccountInfoHolder.dart';

abstract class ProcessApi {
  Future<BMIResponse> getAccountDetails(BuildContext context);
}

class ProcessionService implements ProcessApi {
  Future<BMIResponse> processProcessionRequest(
      BuildContext context, String email) async {
    bool insertion = false;

    //load details
    BMIResponse bmiResponse = await getAccountDetails(
      context,
    );
    return bmiResponse;
  }

  Future<BMIResponse> getAccountDetails(BuildContext context) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "/process";

    Map<String, String> requestBody = new Map<String, String>();
    requestBody['email'] = AccountDetails.email;

    String jsonStr = jsonEncode(requestBody);
    return await http
        .post(Uri.encodeFull(url),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonStr)
        .then((http.Response response) {
      return BMIResponse.fromJson(requestBody);
    });
  }
}
