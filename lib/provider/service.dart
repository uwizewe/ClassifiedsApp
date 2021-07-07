import 'package:http/http.dart' as http;
import 'dart:convert';

import './connect.dart';

class Services {
  static var root = con + 'flutter.php';

  static Future<String> register(
    String name,
    String phone,
    String username,
    String password,
  ) async {
    try {
      String root = con +
          'register?mobile=' +
          phone +
          '&username=' +
          username +
          '&name=' +
          name +
          '&password=' +
          password;
      var map = Map<String, dynamic>();

      map['names'] = name;
      map['mobile'] = phone;
      map['username'] = username;
      map['password'] = password;
      final response = await http.post(Uri.parse(root), body: map);
      print("privius registration");
      print(response.body);

      if (200 == response.statusCode) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<Map<String, dynamic>?> login(
    String username,
    String password,
  ) async {
    try {
      String login =
          con + 'signin?username=' + username + '&password=' + password;
      var map = Map<String, dynamic>();

      map['username'] = username;
      map['password'] = password;
      final response = await http.post(Uri.parse(login), body: map);

      Map<String, dynamic> dats = jsonDecode(response.body);

      if (200 == response.statusCode) {
        return dats;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}

// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.message,
    required this.result,
  });

  String message;
  List<Result> result;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.regnumber,
    required this.name,
    required this.phone,
    required this.username,
    required this.password,
    required this.cdate,
    required this.usertype,
  });

  int id;
  String regnumber;
  String name;
  String phone;
  String username;
  String password;
  DateTime cdate;
  String usertype;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        regnumber: json["regnumber"],
        name: json["name"],
        phone: json["phone"],
        username: json["username"],
        password: json["password"],
        cdate: DateTime.parse(json["cdate"]),
        usertype: json["usertype"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "regnumber": regnumber,
        "name": name,
        "phone": phone,
        "username": username,
        "password": password,
        "cdate":
            "${cdate.year.toString().padLeft(4, '0')}-${cdate.month.toString().padLeft(2, '0')}-${cdate.day.toString().padLeft(2, '0')}",
        "usertype": usertype,
      };
}
