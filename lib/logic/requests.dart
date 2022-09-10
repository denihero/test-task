import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/logic/model/auth_model.dart';
import 'package:test_task/logic/model/restaurant.dart';
import 'package:test_task/logic/string.dart';

Future<void> register(
    String email, String nickname, String phone, String password) async {
  var response = await http.post(
      Uri.parse('${Api.api}/api/v1/auth/registration/customer/new'),
      body: {
        "email": email,
        "nickname": nickname,
        "phone": phone,
        "password": password
      });

  if (response.statusCode >= 400) throw jsonDecode(response.body)['message'];
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
}

Future<Auth> loginViaEmail(String email, String password) async {

  var response = await http.post(Uri.parse('${Api.api}/api/v1/auth/login'),
      body: {"email": email, "password": password});
  final data = jsonDecode(response.body);
  if (response.statusCode >= 400) throw jsonDecode(response.body)['message'];
  if (response.statusCode == 200) {
    return Auth.fromJson(data);
  }

  return Auth.fromJson(data);
}

Future<Auth> loginViaNickname(String nickname, String password) async {


  var response = await http.post(Uri.parse('${Api.api}/api/v1/auth/login'),
      body: {"nickname": nickname, "password": password});
  final data = jsonDecode(response.body);
  if (response.statusCode >= 400) throw jsonDecode(response.body)['message'];
  if (response.statusCode == 200) {
    return Auth.fromJson(data);
  }

  return Auth.fromJson(data);
}

Future<RestaurantInfo> fetchRestaurant(String token) async {

  var response = await http.get(
      Uri.parse('${Api.api}/api/v1/restaurants/all?page=1&perPage=10'),
      headers: {
        'Authorization': 'Bearer $token',
      });
  final data = jsonDecode(response.body);
  if (response.statusCode >= 400) throw UnimplementedError();
  if (response.statusCode == 200) {
    return RestaurantInfo.fromJson(data);
  }

  return RestaurantInfo.fromJson(data);
}

Future<RestaurantInfo> fetchFavourite(String token) async{
  List<Restaurant> ls = [];
  var response = await http.get(Uri.parse('${Api.api}/api/v1/likes/all'), headers: {
    'Authorization': 'Bearer $token',
  });

  final data = jsonDecode(response.body);
  if (response.statusCode >= 400) throw UnimplementedError();
  if (response.statusCode == 200) {
    return RestaurantInfo.fromJson(data);
  }

  return RestaurantInfo.fromJson(data);

}
Future<Profile> fetchProfile(String token) async {
  var response = await http
      .get(Uri.parse('${Api.api}/api/v1/auth/login/profile'), headers: {
    'Authorization': 'Bearer $token',
  });
  final data = jsonDecode(response.body);
  if (response.statusCode >= 400) throw UnimplementedError();
  if (response.statusCode == 200) {
    return Profile.fromJson(data);
  }
  return Profile.fromJson(data);
}

