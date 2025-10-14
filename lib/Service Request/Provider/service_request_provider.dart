import 'package:carsnexus_employee/Network/api_header.dart';
import 'package:carsnexus_employee/Network/api_services.dart';
import 'package:carsnexus_employee/Network/base_model.dart';
import 'package:carsnexus_employee/Network/server_error.dart';
import 'package:carsnexus_employee/Service%20Request/Model/booking_complete_response.dart';
import 'package:carsnexus_employee/Service%20Request/Model/service_request_response.dart';
import 'package:carsnexus_employee/Service%20Request/Model/single_service_request.dart';
import 'package:carsnexus_employee/Utils/device_utils.dart';
import 'package:flutter/material.dart';

class ServiceRequestProvider extends ChangeNotifier {
  bool serviceRequestLoader = false;
  List<ServiceRequestData> upcomingList = [];
  List<ServiceRequestData> completeList = [];
  List<ServiceRequestData> cancelList = [];

  Future<BaseModel<ServiceRequestResponse>> callServiceRequest() async {
    ServiceRequestResponse response;
    try {
      serviceRequestLoader = true;
      upcomingList.clear();
      completeList.clear();
      cancelList.clear();
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callServiceRequest();
      if (response.success == true) {
        for (int i = 0; i < response.data!.length; i++) {
          if (response.data![i].status == 1) {
            upcomingList.add(response.data![i]);
          } else if (response.data![i].status == 2) {
            completeList.add(response.data![i]);
          } else if (response.data![i].status == 3 || response.data![i].status == 5) {
            completeList.add(response.data![i]);
          }
          notifyListeners();
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

  bool singleServiceRequest = false;
  SingleServiceData? singleServiceData;

  Future<BaseModel<SingleServiceRequest>> callSingleRequest(int id) async {
    SingleServiceRequest response;
    try {
      singleServiceRequest = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callSingleService(id);
      if (response.success == true) {
        singleServiceData = response.data!;
        notifyListeners();
      }
      singleServiceRequest = false;
      notifyListeners();
    } catch (error) {
      singleServiceRequest = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<BookingCompleteResponse>> callBookingRequestComplete(int id, Map<String, dynamic> body) async {
    BookingCompleteResponse response;
    try {
      serviceRequestLoader = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callBookingComplete(id, body);
      if (response.success == true) {
        int index = upcomingList.indexWhere((element) => element.id!.toInt() == id);
        upcomingList[index].status = 2;
        completeList.insert(0, upcomingList[index]);
        upcomingList.removeAt(index);
        notifyListeners();
        if (response.msg != null) {
          DeviceUtils.toastMessage(response.msg!);
        }
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
