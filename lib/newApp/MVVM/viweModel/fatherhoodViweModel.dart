import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Model/table.dart';

class ApiServices{
  // Future<String?> getToken() async {
  //
  //   return
  // }


  Future <Easy?> apiCallLogin(  { required eat, required sleep,required activity,required you}) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('https://test.pearl-developer.com/mt/public/api/createTask');
    Map dataa = {
      'token': prefs.getString('token'),
      'eat': eat,
      'sleep': sleep,
      'activity': activity,
      'you': you,
    };

    var response = await http.post(url, body: dataa);
    // token = Easy.fromJson(json.decode(response.body)).token;
    // Easy().setToken(token);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final Map<String,dynamic> data = jsonDecode(response.body);

    return Easy(token: data["token"], );
  }
}


