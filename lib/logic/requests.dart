import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_task/logic/model/auth_model.dart';
import 'package:test_task/logic/model/detail_restaurant.dart';
import 'package:test_task/logic/model/restaurant.dart';

class DioClient {
  var dio = Dio(BaseOptions(baseUrl: 'http://188.225.83.80:6719'));

  Future<void> register(
      String email, String nickname, String phone, String password) async {
    var response = await dio.post(
        '${BaseOptions().baseUrl}/api/v1/auth/registration/customer/new',
        data: {
          "email": email,
          "nickname": nickname,
          "phone": phone,
          "password": password
        });

    if (response.statusCode! >= 400) throw response.data['message'];
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future<Auth> loginViaEmail(String email, String password) async {
    var response = await dio.post('${BaseOptions().baseUrl}/api/v1/auth/login',
        data: {"email": email, "password": password},
    );
    final data = response.data;
    if (response.statusCode! >= 400) throw jsonDecode(data)['message'];
    if (response.statusCode == 200) {
      return Auth.fromJson(data);
    }

    return Auth.fromJson(data);
  }

  Future<Auth> loginViaNickname(String nickname, String password) async {
    var response = await dio.post('${BaseOptions().baseUrl}/api/v1/auth/login',
        data: {"nickname": nickname, "password": password});
    if (response.statusCode! >= 400) throw response.data['message'];
    if (response.statusCode == 200) {
      return Auth.fromJson(response.data);
    }

    return Auth.fromJson(response.data);
  }

  Future<RestaurantInfo> fetchRestaurant(String token) async {
    var response = await dio.get(
        '${BaseOptions().baseUrl}/api/v1/restaurants/all?page=1&perPage=10',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    final data = response.data;
    if (response.statusCode! >= 400) throw UnimplementedError();
    if (response.statusCode == 200) {
      return RestaurantInfo.fromJson(data);
    }

    return RestaurantInfo.fromJson(data);
  }

  Future<DetailRestaurant> fetchRestaurantDetail(String token, int id) async {
    var response =
        await dio.get('${BaseOptions().baseUrl}/api/v1/restaurants/details/$id',
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));
    final data = response.data;
    if (response.statusCode! >= 400) throw UnimplementedError();
    if (response.statusCode == 200) {
      return DetailRestaurant.fromJson(data);
    }

    return DetailRestaurant.fromJson(data);
  }

  Future<RestaurantInfo> fetchFavourite(String token) async {
    var response = await dio.get('${BaseOptions().baseUrl}/api/v1/likes/all',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));

    final data = response.data;
    if (response.statusCode! >= 400) throw UnimplementedError();
    if (response.statusCode == 200) {
      return RestaurantInfo.fromJson(data);
    }

    return RestaurantInfo.fromJson(data);
  }

  Future<Profile> fetchProfile(String token) async {
    var response =
        await dio.get('${BaseOptions().baseUrl}/api/v1/auth/login/profile',
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));
    final data = response.data;
    if (response.statusCode! >= 400) throw UnimplementedError();
    if (response.statusCode == 200) {
      return Profile.fromJson(data);
    }
    return Profile.fromJson(data);
  }

  Future<void> addToFavourite(String token, int id) async {
    var response = await dio.post('${BaseOptions().baseUrl}/api/v1/likes/new',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
        data: {'restaurant_id': "$id"});
    if (response.statusCode! >= 400) throw response.data['message'];
    if (response.statusCode == 200) {
      return response.data;
    }
  }

  Future<void> deleteFromFavourite(String token, int id) async {
    var response = await dio.delete('${BaseOptions().baseUrl}/api/v1/likes/$id',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    if (response.statusCode! >= 400) throw response.data['message'];
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
