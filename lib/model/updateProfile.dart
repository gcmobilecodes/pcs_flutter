import 'dart:convert';
/// statusCode : 200
/// message : "User Profile  Updated  successfully"
/// data : {"id":9,"name":"pooja","profile_pic":"/storage/uploads/gc.jpg","mobile_number":"7018819921","employee_id":"104","user_type":1,"device_type":null,"device_token":null,"verify_otp":null,"created_at":"2022-07-20T07:45:00.000000Z","updated_at":"2022-07-20T10:33:44.000000Z"}

UpdateProfile updateProfileFromJson(String str) => UpdateProfile.fromJson(json.decode(str));
String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());
class UpdateProfile {
  UpdateProfile({
      int? statusCode, 
      String? message, 
      Data? data,}){
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  UpdateProfile.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  Data? _data;
UpdateProfile copyWith({  int? statusCode,
  String? message,
  Data? data,
}) => UpdateProfile(  statusCode: statusCode ?? _statusCode,
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

/// id : 9
/// name : "pooja"
/// profile_pic : "/storage/uploads/gc.jpg"
/// mobile_number : "7018819921"
/// employee_id : "104"
/// user_type : 1
/// device_type : null
/// device_token : null
/// verify_otp : null
/// created_at : "2022-07-20T07:45:00.000000Z"
/// updated_at : "2022-07-20T10:33:44.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? name, 
      String? profilePic, 
      String? mobileNumber, 
      String? employeeId, 
      int? userType, 
      dynamic deviceType, 
      dynamic deviceToken, 
      dynamic verifyOtp, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _profilePic = profilePic;
    _mobileNumber = mobileNumber;
    _employeeId = employeeId;
    _userType = userType;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _verifyOtp = verifyOtp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _profilePic = json['profile_pic'];
    _mobileNumber = json['mobile_number'];
    _employeeId = json['employee_id'];
    _userType = json['user_type'];
    _deviceType = json['device_type'];
    _deviceToken = json['device_token'];
    _verifyOtp = json['verify_otp'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _profilePic;
  String? _mobileNumber;
  String? _employeeId;
  int? _userType;
  dynamic _deviceType;
  dynamic _deviceToken;
  dynamic _verifyOtp;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  String? name,
  String? profilePic,
  String? mobileNumber,
  String? employeeId,
  int? userType,
  dynamic deviceType,
  dynamic deviceToken,
  dynamic verifyOtp,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  profilePic: profilePic ?? _profilePic,
  mobileNumber: mobileNumber ?? _mobileNumber,
  employeeId: employeeId ?? _employeeId,
  userType: userType ?? _userType,
  deviceType: deviceType ?? _deviceType,
  deviceToken: deviceToken ?? _deviceToken,
  verifyOtp: verifyOtp ?? _verifyOtp,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get profilePic => _profilePic;
  String? get mobileNumber => _mobileNumber;
  String? get employeeId => _employeeId;
  int? get userType => _userType;
  dynamic get deviceType => _deviceType;
  dynamic get deviceToken => _deviceToken;
  dynamic get verifyOtp => _verifyOtp;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['profile_pic'] = _profilePic;
    map['mobile_number'] = _mobileNumber;
    map['employee_id'] = _employeeId;
    map['user_type'] = _userType;
    map['device_type'] = _deviceType;
    map['device_token'] = _deviceToken;
    map['verify_otp'] = _verifyOtp;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}