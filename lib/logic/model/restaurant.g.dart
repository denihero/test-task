// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantInfo _$RestaurantInfoFromJson(Map<String, dynamic> json) =>
    RestaurantInfo(
      count: json['count'] as int?,
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantInfoToJson(RestaurantInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'restaurants': instance.restaurants,
    };
