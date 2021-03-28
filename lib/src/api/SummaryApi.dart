import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarth_app/src/api/util/ApiConsts.dart';

import 'holder/AccountInfoHolder.dart';

abstract class SummaryApi {
  Future<int> getAccountDetails(BuildContext context);
}

class SummaryService implements SummaryApi {
 void processSummaryRequest(BuildContext context) async {
    //load details
    int userResponse = await getAccountDetails(context);
  }

  Future<int> getAccountDetails(BuildContext context) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "/getSummary";

    //use header 'Authorization' to access Spring Security
    //format of header "Authorization":"Basic dsfadsafas:fdsaasfsf"
    Map<String, String> requestBody = new Map<String, String>();
    requestBody['email'] = AccountDetails.email;

    String jsonStr = jsonEncode(requestBody);
    return await http
        .post(Uri.encodeFull(url),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonStr)
        .then((http.Response response) {
      return response.statusCode;
    });
  }
}
