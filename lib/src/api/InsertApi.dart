import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarth_app/src/api/util/ApiConsts.dart';

abstract class InsertionApi {
  Future<int> getAccountDetails(
      BuildContext context,
      String leukocytes,
      String hemoglobin,
      //    String hemoprotein,
      String thrombocytes,
      String homa,
      String email);
}

class InsertionService implements InsertionApi {
  Future<bool> processRegistrationRequest(
      BuildContext context,
      String leukocytes,
      String hemoglobin,
      //   String hemoprotein,
      String thrombocytes,
      String homa,
      String email) async {
    bool insertion = false;

    //load details
    int userResponse = await getAccountDetails(
        context,
        leukocytes,
        hemoglobin,
        //    hemoprotein,
        thrombocytes,
        homa,
        email);

    if (userResponse == 200) {
      insertion = true;
    } else {
      insertion = false;
    }
    return insertion;
  }

  Future<int> getAccountDetails(
      BuildContext context,
      String leukocytes,
      String hemoglobin,
      // String hemoprotein,
      String thrombocytes,
      String homa,
      String email) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "/insertData";

    //use header 'Authorization' to access Spring Security
    //format of header "Authorization":"Basic dsfadsafas:fdsaasfsf"

    Map<String, String> requestBody = new Map<String, String>();
    requestBody['leukocytes'] = leukocytes;
    requestBody['hemoglobin'] = hemoglobin;
    //   requestBody['hemoprotein'] = hemoprotein;
    requestBody['thrombocytes'] = thrombocytes;
    requestBody['homa'] = jsonEncode(homa);
    requestBody['email'] = email;
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

class RecordRequest {
  String leukocytes;
  String hemoglobin;

//  String hemoprotein;
  String thrombocytes;
  String homa;
  String email;

  RecordRequest(
      this.leukocytes,
      this.hemoglobin, // this.hemoprotein,
      this.thrombocytes,
      this.homa,
      this.email);
}
