// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailRestaurant _$DetailRestaurantFromJson(Map<String, dynamic> json) =>
    DetailRestaurant(
      restaurant: (json['restaurant'] as List<dynamic>?)
          ?.map((e) => Restaurants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailRestaurantToJson(DetailRestaurant instance) =>
    <String, dynamic>{
      'restaurant': instance.restaurant,
    };
