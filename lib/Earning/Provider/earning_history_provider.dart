import 'package:carsnexus_employee/Network/api_header.dart';
import 'package:carsnexus_employee/Network/api_services.dart';
import 'package:carsnexus_employee/Network/base_model.dart';
import 'package:carsnexus_employee/Network/server_error.dart';
import 'package:carsnexus_employee/Service%20Request/Model/service_request_response.dart';
import 'package:flutter/material.dart';

class EarningHistoryProvider extends ChangeNotifier {
  bool serviceRequestLoader = false;
  List<ServiceRequestData> bookings = [];

  num totalAmount = 0.0;
  String currency = "";

  Future<BaseModel<ServiceRequestResponse>> callEarningHistoryRequest(Map<String, dynamic> body) async {
    ServiceRequestResponse response;
    try {
      serviceRequestLoader = true;
      totalAmount = 0.0;
      bookings.clear();
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callBookingHistory(body);

      if (response.success == true) {
        bookings.addAll(response.data!);
        for (int i = 0; i < response.data!.length; i++) {
          currency = response.data![i].currency!;
          totalAmount += response.data![i].amount!;
        }
        notifyListeners();
      }
      serviceRequestLoader = false;
      notifyListeners();
    } catch (error) {
      serviceRequestLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
