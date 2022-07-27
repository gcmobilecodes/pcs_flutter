import 'dart:convert';
/// statusCode : 200
/// message : "Register successfully"
/// data : {"name":"nnmmmm","mobile_number":"7018819931","employee_id":"104","user_type":"1","device_type":null,"device_token":null,"profile_pic":"/storage/uploads/gc.jpg","updated_at":"2022-07-20T14:50:42.000000Z","created_at":"2022-07-20T14:50:42.000000Z","id":26}

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));
String signupModelToJson(SignupModel data) => json.encode(data.toJson());
class SignupModel {
  SignupModel({
      int? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  SignupModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  Data? _data;
SignupModel copyWith({  int? statusCode,
  String? message,
  Data? data,
}) => SignupModel(  statusCode: statusCode ?? _statusCode,
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

/// name : "nnmmmm"
/// mobile_number : "7018819931"
/// employee_id : "104"
/// user_type : "1"
/// device_type : null
/// device_token : null
/// profile_pic : "/storage/uploads/gc.jpg"
/// updated_at : "2022-07-20T14:50:42.000000Z"
/// created_at : "2022-07-20T14:50:42.000000Z"
/// id : 26

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? name, 
      String? mobileNumber, 
      String? employeeId, 
      String? userType, 
      dynamic deviceType, 
      dynamic deviceToken, 
      String? profilePic, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _name = name;
    _mobileNumber = mobileNumber;
    _employeeId = employeeId;
    _userType = userType;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _profilePic = profilePic;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _mobileNumber = json['mobile_number'];
    _employeeId = json['employee_id'];
    _userType = json['user_type'];
    _deviceType = json['device_type'];
    _deviceToken = json['device_token'];
    _profilePic = json['profile_pic'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _mobileNumber;
  String? _employeeId;
  String? _userType;
  dynamic _deviceType;
  dynamic _deviceToken;
  String? _profilePic;
  String? _updatedAt;
  String? _createdAt;
  int? _id;
Data copyWith({  String? name,
  String? mobileNumber,
  String? employeeId,
  String? userType,
  dynamic deviceType,
  dynamic deviceToken,
  String? profilePic,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  name: name ?? _name,
  mobileNumber: mobileNumber ?? _mobileNumber,
  employeeId: employeeId ?? _employeeId,
  userType: userType ?? _userType,
  deviceType: deviceType ?? _deviceType,
  deviceToken: deviceToken ?? _deviceToken,
  profilePic: profilePic ?? _profilePic,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get name => _name;
  String? get mobileNumber => _mobileNumber;
  String? get employeeId => _employeeId;
  String? get userType => _userType;
  dynamic get deviceType => _deviceType;
  dynamic get deviceToken => _deviceToken;
  String? get profilePic => _profilePic;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['mobile_number'] = _mobileNumber;
    map['employee_id'] = _employeeId;
    map['user_type'] = _userType;
    map['device_type'] = _deviceType;
    map['device_token'] = _deviceToken;
    map['profile_pic'] = _profilePic;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}