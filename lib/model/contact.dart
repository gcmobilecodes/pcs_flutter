import 'dart:convert';
/// statusCode : 200
/// message : "send Query sucessfully"
/// data : {"user_id":3,"Query":"hloo  xyz","updated_at":"2022-07-19T11:54:36.000000Z","created_at":"2022-07-19T11:54:36.000000Z","id":1}

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));
String contactToJson(Contact data) => json.encode(data.toJson());
class Contact {
  Contact({
      int? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  Contact.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  Data? _data;
Contact copyWith({  int? statusCode,
  String? message,
  Data? data,
}) => Contact(  statusCode: statusCode ?? _statusCode,
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

/// user_id : 3
/// Query : "hloo  xyz"
/// updated_at : "2022-07-19T11:54:36.000000Z"
/// created_at : "2022-07-19T11:54:36.000000Z"
/// id : 1

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? userId, 
      String? query, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _userId = userId;
    _query = query;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _query = json['Query'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  int? _userId;
  String? _query;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
Data copyWith({  int? userId,
  String? query,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  userId: userId ?? _userId,
  query: query ?? _query,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  int? get userId => _userId;
  String? get query => _query;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['Query'] = _query;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}