import 'package:dio/dio.dart';
import 'package:pcs/model/contact.dart';
import 'package:pcs/model/updateProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../model/HistoryModel.dart';
import '../model/checkstatusmodel.dart';
import '../model/login_model.dart';
import '../model/signup_model.dart';
import '../utils/app_keys.dart';
import 'dio_client.dart';

class APIService {
  DioClient? dioClient;
  late SharedPreferences shared;
  var token;
  Dio? dio;

  APIService(Dio dio) {
    this.dio = dio;
    dioClient = new DioClient(dio);
  }

  Options accessTokenOptions() {
    Options dioOption = Options(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
     'X-Requested-With': 'XMLHttpRequest',
    });
    return dioOption;
  }

  Options accessTokenWithToken({String? contentType}) {
    getSharedData();
      //var id = SharedPref.getInstance()!.getStringValuesSF(AppKeys.userId);
   //var token = shared.getString(AppKeys.token);

   // print('id  -  $id');
     print('token  -  $token');
    Options dioOption = Options(headers: {
      'Content-Type': contentType ?? 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer " + "",
      'X-Requested-With': 'XMLHttpRequest',
    });
    return dioOption;
  }

  Options accessTokenWithcustomToken(token, {String? contentType}) {
 //   getSharedData();
    //var id = SharedPref.getInstance()!.getStringValuesSF(AppKeys.userId);
    //var token = shared.getString(AppKeys.token);

    // print('id  -  $id');
    print('token  -  $token');
    Options dioOption = Options(headers: {
      'Content-Type': contentType ?? 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer " + token.toString(),
      'X-Requested-With': 'XMLHttpRequest',
    });
    return dioOption;
  }

//   Future<Map> forgotPassword(Map<String, dynamic> params) async {
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/forgotpassword',
//         data: params,
//         options: accessTokenOptions());
//     print('login_response --- ${response.data}');
//     return response.data as Map;
//   }
//
//   // Future<UserDatum> getAccountInfo() async {
//   //   Response response =
//   //   await dioClient!.get(AppUrls.account_info_url);
//   //   return UserDatum.fromJson(response.data as Map);
//   // }


  Future<LoginModel> login(Map<String, dynamic> params) async {
    print('called login');
    Response response = await dioClient!.post(
        'http://18.119.37.224/api/login',
        data: params,
        options: accessTokenOptions());


    print('login_response --- ${response.data}');
    return LoginModel.fromJson(response.data);
  }


  Future<Contact> contactUs(Map<String, dynamic> params, token) async {
    print('called Contactus');
    Response response = await dioClient!.post(
        AppKeys.BASE_URL+AppKeys.Contactus,
        data: params,
        options: accessTokenWithcustomToken(token));


    print('contactus_response --- ${response.data}');
    return Contact.fromJson(response.data);
  }


  Future<Checkstatusmodel> checkin(Map<String, dynamic> params, token) async {
    print('called checked in');
    Response response = await dioClient!.post(
        AppKeys.BASE_URL+AppKeys.checkin,
        data: params,
        options: accessTokenWithcustomToken(token));


    print('login_response --- ${response.data}');
    return Checkstatusmodel.fromJson(response.data);
  }


  Future<SignupModel> register(FormData params) async {
    Response response = await dioClient!.post(
        AppKeys.BASE_URL+AppKeys.register,
        data: params,
        options: accessTokenWithToken(contentType: 'multipart/form-data'));

    print('register_response --- ${response.data}');
    return SignupModel.fromJson(response.data);
  }

  //......................edit profile ........................

  Future<UpdateProfile> updateProfile(FormData params, token) async {
    print('update api');
    Response response = await dioClient!.post(
        AppKeys.BASE_URL+AppKeys.update_profile,
        data: params,
        options: accessTokenWithcustomToken(token,contentType: 'multipart/form-data'));

    print('update_response --- ${response.data}');
    return UpdateProfile.fromJson(response.data);
  }


  //......................get check in /check out status /history api ........................

  Future<HistoryModel> checkstatus(Map<String, dynamic> params, token) async {
    print('history api');
    Response response = await dioClient!.post(
        AppKeys.BASE_URL+AppKeys.history,
        data: params,
        options: accessTokenWithcustomToken(token));

    print('history_response --- ${response.data}');
    return HistoryModel.fromJson(response.data);
  }

  Future getSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(AppKeys.token);

  }
 //  Future<Map> login(Map<String, dynamic> params) async {
 //    print('called login');
 //
 //    Response response = await dioClient!.post(
 //        'http://18.119.37.224/api/login',
 //         data: params);
 //
 //
 // print('login_response --- ${response.data}');
 //    return response.data as Map;
 //  }

  // Future<CategoryList> getCatogory() async {
  //   print('called login');
  //   Response response = await dioClient!.get(
  //       'http://35.153.215.210:5004/api/v1/admin/category/all/list',
  //       options: accessTokenOptions());
  //   print('hhfhfhf ${CategoryList.fromJson(response.data)}');
  //   return CategoryList.fromJson(response.data);
  // }
//
//   Future<CategoryListHome> getHomeListing() async {
//     print('called login');
//     Response response = await dioClient!.get(
//         'http://35.153.215.210:5004/api/v1/business/home',
//         options: accessTokenWithToken());
//     print('hhfhfhf ${response.data}');
//     return CategoryListHome.fromJson(response.data);
//   }
//
//   Future<NearByListDetailsModel> geNearByListingDetails(params) async {
//     print('called login');
//     print('params ---  $params');
//
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/detail',
//         data: params,
//         options: accessTokenWithToken());
//     print('fhfhhfhfkkdk ${response.data}');
//     return NearByListDetailsModel.fromJson(response.data);
//   }
//
//   Future<NearByModel> geNearByList(params) async {
//     print('called login');
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/nearby',
//         data: params,
//         options: accessTokenWithToken());
//     print('hhfhfhf ${response.data}');
//     return NearByModel.fromJson(response.data);
//   }
//
//   Future<Map> register(Map<String, dynamic> params) async {
//     print('called register');
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/register',
//         data: params,
//         options: accessTokenOptions());
//
//     print('register_response --- ${response.data}');
//     return response.data as Map;
//   }
// //
//
//   Future<Map> addRating(Map<String, dynamic> params) async {
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/addRatingReview',
//         data: params,
//         options: accessTokenOptions());
//
//     print('ratingResponse --- ${response.data}');
//     return response.data as Map;
//   }
//   Future<Map> createOne(Map<String, dynamic> params) async {
//     print('called register');
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/create/listing/screen/one',
//         data: params,
//         options: accessTokenWithToken());
//
//     print('register_response --- ${response.data}');
//     return response.data as Map;
//   }
//
//   Future<Map> createTwo(DaysAddModel params) async {
//     print('called register');
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/create/listing/screen/two',
//         data: params,
//         options: accessTokenWithToken());
//
//     print('register_response --- ${response.data}');
//     return response.data as Map;
//   }
//
//
//
//   Future<Map> createThree(FormData params) async {
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/create/listing/screen/three',
//         data: params,
//         options: accessTokenWithToken(contentType: 'multipart/form-data'));
//
//     print('register_response --- ${response.data}');
//     return response.data as Map;
//   }
//
//   Future<Map> testing(FormData params) async {
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/create/listing/screen/testApi',
//         data: params,
//         options: accessTokenWithToken(contentType: 'multipart/form-data'
//         )
//     );
//
//     print('register_response --- ${response.data}');
//     return response.data as Map;
//   }
//
//   Future<Map> verifyOtp(Map<String, dynamic> params) async {
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/verifyotp',
//         data: params,
//         options: accessTokenOptions());
//
//     print('register_response --- ${response.data}');
//     return response.data as Map;
//
//   }
//
//   Future<Map> logout(Map<String, dynamic> params) async {
//     print('called login');
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/logout',
//         data: params,
//         options: accessTokenOptions());
//
//     print('login_response --- ${response.data}');
//     return response.data as Map;
//   }

  // Future<Department> getDepartments() async {
  //   Response response = await dioClient.get(
  //       AppUrls.get_department_url, options: dioOptions());
  //   return Department.fromJson(response.data as Map);
  // }

}
