// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.email,
    this.firebaseToken,
    this.profileImage,
    this.token,
    this.uname,
  });

  String? id;
  String? email;
  String? firebaseToken;
  String? profileImage;
  String? token;
  String? uname;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    email: json["email"],
    firebaseToken: json["firebaseToken"],
    profileImage: json["profileImage"],
    token: json["token"],
    uname: json["uname"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "firebaseToken": firebaseToken,
    "profileImage": profileImage,
    "token": token,
    "uname": uname,
  };
}
