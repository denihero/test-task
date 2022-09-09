import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/logic/string.dart';


Future<void> register(String email,String nickname,String phone,String password) async {
  var response = await http.post(Uri.parse('${Api.api}/api/v1/auth/registration/customer/new'),
      body:{
        "email": email,
        "nickname": nickname,
        "phone": phone,
        "password": password
      });

  if(response.statusCode >= 400) throw jsonDecode(response.body)['message'];
  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }
}

Future<void> loginViaEmail(String email,String password) async{
    var response = await http.post(Uri.parse('${Api.api}/api/v1/auth/login'),body: {
      "email": email,
      "password": password
    });

    if(response.statusCode >= 400) throw jsonDecode(response.body)['message'];
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
}
Future<void> loginViaNickname(String nickname,String password) async{
  var response = await http.post(Uri.parse('${Api.api}/api/v1/auth/login'),body: {
    "nickname": nickname,
    "password": password
  });

  if(response.statusCode >= 400) throw jsonDecode(response.body)['message'];
  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }
}