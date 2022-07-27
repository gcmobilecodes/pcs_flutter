import 'dart:convert';
/// statusCode : 200
/// message : "Register successfully"
/// data : {"id":5,"user_id":9,"Restaurant_name":"xyezs","date":"2022-07-27","checkin_time":"12:06:23","checkout_time":"6 pm","checkin_address":"mohali","checkout_address":"mohali","status":2,"created_at":"2022-07-20T07:46:40.000000Z","updated_at":"2022-07-20T07:47:35.000000Z"}

Checkstatusmodel checkstatusmodelFromJson(String str) => Checkstatusmodel.fromJson(json.decode(str));
String checkstatusmodelToJson(Checkstatusmodel data) => json.encode(data.toJson());
class Checkstatusmodel {
  Checkstatusmodel({
      int? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  Checkstatusmodel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  Data? _data;
Checkstatusmodel copyWith({  int? statusCode,
  String? message,
  Data? data,
}) => Checkstatusmodel(  statusCode: statusCode ?? _statusCode,
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

/// id : 5
/// user_id : 9
/// Restaurant_name : "xyezs"
/// date : "2022-07-27"
/// checkin_time : "12:06:23"
/// checkout_time : "6 pm"
/// checkin_address : "mohali"
/// checkout_address : "mohali"
/// status : 2
/// created_at : "2022-07-20T07:46:40.000000Z"
/// updated_at : "2022-07-20T07:47:35.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? userId, 
      String? restaurantName, 
      String? date, 
      String? checkinTime, 
      String? checkoutTime, 
      String? checkinAddress, 
      String? checkoutAddress, 
      int? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _restaurantName = restaurantName;
    _date = date;
    _checkinTime = checkinTime;
    _checkoutTime = checkoutTime;
    _checkinAddress = checkinAddress;
    _checkoutAddress = checkoutAddress;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _restaurantName = json['Restaurant_name'];
    _date = json['date'];
    _checkinTime = json['checkin_time'];
    _checkoutTime = json['checkout_time'];
    _checkinAddress = json['checkin_address'];
    _checkoutAddress = json['checkout_address'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userId;
  String? _restaurantName;
  String? _date;
  String? _checkinTime;
  String? _checkoutTime;
  String? _checkinAddress;
  String? _checkoutAddress;
  int? _status;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? userId,
  String? restaurantName,
  String? date,
  String? checkinTime,
  String? checkoutTime,
  String? checkinAddress,
  String? checkoutAddress,
  int? status,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  restaurantName: restaurantName ?? _restaurantName,
  date: date ?? _date,
  checkinTime: checkinTime ?? _checkinTime,
  checkoutTime: checkoutTime ?? _checkoutTime,
  checkinAddress: checkinAddress ?? _checkinAddress,
  checkoutAddress: checkoutAddress ?? _checkoutAddress,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get userId => _userId;
  String? get restaurantName => _restaurantName;
  String? get date => _date;
  String? get checkinTime => _checkinTime;
  String? get checkoutTime => _checkoutTime;
  String? get checkinAddress => _checkinAddress;
  String? get checkoutAddress => _checkoutAddress;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['Restaurant_name'] = _restaurantName;
    map['date'] = _date;
    map['checkin_time'] = _checkinTime;
    map['checkout_time'] = _checkoutTime;
    map['checkin_address'] = _checkinAddress;
    map['checkout_address'] = _checkoutAddress;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}