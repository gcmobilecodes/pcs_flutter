// To parse this JSON data, do
//
//     final daysAddModel = daysAddModelFromJson(jsonString);

import 'dart:convert';

DaysAddModel daysAddModelFromJson(String str) =>
    DaysAddModel.fromJson(json.decode(str));

String daysAddModelToJson(DaysAddModel data) => json.encode(data.toJson());

class DaysAddModel {
  DaysAddModel({
    required this.businessId,
    required this.businessHours,
    required this.mobileNumber,
    required this.address,
    required this.city,
    required this.websiteLink,
    required this.lat,
    required this.lng,
  });

  String businessId;
  List<BusinessHour> businessHours;
  String mobileNumber;
  String address;
  String city;
  String websiteLink;
  double lat;
  double lng;

  factory DaysAddModel.fromJson(Map<String, dynamic> json) => DaysAddModel(
        businessId: json["businessId"],
        businessHours: List<BusinessHour>.from(
            json["businessHours"].map((x) => BusinessHour.fromJson(x))),
        mobileNumber: json["mobileNumber"],
        address: json["address"],
        city: json["city"],
        websiteLink: json["websiteLink"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "businessId": businessId,
        "businessHours":
            List<dynamic>.from(businessHours.map((x) => x.toJson())),
        "mobileNumber": mobileNumber,
        "address": address,
        "city": city,
        "websiteLink": websiteLink,
        "lat": lat,
        "lng": lng,
      };
}

class BusinessHour {
  BusinessHour({
    required this.day,
    required this.open,
    required this.close,
    required this.isSelected,
  });

  String day;
  String open;
  String close;
  bool isSelected;

  factory BusinessHour.fromJson(Map<String, dynamic> json) => BusinessHour(
        day: json["day"],
        open: json["open"],
        close: json["close"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "open": open,
        "close": close,
        "isSelected": isSelected,
      };
}
