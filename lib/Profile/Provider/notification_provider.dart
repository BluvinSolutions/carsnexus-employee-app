import 'package:carsnexus_employee/Network/api_header.dart';
import 'package:carsnexus_employee/Network/api_services.dart';
import 'package:carsnexus_employee/Network/base_model.dart';
import 'package:carsnexus_employee/Network/server_error.dart';
import 'package:carsnexus_employee/Profile/Model/notification_response.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  bool notificationLoader = false;
  List<NotificationData> notificationData = [];

  Future<BaseModel<NotificationResponse>> callNotification() async {
    NotificationResponse response;
    try {
      notificationLoader = true;
      notificationData.clear();
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callNotification();
      if (response.success == true) {
        notificationData = response.data!;
        notifyListeners();
      }
      notificationLoader = false;
      notifyListeners();
    } catch (error) {
      notificationLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
