import 'dart:convert';

// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) => CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  CategoryList({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  List<SelectCategory>? data;


  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    statusCode: json["statusCode"],
    status: json["status"],
    message: json["message"],
    data: List<SelectCategory>.from(json["data"].map((x) => SelectCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SelectCategory {
  SelectCategory({
    this.id,
    this.nameWithoutSpace,
    this.createdAt,
    this.image,
    this.name,
    this.updatedAt,
  });

  String? id;
  String? nameWithoutSpace;
  DateTime? createdAt;
  String? image;
  String? name;
  DateTime? updatedAt;

  factory SelectCategory.fromJson(Map<String, dynamic> json) => SelectCategory(
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
    "createdAt": createdAt!.toIso8601String(),
    "image": image,
    "name": name,
    "updatedAt": updatedAt!.toIso8601String(),
  };
//   Map<String, dynamic> toJson() => {
//     "_id": id == null ? null : id,
//     "nameWithoutSpace": nameWithoutSpace == null ? null : nameWithoutSpace,
//     "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
//     "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
//     "image": image == null ? null : image,
//     "name": name == null ? null : name,
//   };
}

// Category CategorriesFromJson(String str) => Category.fromJson(json.decode(str));
//
// String CategoriesToJson(Category data) => json.encode(data.toJson());
//
// class Category {
//   Category({
//      this.statusCode,
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   int? statusCode;
//   String? status;
//   String? message;
//   List<CategoryList>? data;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     statusCode: json["statusCode"] == null ? null : json["statusCode"],
//     status: json["status"] == null ? null : json["status"],
//     message: json["message"] == null ? null : json["message"],
//     data: json["data"] == null ? null : List<CategoryList>.from(json["data"].map((x) => CategoryList.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode == null ? null : statusCode,
//     "status": status == null ? null : status,
//     "message": message == null ? null : message,
//     "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }
//
// class CategoryList {
//   CategoryList({
//     this.id,
//     this.nameWithoutSpace,
//     this.createdAt,
//     this.updatedAt,
//     this.image,
//     this.name,
//   });
//
//   String? id;
//   String? nameWithoutSpace;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? image;
//   String? name;
//
//   factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
//     id: json["_id"] == null ? null : json["_id"],
//     nameWithoutSpace: json["nameWithoutSpace"] == null ? null : json["nameWithoutSpace"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     image: json["image"] == null ? null : json["image"],
//     name: json["name"] == null ? null : json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id == null ? null : id,
//     "nameWithoutSpace": nameWithoutSpace == null ? null : nameWithoutSpace,
//     "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
//     "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
//     "image": image == null ? null : image,
//     "name": name == null ? null : name,
//   };
// }
//
//
//
