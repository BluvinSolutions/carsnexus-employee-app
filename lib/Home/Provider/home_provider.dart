import 'package:carsnexus_employee/Home/Model/home_response.dart';
import 'package:carsnexus_employee/Network/api_header.dart';
import 'package:carsnexus_employee/Network/api_services.dart';
import 'package:carsnexus_employee/Network/base_model.dart';
import 'package:carsnexus_employee/Network/server_error.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool homeLoader = false;
  num data = 0;
  num dataIncome = 0;

  num homeData = 0;
  num homeIncome = 0;

  num shopData = 0;
  num shopIncome = 0;

  String currency = "";

  Future<BaseModel<HomeResponse>> callHome() async {
    HomeResponse response;
    try {
      homeLoader = true;
      notifyListeners();
      response = await ApiServices(ApiHeader().dioData()).callHome();
      if (response.success == true) {
        data = response.data!.data!;
        dataIncome = response.data!.income!;

        homeData = response.data!.homeData!;
        homeIncome = response.data!.homeIncome!;

        shopData = response.data!.shopData!;
        shopIncome = response.data!.shopIncome!;

        currency = response.data!.currency!;
        notifyListeners();
      }
      homeLoader = false;
      notifyListeners();
    } catch (error) {
      homeLoader = false;
      notifyListeners();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }
}
