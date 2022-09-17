import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class RestaurantInfo {
  RestaurantInfo({
    this.count,
    this.restaurants,
  });

  int? count;
  List<Restaurant>? restaurants;

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) => _$RestaurantInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantInfoToJson(this);
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
        isFavourite: json["is_favourite"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        scheduleId: json["schedule_id"],
        coordsId: json["coords_id"],
        userId: json["user_id"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        coords: json["coords"] == null ? null : Coords.fromJson(json["coords"]),
        images: json["images"] == null
            ? null
            : List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "is_favourite": isFavourite,
        "id": id,
        "title": title,
        "description": description,
        "schedule_id": scheduleId,
        "coords_id": coordsId,
        "user_id": userId,
        "schedule": schedule?.toJson(),
        "coords": coords?.toJson(),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "user": user?.toJson(),
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
        id: json["id"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
        addressName: json["address_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "longitude": longitude,
        "latitude": latitude,
        "address_name": addressName,
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
        id: json["id"],
        url: json["url"],
        restaurantId: json["restaurant_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "restaurant_id": restaurantId,
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
        id: json["id"],
        opening: json["opening"],
        closing: json["closing"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "opening": opening,
        "closing": closing,
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
