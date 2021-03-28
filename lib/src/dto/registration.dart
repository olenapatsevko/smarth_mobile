class RegistrationRequest {
  String firstName;
  String lastName;
  String username;
  String password;
  bool isMan;
  String birthday;
  int weight;
  int height;
  String email;
  BloodGroup bloodGroup;
  int hip;
  int waist;

  RegistrationRequest(
      this.firstName,
      this.lastName,
      this.username,
      this.password,
      this.isMan,
      this.birthday,
      this.weight,
      this.height,
      this.email,
      this.bloodGroup,
      this.hip,
      this.waist);
}

class RegistrationResponse{
  bool registrationSuccess;
  String error;
  RegistrationResponse(this.registrationSuccess, this.error);
}

enum BloodGroup {
  O_P,
  A_P,
  B_P,
  AB_P,
  O_N,
  A_N,
  B_N,
  AB_N,
}
