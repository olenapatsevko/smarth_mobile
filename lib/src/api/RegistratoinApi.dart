import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarth_app/src/api/util/ApiConsts.dart';

abstract class RegistrationApi {
  Future<int> getAccountDetails(
      BuildContext context,
      String username,
      String password,
      String firstName,
      String lastName,
      bool isMan,
      String birthday,
      String weight,
      String height,
      String email,
      String bloodGroup,
      String hip,
      String waist);
}

class RegistrationService implements RegistrationApi {
  Future<bool> processRegistrationRequest(
      BuildContext context,
      String username,
      String password,
      String firstName,
      String lastName,
      bool isMan,
      String birthday,
      String weight,
      String height,
      String email,
      String bloodGroup,
      String hip,
      String waist) async {
    bool successfulLogin = false;

    //load details
    int userResponse = await getAccountDetails(
        context,
        username,
        password,
        firstName,
        lastName,
        isMan,
        birthday,
        weight,
        height,
        email,
        bloodGroup,
        hip,
        waist);

    if (userResponse == 200) {
      successfulLogin = true;
    } else {
      successfulLogin = false;
    }
    return successfulLogin;
  }

  Future<int> getAccountDetails(
      BuildContext context,
      String username,
      String password,
      String firstName,
      String lastName,
      bool isMan,
      String birthday,
      String weight,
      String height,
      String email,
      String bloodGroup,
      String hip,
      String waist) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "/registration";

    username = username.trim();
    password = password.trim();

    //use header 'Authorization' to access Spring Security
    //format of header "Authorization":"Basic dsfadsafas:fdsaasfsf"

    Map<String, String> requestBody = new Map<String, String>();
    requestBody['username'] = username;
    requestBody['password'] = password;
    requestBody['firstName'] = firstName;
    requestBody['lastName'] = lastName;
    requestBody['isMan'] = isMan.toString();
    requestBody['birthday'] = birthday.toUpperCase();
    requestBody['weight'] = weight.toString();
    requestBody['height'] = height.toString();
    requestBody['bloodGroup'] = bloodGroup.toString();
    requestBody['hip'] = hip.toString();
    requestBody['waist'] = waist.toString();
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
