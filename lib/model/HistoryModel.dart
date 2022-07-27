import 'dart:convert';
/// statusCode : 200
/// message : "Register successfully"
/// data : {"user_id":2,"Restaurant_name":"abcd","date":"2022-07-15","checkin_time":"18:06:23","checkout_time":"10:06:10","status":2,"updated_at":"2022-07-15T11:46:14.000000Z","created_at":"2022-07-15T11:46:14.000000Z","id":6}

HistoryModel historyModelFromJson(String str) => HistoryModel.fromJson(json.decode(str));
String historyModelToJson(HistoryModel data) => json.encode(data.toJson());
class HistoryModel {
  HistoryModel({
      int? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  HistoryModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  Data? _data;
HistoryModel copyWith({  int? statusCode,
  String? message,
  Data? data,
}) => HistoryModel(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  int? get statusCode => _statusCode;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : 2
/// Restaurant_name : "abcd"
/// date : "2022-07-15"
/// checkin_time : "18:06:23"
/// checkout_time : "10:06:10"
/// status : 2
/// updated_at : "2022-07-15T11:46:14.000000Z"
/// created_at : "2022-07-15T11:46:14.000000Z"
/// id : 6

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? userId, 
      String? restaurantName, 
      String? date, 
      String? checkinTime, 
      String? checkoutTime, 
      int? status, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _userId = userId;
    _restaurantName = restaurantName;
    _date = date;
    _checkinTime = checkinTime;
    _checkoutTime = checkoutTime;
    _status = status;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _restaurantName = json['Restaurant_name'];
    _date = json['date'];
    _checkinTime = json['checkin_time'];
    _checkoutTime = json['checkout_time'];
    _status = json['status'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  int? _userId;
  String? _restaurantName;
  String? _date;
  String? _checkinTime;
  String? _checkoutTime;
  int? _status;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
Data copyWith({  int? userId,
  String? restaurantName,
  String? date,
  String? checkinTime,
  String? checkoutTime,
  int? status,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  userId: userId ?? _userId,
  restaurantName: restaurantName ?? _restaurantName,
  date: date ?? _date,
  checkinTime: checkinTime ?? _checkinTime,
  checkoutTime: checkoutTime ?? _checkoutTime,
  status: status ?? _status,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  int? get userId => _userId;
  String? get restaurantName => _restaurantName;
  String? get date => _date;
  String? get checkinTime => _checkinTime;
  String? get checkoutTime => _checkoutTime;
  int? get status => _status;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['Restaurant_name'] = _restaurantName;
    map['date'] = _date;
    map['checkin_time'] = _checkinTime;
    map['checkout_time'] = _checkoutTime;
    map['status'] = _status;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}