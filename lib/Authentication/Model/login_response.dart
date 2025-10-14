class LoginResponse {
  LoginResponse({
    String? msg,
    LoginData? data,
    bool? success,
  }) {
    _msg = msg;
    _data = data;
    _success = success;
  }

  LoginResponse.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    _success = json['success'];
  }

  String? _msg;
  LoginData? _data;
  bool? _success;

  LoginResponse copyWith({
    String? msg,
    LoginData? data,
    bool? success,
  }) =>
      LoginResponse(
        msg: msg ?? _msg,
        data: data ?? _data,
        success: success ?? _success,
      );

  String? get msg => _msg;

  LoginData? get data => _data;

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

class LoginData {
  LoginData({
    num? id,
    num? ownerId,
    String? name,
    String? email,
    String? experience,
    String? idNo,
    String? image,
    dynamic deviceToken,
    String? phoneNo,
    dynamic otp,
    String? startTime,
    String? endTime,
    num? status,
    num? noti,
    num? online,
    String? token,
    String? imageUri,
  }) {
    _id = id;
    _ownerId = ownerId;
    _name = name;
    _email = email;
    _experience = experience;
    _idNo = idNo;
    _image = image;
    _deviceToken = deviceToken;
    _phoneNo = phoneNo;
    _otp = otp;
    _startTime = startTime;
    _endTime = endTime;
    _status = status;
    _noti = noti;
    _online = online;
    _token = token;
    _imageUri = imageUri;
  }

  LoginData.fromJson(dynamic json) {
    _id = json['id'];
    _ownerId = json['owner_id'];
    _name = json['name'];
    _email = json['email'];
    _experience = json['experience'];
    _idNo = json['id_no'];
    _image = json['image'];
    _deviceToken = json['device_token'];
    _phoneNo = json['phone_no'];
    _otp = json['otp'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _status = json['status'];
    _noti = json['noti'];
    _online = json['online'];
    _token = json['token'];
    _imageUri = json['imageUri'];
  }

  num? _id;
  num? _ownerId;
  String? _name;
  String? _email;
  String? _experience;
  String? _idNo;
  String? _image;
  dynamic _deviceToken;
  String? _phoneNo;
  dynamic _otp;
  String? _startTime;
  String? _endTime;
  num? _status;
  num? _noti;
  num? _online;
  String? _token;
  String? _imageUri;

  LoginData copyWith({
    num? id,
    num? ownerId,
    String? name,
    String? email,
    String? experience,
    String? idNo,
    String? image,
    dynamic deviceToken,
    String? phoneNo,
    dynamic otp,
    String? startTime,
    String? endTime,
    num? status,
    num? noti,
    num? online,
    String? token,
    String? imageUri,
  }) =>
      LoginData(
        id: id ?? _id,
        ownerId: ownerId ?? _ownerId,
        name: name ?? _name,
        email: email ?? _email,
        experience: experience ?? _experience,
        idNo: idNo ?? _idNo,
        image: image ?? _image,
        deviceToken: deviceToken ?? _deviceToken,
        phoneNo: phoneNo ?? _phoneNo,
        otp: otp ?? _otp,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        status: status ?? _status,
        noti: noti ?? _noti,
        online: online ?? _online,
        token: token ?? _token,
        imageUri: imageUri ?? _imageUri,
      );

  num? get id => _id;

  num? get ownerId => _ownerId;

  String? get name => _name;

  String? get email => _email;

  String? get experience => _experience;

  String? get idNo => _idNo;

  String? get image => _image;

  dynamic get deviceToken => _deviceToken;

  String? get phoneNo => _phoneNo;

  dynamic get otp => _otp;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  num? get status => _status;

  num? get noti => _noti;

  num? get online => _online;

  String? get token => _token;

  String? get imageUri => _imageUri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner_id'] = _ownerId;
    map['name'] = _name;
    map['email'] = _email;
    map['experience'] = _experience;
    map['id_no'] = _idNo;
    map['image'] = _image;
    map['device_token'] = _deviceToken;
    map['phone_no'] = _phoneNo;
    map['otp'] = _otp;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['status'] = _status;
    map['noti'] = _noti;
    map['online'] = _online;
    map['token'] = _token;
    map['imageUri'] = _imageUri;
    return map;
  }
}
