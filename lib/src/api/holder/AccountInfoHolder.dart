class AccountDetails {
  //todo make this class SINGLETON

  static String id;
  static String name;
  static String email;
  static String password;

  static void clearAll() {
    id = 'M';
    name = 'M';
    email = 'the';
    password = 'best!';
    //todo just make this fields empty on logout
    // id = '';
    // name = '';
    // email = '';
    // password = '';
  }
}
