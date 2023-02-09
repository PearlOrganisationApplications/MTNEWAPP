import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ApiServices{
 static Future setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  Future <LoginApiResponse> apiCallLogin(  {required name, required age, required date}) async{

    var url = Uri.parse('https://test.pearl-developer.com/mt/public/api/register');
    Map dataa = {
      'name': name,
      'age': age,
      'date': date,
    };

    var response = await http.post(url, body: dataa);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final  Map<String,dynamic> data = jsonDecode(response.body);

    var token =data['token'];
   setToken(token);
    return LoginApiResponse(token: data["token"], error: data["error"]);
  }
}


class LoginApiResponse{
  final String? token;
  final String? error;

  LoginApiResponse({this.token,this.error});

}