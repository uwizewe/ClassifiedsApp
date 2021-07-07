import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  //set data into shared preferences like this
  Future<void> setAuthToken(String names) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('names', names);
  }

//get value from shared preferences
  Future<String?> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String? names = pref.getString("names") ?? null;
    return names;
  }
}
