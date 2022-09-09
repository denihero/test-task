import 'dart:convert';

Auth welcomeFromJson(String str) => Auth.fromJson(json.decode(str));

String welcomeToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    this.user,
    this.tokens,
  });

  User? user;
  Tokens? tokens;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    user: User.fromJson(json["user"]),
    tokens: Tokens.fromJson(json["tokens"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "tokens": tokens?.toJson(),
  };
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

class Profile {
  Profile({
    this.id,
    this.email,
    this.nickname,
  });

  int? id;
  String? email;
  String? nickname;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
