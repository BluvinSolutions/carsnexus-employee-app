import 'package:voyzo_employee/Authentication/Model/forgot_response.dart';
import 'package:voyzo_employee/Authentication/Model/forgot_valid_response.dart';
import 'package:voyzo_employee/Authentication/Model/login_response.dart';
import 'package:voyzo_employee/Home/Model/home_response.dart';
import 'package:voyzo_employee/Network/api_connection_test_response_model.dart';
import 'package:voyzo_employee/Network/apis.dart';
import 'package:voyzo_employee/Profile/Model/change_password_response.dart';
import 'package:voyzo_employee/Profile/Model/notification_response.dart';
import 'package:voyzo_employee/Profile/Model/profile_response.dart';
import 'package:voyzo_employee/Profile/Model/reviews_response.dart';
import 'package:voyzo_employee/Service%20Request/Model/booking_complete_response.dart';
import 'package:voyzo_employee/Service%20Request/Model/service_request_response.dart';
import 'package:voyzo_employee/Service%20Request/Model/single_service_request.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';



part 'api_services.g.dart';

@RestApi(baseUrl: Apis.baseUrl)
abstract class ApiServices
{
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(Apis.login)
  Future<LoginResponse> callLogin(@Body() Map<String,dynamic> body);

  @POST(Apis.forgot)
  Future<ForgotResponse> callForgot(@Body() Map<String,dynamic> body);

  @POST(Apis.forgotValidate)
  Future<ForgotValidResponse> callForgotValid(@Body() Map<String,dynamic> body);

  @POST(Apis.newpassword)
  Future<LoginResponse> callSetNewPassword(@Body() Map<String,dynamic> body);

  @GET(Apis.home)
  Future<HomeResponse> callHome();

  @GET(Apis.notification)
  Future<NotificationResponse> callNotification();

  @GET(Apis.review)
  Future<ReviewsResponse> callReviews();

  @GET(Apis.booking)
  Future<ServiceRequestResponse> callServiceRequest();

  @POST(Apis.booking)
  Future<ServiceRequestResponse> callBookingHistory(@Body() Map<String,dynamic> body);

  @GET(Apis.singleBooking)
  Future<SingleServiceRequest> callSingleService(@Path("id") int id);

  @POST(Apis.bookingComplete)
  Future<BookingCompleteResponse> callBookingComplete(@Path("id") int id, @Body() Map<String,dynamic> body);


  @GET(Apis.profile)
  Future<ProfileResponse> callGetProfile();

  @POST(Apis.profileUpdate)
  Future<ProfileResponse> callUpdateProfile(@Body() Map<String,dynamic> body);

  @POST(Apis.profilePictureUpdate)
  Future<ProfileResponse> callProfilePicture(@Body() Map<String,dynamic> body);

  @POST(Apis.profilePasswordUpdate)
  Future<ChangePasswordResponse> callChangePassword(@Body() Map<String,dynamic> body);

  @GET(Apis.apiConnectionTest)
  Future<ApiConnectionTestResponse> apiConnectionTest();
}