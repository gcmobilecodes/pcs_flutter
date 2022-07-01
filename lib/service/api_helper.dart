import 'package:pcs/utils/app_keys.dart';
import '../utils/SharedPref.dart';

var id = SharedPref.getInstance()!.getStringValuesSF(AppKeys.loginId);
nearByParams(wid) {
  final params = {
    'businessId' : id,
    "currentLocation": {"lat": 30.90, "log": 70.45},
    "categories": [wid.toString()]
  };
  return params;
}

nearByDetailParams() {
  final params = {"businessId": id};
  return params;
}
