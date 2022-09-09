// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RestaurantCard welcomeFromJson(String str) => RestaurantCard.fromJson(json.decode(str));

String welcomeToJson(RestaurantCard data) => json.encode(data.toJson());

class RestaurantCard {
  RestaurantCard({
    this.count,
    this.restaurants,
  });

  int? count;
  List<Restaurant>? restaurants;

  factory RestaurantCard.fromJson(Map<String, dynamic> json) => RestaurantCard(
    count: json["count"],
    restaurants: json["restaurants"] == null ? null : List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "restaurants": restaurants == null ? null : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };
}

class Restaurant {
  Restaurant({
    this.isFavourite,
    this.id,
    this.title,
    this.description,
    this.scheduleId,
    this.coordsId,
    this.userId,
    this.schedule,
    this.coords,
    this.images,
    this.user,
  });

  bool? isFavourite;
  int? id;
  String? title;
  String? description;
  int? scheduleId;
  int? coordsId;
  int? userId;
  Schedule? schedule;
  Coords? coords;
  List<Images>? images;
  User? user;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    isFavourite: json["is_favourite"] == null ? null : json["is_favourite"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    scheduleId: json["schedule_id"] == null ? null : json["schedule_id"],
    coordsId: json["coords_id"] == null ? null : json["coords_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    schedule: json["schedule"] == null ? null : Schedule.fromJson(json["schedule"]),
    coords: json["coords"] == null ? null : Coords.fromJson(json["coords"]),
    images: json["images"] == null ? null : List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "is_favourite": isFavourite == null ? null : isFavourite,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "schedule_id": scheduleId == null ? null : scheduleId,
    "coords_id": coordsId == null ? null : coordsId,
    "user_id": userId == null ? null : userId,
    "schedule": schedule == null ? null : schedule?.toJson(),
    "coords": coords == null ? null : coords?.toJson(),
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
    "user": user == null ? null : user?.toJson(),
  };
}

class Coords {
  Coords({
    this.id,
    this.longitude,
    this.latitude,
    this.addressName,
  });

  int? id;
  double? longitude;
  double? latitude;
  String? addressName;

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
    id: json["id"] == null ? null : json["id"],
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    addressName: json["address_name"] == null ? null : json["address_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "longitude": longitude == null ? null : longitude,
    "latitude": latitude == null ? null : latitude,
    "address_name": addressName == null ? null : addressName,
  };
}

class Images {
  Images({
    this.id,
    this.url,
    this.restaurantId,
  });

  int? id;
  String? url;
  int? restaurantId;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"] == null ? null : json["id"],
    url: json["url"] == null ? null : json["url"],
    restaurantId: json["restaurant_id"] == null ? null : json["restaurant_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "url": url == null ? null : url,
    "restaurant_id": restaurantId == null ? null : restaurantId,
  };
}

class Schedule {
  Schedule({
    this.id,
    this.opening,
    this.closing,
  });

  int? id;
  String? opening;
  String? closing;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id: json["id"] == null ? null : json["id"],
    opening: json["opening"] == null ? null : json["opening"],
    closing: json["closing"] == null ? null : json["closing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "opening": opening == null ? null : opening,
    "closing": closing == null ? null : closing,
  };
}

class User {
  User({
    this.id,
    this.email,
    this.nickname,
  });

  int? id;
  String? email;
  String? nickname;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    nickname: json["nickname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "nickname": nickname,
  };
}
