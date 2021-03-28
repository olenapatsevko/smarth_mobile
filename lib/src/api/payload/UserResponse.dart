import 'BaseResponse.dart';

class UserResponse extends BaseResponse {
  final String id;
  final String email;
  final String password;

  //todo: define all needed fields

  UserResponse({this.id, this.email, this.password}) : super.name('', '');

  factory UserResponse.fromJson(Map<String, dynamic> parsedJson) {
    return UserResponse(
      id: parsedJson['id'].toString(),
      email: parsedJson['email'],
      password: parsedJson['password'],
    );
  }

  factory UserResponse.parseErrorResponse(Map<String, dynamic> json) {
    UserResponse response = UserResponse();
    response.errorCode = json['error'].toString();
    response.errorMessage = json['message'];
    return response;
  }
}
