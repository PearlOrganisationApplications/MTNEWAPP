import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Model/ViweTable.dart';
import '../Model/table.dart';

class ApiServicesApp{
  // Future<String?> getToken() async {
  //
  //   return
  // }


 static Future <ViweTeble> apiCallTaskLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = Uri.parse('https://test.pearl-developer.com/mt/public/api/getTask');
    Map dataa = {
      'token': prefs.getString('token'),

    };
print("${dataa}");
    var response = await http.post(url, body: dataa);
    // token = Easy.fromJson(json.decode(response.body)).token;
    // Easy().setToken(token);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return ViweTeble.fromJson(jsonDecode(response.body));


  }
}


