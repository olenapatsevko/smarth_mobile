import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smarth_app/src/api/util/ApiConsts.dart';

import 'holder/AccountInfoHolder.dart';
import 'payload/UserResponse.dart';

abstract class AccountApi {
  Future<UserResponse> getAccountDetails(
      BuildContext context, String username, String password);

  void logout(BuildContext context);
}

class AccountService implements AccountApi {
  Future<bool> processLoginRequest(
      BuildContext context, String username, String password) async {
    bool successfulLogin = false;

    //load details
    UserResponse userResponse =
        await getAccountDetails(context, username, password);

    if (userResponse.errorCode == '') {
      successfulLogin = true;
      populateAccountData(context, userResponse);
    } else {
      successfulLogin = false;
    }
    return successfulLogin;
  }

  Future<UserResponse> getAccountDetails(
      BuildContext context, String username, String password) async {
    var url = ApiConsts.API_APPLICATION_ENDPOINT + "/login";

    username = username.trim();
    password = password.trim();

    //use header 'Authorization' to access Spring Security
    //format of header "Authorization":"Basic dsfadsafas:fdsaasfsf"
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    return await http.get(Uri.encodeFull(url), headers: <String, String>{
      'authorization': basicAuth
    }).then((http.Response response) {
      final int statusCode = response.statusCode;
      var responseBody;

      if (response.body == "") {
        Map<String, dynamic> respWithCodeOnly = Map<String, dynamic>();
        respWithCodeOnly['error'] = statusCode;
        responseBody = respWithCodeOnly;
      } else {
        responseBody = json.decode(response.body);
      }

      if (statusCode == ApiConsts.HTTP_OK) {
        return UserResponse.fromJson(responseBody);
      } else {
        return UserResponse.parseErrorResponse(responseBody);
      }
    });
  }

  void populateAccountData(BuildContext context, UserResponse userResponse) {
    //todo: save all fields to static holder
    AccountDetails.id = userResponse.id;
    AccountDetails.email = userResponse.email;
    AccountDetails.password = userResponse.password;
    AccountDetails.recommendations = userResponse.recommendations;
  }

  void logout(BuildContext context) {
    AccountDetails.clearAll();
  }
}
