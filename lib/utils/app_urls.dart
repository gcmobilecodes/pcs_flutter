class AppUrls {
  static const String base_url = 'http://35.153.215.210:5004/api/';
  static const String base_url_with_api = '$base_url/v1';
  static const String base_url_auth = '$base_url_with_api/business';
  static const String base_url_resource = '$base_url_with_api/resource';
  static const String base_url_lead = '$base_url_with_api/lead';
  static const String base_url_task = '$base_url_with_api/task';
  static const String base_url_user = '$base_url_with_api/user';

  //user url
  static const String register_url = '$base_url_auth/register';
  static const String login_url = '$base_url_auth/login';
  static const String otp_url = '$base_url_auth/verifyotp';
  static const String resend_otp_url = '$base_url_auth/resendotp';
  static const String logout_url = '$base_url_auth/logout';

  //account url
  static const String forgot_password_url = '$base_url_auth/forgotpassword';
  static const String change_password_url = '$base_url_auth/changepassword';
  static const String update_profile_url = '$base_url_auth/updateprofile';
  static const String update_image_url = '$base_url_auth/updateprofileimage';
  static const String get_details_url = '$base_url_auth/detail';




}
