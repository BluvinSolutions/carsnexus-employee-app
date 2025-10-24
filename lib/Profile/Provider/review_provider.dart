import 'package:voyzo_employee/Network/api_header.dart';
import 'package:voyzo_employee/Network/api_services.dart';
import 'package:voyzo_employee/Network/base_model.dart';
import 'package:voyzo_employee/Network/server_error.dart';
import 'package:voyzo_employee/Profile/Model/reviews_response.dart';
import 'package:flutter/material.dart';

class ReviewProvider extends ChangeNotifier {
  bool reviewLoader = false;
  List<ReviewData> notificationData = [];

  Future<BaseModel<ReviewsResponse>> callReviews() async {
    ReviewsResponse response;
    try {
      reviewLoader = true;
      notificationData.clear();
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callReviews();
      if (response.success == true) {
        notificationData = response.data!;
        notifyListeners();
      }
      reviewLoader = false;
      notifyListeners();
    } catch (error) {
      reviewLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
