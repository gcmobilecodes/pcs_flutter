// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

CategoryListHome categoryListFromJson(String str) => CategoryListHome.fromJson(json.decode(str));

String categoryListToJson(CategoryListHome data) => json.encode(data.toJson());

class CategoryListHome {
  CategoryListHome({
    this.statusCode,
    this.status,
    this.message,
    this.data,
  });

  int? statusCode;
  String? status;
  String? message;
  Data? data;

  factory CategoryListHome.fromJson(Map<String, dynamic> json) => CategoryListHome(
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
    this.videos,
    this.categories,
  });

  List<Video>? videos;
  List<CategoryT>? categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
    categories: List<CategoryT>.from(json["categories"].map((x) => CategoryT.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "videos": List<dynamic>.from(videos!.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class CategoryT {
  CategoryT({
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

  factory CategoryT.fromJson(Map<String, dynamic> json) => CategoryT(
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
}

class Video {
  Video({
    this.video,
    this.thumbnail,
  });

  String? video;
  String? thumbnail;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    video: json["video"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "video": video,
    "thumbnail": thumbnail,
  };
}
