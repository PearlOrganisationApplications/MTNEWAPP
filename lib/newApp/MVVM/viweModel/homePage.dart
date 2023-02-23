import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Model/class_Name.dart';

class ApiServicesAppp {
  static Future<NameModel> apiCallUserLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var url =
        Uri.parse('https://test.pearl-developer.com/mt/public/api/getUser');
    Map dataa = {
      'token': prefs.getString('token') ?? '',
    };
    print("${dataa}");
    var response = await http.post(url, body: dataa);
    // token = Easy.fromJson(json.decode(response.body)).token;
    // Easy().setToken(token);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return NameModel.fromJson(jsonDecode(response.body));
  }
}
