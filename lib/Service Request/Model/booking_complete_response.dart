import 'package:voyzo_employee/Service%20Request/Model/service_request_response.dart';

class BookingCompleteResponse {
  BookingCompleteResponse({
    String? msg,
    ServiceRequestData? data,
    bool? success,
  }) {
    _msg = msg;
    _data = data;
    _success = success;
  }

  BookingCompleteResponse.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? ServiceRequestData.fromJson(json['data']) : null;
    _success = json['success'];
  }

  String? _msg;
  ServiceRequestData? _data;
  bool? _success;

  BookingCompleteResponse copyWith({
    String? msg,
    ServiceRequestData? data,
    bool? success,
  }) =>
      BookingCompleteResponse(
        msg: msg ?? _msg,
        data: data ?? _data,
        success: success ?? _success,
      );

  String? get msg => _msg;

  ServiceRequestData? get data => _data;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    return map;
  }
}
