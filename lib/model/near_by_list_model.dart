// To parse this JSON data, do
//
//     final nearByModel = nearByModelFromJson(jsonString);

import 'dart:convert';

NearByModel nearByModelFromJson(String str) =>
    NearByModel.fromJson(json.decode(str));

String nearByModelToJson(NearByModel data) => json.encode(data.toJson());

class NearByModel {
  NearByModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  int statusCode;
  String status;
  String message;
  List<Datum> data;

  factory NearByModel.fromJson(Map<String, dynamic> json) => NearByModel(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.businessLocation,
    required this.categoriesRef,
    required this.uname,
    required this.listingName,
    required this.coordinates,
  });

  String id;
  BusinessLocation businessLocation;
  List<CategoriesRef> categoriesRef;
  String uname;
  String listingName;
  Coordinates coordinates;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        businessLocation: BusinessLocation.fromJson(json["businessLocation"]),
        categoriesRef: List<CategoriesRef>.from(
            json["categoriesRef"].map((x) => CategoriesRef.fromJson(x))),
        uname: json["uname"],
        listingName: json["listingName"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "businessLocation": businessLocation.toJson(),
        "categoriesRef":
            List<dynamic>.from(categoriesRef.map((x) => x.toJson())),
        "uname": uname,
        "listingName": listingName,
        "coordinates": coordinates.toJson(),
      };
}

class BusinessLocation {
  BusinessLocation({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory BusinessLocation.fromJson(Map<String, dynamic> json) =>
      BusinessLocation(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class CategoriesRef {
  CategoriesRef({
    required this.id,
    required this.nameWithoutSpace,
    required this.createdAt,
    required this.image,
    required this.name,
    required this.updatedAt,
  });

  String id;
  String nameWithoutSpace;
  DateTime createdAt;
  String image;
  String name;
  DateTime updatedAt;

  factory CategoriesRef.fromJson(Map<String, dynamic> json) => CategoriesRef(
        id: json["_id"],
        nameWithoutSpace: json["nameWithoutSpace"],
        createdAt: DateTime.parse(json["createdAt"]),
        image: json["image"],
        name: json["name"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nameWithoutSpace": nameWithoutSpace,
        "createdAt": createdAt.toIso8601String(),
        "image": image,
        "name": name,
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Coordinates {
  Coordinates({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
