// To parse this JSON data, do
//
//     final nearByListDetailsModel = nearByListDetailsModelFromJson(jsonString);

import 'dart:convert';

NearByListDetailsModel nearByListDetailsModelFromJson(String str) =>
    NearByListDetailsModel.fromJson(json.decode(str));

String nearByListDetailsModelToJson(NearByListDetailsModel data) =>
    json.encode(data.toJson());

class NearByListDetailsModel {
  NearByListDetailsModel({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  int statusCode;
  String status;
  String message;
  Data data;

  factory NearByListDetailsModel.fromJson(Map<String, dynamic> json) =>
      NearByListDetailsModel(
        statusCode: json["statusCode"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
     this.email,
    this.businessHours,
     this.categories,
     this.categoriesRef,
     this.firebaseToken,
     this.isExist,
     this.isOtpVerified,
     this.isRegistered,
     this.notificationCount,
     this.profileImage,
     this.rating,
     this.referalCode,
     this.screen,
     this.socialLinks,
     this.socketStatus,
     this.status,
     this.timezone,
     this.uname,
     this.videos,
     this.bio,
     this.listingName,
     this.mainServices,
     this.address,
     this.city,
     this.coordinates,
     this.mobileNumber,
     this.websiteLink,
     this.youtubeUrl,
    this.reviewsRating,
  });

  String id;
  String? email;
  List<BusinessHour>? businessHours;
  List<String>? categories;
  List<CategoriesRef>? categoriesRef;
  String? firebaseToken;
  bool? isExist;
  bool? isOtpVerified;
  bool? isRegistered;
  int? notificationCount;
  String? profileImage;
  int? rating;
  String? referalCode;
  String? screen;
  SocialLinks? socialLinks;
  String? socketStatus;
  String? status;
  String? timezone;
  String? uname;
  List<String>? videos;
  String? bio;
  String? listingName;
  String? mainServices;
  String? address;
  String? city;
  Coordinates? coordinates;
  String? mobileNumber;
  String? websiteLink;
  String? youtubeUrl;
  List<ReviewsRating>? reviewsRating;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        email: json["email"],
        businessHours: List<BusinessHour>.from(json["businessHours"].map((x) => BusinessHour.fromJson(x))),
        categories: List<String>.from(json["categories"].map((x) => x)),
        categoriesRef: List<CategoriesRef>.from(
            json["categoriesRef"].map((x) => CategoriesRef.fromJson(x))),
        firebaseToken: json["firebaseToken"],
        isExist: json["isExist"],
        isOtpVerified: json["isOTPVerified"],
        isRegistered: json["isRegistered"],
        notificationCount: json["notificationCount"],
        profileImage: json["profileImage"],
        rating: json["rating"],
        referalCode: json["referalCode"],
        screen: json["screen"],
        socialLinks: SocialLinks.fromJson(json["socialLinks"]),
        socketStatus: json["socketStatus"] == null ? '' : json["socketStatus"],
        status: json["status"] == null ? '' : json["status"],
        timezone: json["timezone"] == null ? '' : json["timezone"],
        uname: json["uname"] == null ? '' : json["uname"] ,
        videos: List<String>.from(json["videos"].map((x) => x)),
        bio: json["bio"] == null ? '' :  json["bio"],
        listingName: json["listingName"] == null ? '' :  json["listingName"],
        mainServices: json["mainServices"] == null ? '' : json["mainServices"],
        address: json["address"],
        city: json["city"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        mobileNumber: json["mobileNumber"],
        websiteLink: json["websiteLink"],
        youtubeUrl: json["youtubeUrl"],
        reviewsRating: List<ReviewsRating>.from(json["reviewsRating"].map((x) => ReviewsRating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "businessHours":
            List<dynamic>.from(businessHours!.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "categoriesRef":
            List<dynamic>.from(categoriesRef!.map((x) => x.toJson())),
        "firebaseToken": firebaseToken,
        "isExist": isExist,
        "isOTPVerified": isOtpVerified,
        "isRegistered": isRegistered,
        "notificationCount": notificationCount,
        "profileImage": profileImage,
        "rating": rating,
        "referalCode": referalCode,
        "screen": screen,
        "socialLinks": socialLinks!.toJson(),
        "socketStatus": socketStatus,
        "status": status,
        "timezone": timezone,
        "uname": uname,
        "videos": List<dynamic>.from(videos!.map((x) => x)),
        "bio": bio,
        "listingName": listingName,
        "mainServices": mainServices,
        "address": address,
        "city": city,
        "coordinates": coordinates!.toJson(),
        "mobileNumber": mobileNumber,
        "websiteLink": websiteLink,
        "youtubeUrl": youtubeUrl,
        "reviewsRating": List<dynamic>.from(reviewsRating!.map((x) => x.toJson())),
  };
}

class FromBusiness {
  FromBusiness({
    this.id,
    this.profileImage,
    this.uname,
  });

  String? id;
  String? profileImage;
  String? uname;

  factory FromBusiness.fromJson(Map<String, dynamic> json) => FromBusiness(
    id: json["_id"],
    profileImage: json["profileImage"],
    uname: json["uname"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profileImage": profileImage,
    "uname": uname,
  };
}
  class ReviewsRating {
  ReviewsRating({
    this.id,
    this.fromBusiness,
    this.toBusiness,
    this.createdAt,
    this.rating,
    this.review,
    this.updatedAt,
  });

  String? id;
  FromBusiness? fromBusiness;
  String? toBusiness;
  DateTime? createdAt;
  int? rating;
  String? review;
  DateTime? updatedAt;

  factory ReviewsRating.fromJson(Map<String, dynamic> json) => ReviewsRating(
    id: json["_id"],
    fromBusiness: FromBusiness.fromJson(json["fromBusiness"]),
    toBusiness: json["toBusiness"],
    createdAt: DateTime.parse(json["createdAt"]),
    rating: json["rating"],
    review: json["review"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fromBusiness": fromBusiness!.toJson(),
    "toBusiness": toBusiness,
    "createdAt": createdAt!.toIso8601String(),
    "rating": rating,
    "review": review,
    "updatedAt": updatedAt!.toIso8601String(),
  };
}


class BusinessHour {
  BusinessHour({
     this.day,
     this.open,
     this.close,
     this.isSelected,
     this.id,
  });

  String? day;
  String? open;
  String? close;
  String? isSelected;
  String? id;

  factory BusinessHour.fromJson(Map<String, dynamic> json) => BusinessHour(
        day: json["day"],
        open: json["open"],
        close: json["close"],
        isSelected: json["isSelected"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "open": open,
        "close": close,
        "isSelected": isSelected,
        "_id": id,
      };
}

class CategoriesRef {
  CategoriesRef({
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
        "createdAt": createdAt!.toIso8601String(),
        "image": image,
        "name": name,
        "updatedAt": updatedAt!.toIso8601String(),
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

class SocialLinks {
  SocialLinks({
    required this.linkedIn,
    required this.twitter,
    required this.facebook,
    required this.instagram,
  });

  String linkedIn;
  String twitter;
  String facebook;
  String instagram;

  factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
        linkedIn: json["LinkedIn"],
        twitter: json["Twitter"],
        facebook: json["Facebook"],
        instagram: json["Instagram"],
      );

  Map<String, dynamic> toJson() => {
        "LinkedIn": linkedIn,
        "Twitter": twitter,
        "Facebook": facebook,
        "Instagram": instagram,
      };
}
