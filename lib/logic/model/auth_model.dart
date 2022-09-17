
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class Auth {
  Auth({
    this.user,
    this.tokens,
  });

  User? user;
  Tokens? tokens;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

class Tokens {
  Tokens({
    this.accessToken,
    this.refreshToken,
  });

  String? accessToken;
  String? refreshToken;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
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
@JsonSerializable()
class Profile {
  Profile({
    this.id,
    this.email,
    this.nickname,
  });

  int? id;
  String? email;
  String? nickname;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
