import 'package:dio/dio.dart';


import '../utils/SharedPref.dart';
import '../utils/app_keys.dart';
import 'dio_client.dart';

class APIService {
  DioClient? dioClient;

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
    var id = SharedPref.getInstance()!.getStringValuesSF(AppKeys.loginId);
    var token = SharedPref.getInstance()!.getStringValuesSF(AppKeys.token);

    print('id  -  $id');
    print('token  -  $token');
    Options dioOption = Options(headers: {
      'Content-Type': contentType ?? 'application/json',
      'Accept': 'application/json',
      'id': id,
      'token': "Bearer " + token,
      // 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmFtZU9SZW1haWwiOiJUZXN0IiwiaWF0IjoxNjQ0NTE5ODk2LCJleHAiOjE2NDQ1Mzc4OTZ9.RUGQa-VV4dD2-xe0MO_zXpjgtSdwXsiuctxaVfnd94Y',
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
//
//   Future<Map> login(Map<String, dynamic> params) async {
//     print('called login');
//     Response response = await dioClient!.post(
//         'http://35.153.215.210:5004/api/v1/business/login',
//         data: params,
//         options: accessTokenOptions());
//
//     print('login_response --- ${response.data}');
//     return response.data as Map;
//   }
//
//   Future<CategoryList> getCatogory() async {
//     print('called login');
//     Response response = await dioClient!.get(
//         'http://35.153.215.210:5004/api/v1/admin/category/all/list',
//         options: accessTokenOptions());
//     print('hhfhfhf ${CategoryList.fromJson(response.data)}');
//     return CategoryList.fromJson(response.data);
//   }
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
