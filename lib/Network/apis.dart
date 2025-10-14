class Apis {
  // BASE URL
  // After you have entered/edited your base url, run the command:
  // flutter pub run build_runner build --delete-conflicting-outputs
  // to generate the api_services.g.dart file
  // Every time you change the base url, you need to run the above command
  static const String baseUrl = "https://carsnexus.com/api/employee/";

  /// API CONNECTION CHECK
  static const String apiConnectionTest = "apiConnectionTest";

  ///Auth
  static const String login = "login";
  static const String forgot = "forgot";
  static const String forgotValidate = "forgot/validate";
  static const String newpassword = "newpassword";

  ///home
  static const String home = "home";

  ///Notification
  static const String notification = "notification";

  ///review
  static const String review = "review";

  ///service request
  static const String booking = "booking";
  static const String singleBooking = "booking/{id}";
  static const String bookingComplete = "booking/{id}/complete";

  ///Profile
  static const String profile = "profile";
  static const String profileUpdate = "profile/update";
  static const String profilePictureUpdate = "profile/picture/update";
  static const String profilePasswordUpdate = "profile/password/update";
}
