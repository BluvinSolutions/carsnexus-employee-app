import 'package:carsnexus_employee/Authentication/Model/forgot_response.dart';
import 'package:carsnexus_employee/Authentication/Model/forgot_valid_response.dart';
import 'package:carsnexus_employee/Authentication/Model/login_response.dart';
import 'package:carsnexus_employee/Authentication/otp_verification_screen.dart';
import 'package:carsnexus_employee/Authentication/set_new_password_screen.dart';
import 'package:carsnexus_employee/Home/home_screen.dart';
import 'package:carsnexus_employee/Network/api_header.dart';
import 'package:carsnexus_employee/Network/api_services.dart';
import 'package:carsnexus_employee/Network/base_model.dart';
import 'package:carsnexus_employee/Network/server_error.dart';
import 'package:carsnexus_employee/Utils/device_utils.dart';
import 'package:carsnexus_employee/Utils/preferences_names.dart';
import 'package:carsnexus_employee/Utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool loginLoader = false;

  Future<BaseModel<LoginResponse>> callLogin(Map<String, dynamic> body, BuildContext context) async {
    LoginResponse response;
    try {
      loginLoader = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callLogin(body);
      if (response.success == true) {
        SharedPreferenceHelper.setBoolean(PreferencesNames.isLogin, true);
        SharedPreferenceHelper.setString(PreferencesNames.authToken, response.data!.token ?? "");
        SharedPreferenceHelper.setString(PreferencesNames.imageUrl, response.data!.imageUri!);
        SharedPreferenceHelper.setString(PreferencesNames.phoneNo, response.data!.phoneNo!);
        SharedPreferenceHelper.setString(PreferencesNames.userName, response.data!.name!);
        SharedPreferenceHelper.setString(PreferencesNames.email, response.data!.email!);
        if (context.mounted)Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
        if (response.msg != null) {
          DeviceUtils.toastMessage(response.msg!);
        }
      } else if (response.success == false) {
        if (response.msg != null) DeviceUtils.toastMessage(response.msg!);
      }
      loginLoader = false;
      notifyListeners();
    } catch (error) {
      loginLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  bool forgotLoader = false;

  Future<BaseModel<ForgotResponse>> callForgot(Map<String, dynamic> body, BuildContext context) async {
    ForgotResponse response;
    try {
      forgotLoader = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callForgot(body);
      if (response.success == true) {
        if (response.msg != null) {
          DeviceUtils.toastMessage(response.msg!);
        }
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpVerificationScreen(
                  phoneNumber: body['phone_no'],
                )));
        }
        forgotLoader = false;
        notifyListeners();
      } else if (response.success == false) {
        if (response.msg != null) {
          DeviceUtils.toastMessage(response.msg!);
        }
        forgotLoader = false;
        notifyListeners();
      }
    } catch (error) {
      forgotLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  bool isOtpLoader = false;

  Future<BaseModel<ForgotValidResponse>> callForgotValid(Map<String, dynamic> body, BuildContext context) async {
    ForgotValidResponse response;
    try {
      isOtpLoader = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callForgotValid(body);
      if (response.success == true) {
        if (response.msg != null) {
          DeviceUtils.toastMessage(response.msg!);
        }
        SharedPreferenceHelper.setString(PreferencesNames.authToken, response.data!.token ?? "");
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SetNewPasswordScreen(
                  phoneNo: body['phone_no'],
                )));
        }
        isOtpLoader = false;
        notifyListeners();
      } else if (response.success == false) {
        if (response.msg != null) {
          DeviceUtils.toastMessage(response.msg!);
        }
        isOtpLoader = false;
        notifyListeners();
      }
    } catch (error) {
      isOtpLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<LoginResponse>> callSetNewPassword(Map<String, dynamic> body, BuildContext context) async {
    LoginResponse response;
    try {
      loginLoader = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callSetNewPassword(body);
      if (response.success == true) {
        SharedPreferenceHelper.setBoolean(PreferencesNames.isLogin, true);
        SharedPreferenceHelper.setString(PreferencesNames.authToken, response.data!.token ?? "");
        SharedPreferenceHelper.setString(PreferencesNames.imageUrl, response.data!.imageUri!);
        SharedPreferenceHelper.setString(PreferencesNames.phoneNo, response.data!.phoneNo!);
        SharedPreferenceHelper.setString(PreferencesNames.userName, response.data!.name!);
        SharedPreferenceHelper.setString(PreferencesNames.email, response.data!.email!);
        if (context.mounted)Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
        if (response.msg != null) {
          DeviceUtils.toastMessage(response.msg!);
        }
      } else if (response.success == false) {
        if (response.msg != null) DeviceUtils.toastMessage(response.msg!);
      }
      loginLoader = false;
      notifyListeners();
    } catch (error) {
      loginLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
