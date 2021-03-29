import 'package:smarth_app/src/api/RecommendationApi.dart';

class AccountDetails {
  //todo make this class SINGLETON

  static String id;
  static String name;
  static String email;
  static String password;
  static List<Recommendation> recommendations;

  static void clearAll() {
    id = 'M';
    name = 'M';
    email = 'the';
    password = 'best!';
    recommendations = null;
    //todo just make this fields empty on logout
    // id = '';
    // name = '';
    // email = '';
    // password = '';
  }
}
