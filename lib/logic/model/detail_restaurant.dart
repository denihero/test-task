import 'package:json_annotation/json_annotation.dart';

part 'detail_restaurant.g.dart';

@JsonSerializable()
class DetailRestaurant {
  DetailRestaurant({
    this.restaurant,
  });

  List<Restaurants>? restaurant;

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) => _$DetailRestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$DetailRestaurantToJson(this);
}

class Like {
  Like({
    this.id,
    this.userId,
    this.restaurantId,
    this.restaurant,
  });

  int? id;
  int? userId;
  int? restaurantId;
  Restaurants? restaurant;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        restaurantId:
            json["restaurant_id"] == null ? null : json["restaurant_id"],
        restaurant: json["restaurant"] == null
            ? null
            : Restaurants.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "restaurant_id": restaurantId == null ? null : restaurantId,
        "restaurant": restaurant == null ? null : restaurant?.toJson(),
      };
}

class Restaurants {
  Restaurants({
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
    this.likes,
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
  List<dynamic>? images;
  List<Like>? likes;

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        isFavourite: json["is_favourite"] == null ? null : json["is_favourite"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        scheduleId: json["schedule_id"] == null ? null : json["schedule_id"],
        coordsId: json["coords_id"] == null ? null : json["coords_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        coords: json["coords"] == null ? null : Coords.fromJson(json["coords"]),
        images: json["images"] == null
            ? null
            : List<dynamic>.from(json["images"].map((x) => x)),
        likes: json["likes"] == null
            ? null
            : List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
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
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "likes": likes == null
            ? null
            : List<dynamic>.from(likes!.map((x) => x.toJson())),
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
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
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
