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

class AuthError {
  AuthError({
    this.name,
    this.message,
    this.status,
    this.errors,
  });

  String? name;
  String? message;
  int? status;
  List<dynamic>? errors;

  factory AuthError.fromJson(Map<String, dynamic> json) => AuthError(
    name: json["name"],
    message: json["message"],
    status: json["status"],
    errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "message": message,
    "status": status,
    "errors": errors == null ? null : List<dynamic>.from(errors!.map((x) => x)),
  };
}
