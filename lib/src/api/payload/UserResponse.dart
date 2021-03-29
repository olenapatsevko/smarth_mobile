import 'package:smarth_app/src/api/RecommendationApi.dart';

import 'BaseResponse.dart';

class UserResponse extends BaseResponse {
  final String id;
  final String email;
  final String password;
  final List<Recommendation> recommendations;

  //todo: define all needed fields

  UserResponse({this.id, this.email, this.password, this.recommendations})
      : super.name('', '');

  factory UserResponse.fromJson(Map<String, dynamic> parsedJson) {
    return UserResponse(
        id: parsedJson['id'].toString(),
        email: parsedJson['email'],
        password: parsedJson['password'],
        recommendations: parsedJson['recommendations']);
  }

  factory UserResponse.parseErrorResponse(Map<String, dynamic> json) {
    UserResponse response = UserResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}
