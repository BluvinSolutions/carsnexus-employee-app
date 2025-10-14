class SingleServiceRequest {
  SingleServiceRequest({
    dynamic msg,
    SingleServiceData? data,
    bool? success,
  }) {
    _msg = msg;
    _data = data;
    _success = success;
  }

  SingleServiceRequest.fromJson(dynamic json) {
    _msg = json['msg'];
    _data = json['data'] != null ? SingleServiceData.fromJson(json['data']) : null;
    _success = json['success'];
  }

  dynamic _msg;
  SingleServiceData? _data;
  bool? _success;

  SingleServiceRequest copyWith({
    dynamic msg,
    SingleServiceData? data,
    bool? success,
  }) =>
      SingleServiceRequest(
        msg: msg ?? _msg,
        data: data ?? _data,
        success: success ?? _success,
      );

  dynamic get msg => _msg;

  SingleServiceData? get data => _data;

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

class SingleServiceData {
  SingleServiceData({
    num? id,
    String? bookingId,
    num? userId,
    num? shopId,
    num? ownerId,
    num? employeeId,
    num? adminPer,
    String? address,
    num? vehicleId,
    String? startTime,
    String? endTime,
    num? serviceType,
    num? amount,
    num? discount,
    num? paymentStatus,
    String? paymentToken,
    String? paymentMethod,
    num? status,
    List<String>? service,
    String? updatedAt,
    String? createdAt,
    List<ServiceData>? serviceData,
    String? currency,
    User? user,
    RequestModel? model,
    Shop? shop,
    Employee? employee,
  }) {
    _id = id;
    _bookingId = bookingId;
    _userId = userId;
    _shopId = shopId;
    _ownerId = ownerId;
    _employeeId = employeeId;
    _adminPer = adminPer;
    _address = address;
    _vehicleId = vehicleId;
    _startTime = startTime;
    _endTime = endTime;
    _serviceType = serviceType;
    _amount = amount;
    _discount = discount;
    _paymentStatus = paymentStatus;
    _paymentToken = paymentToken;
    _paymentMethod = paymentMethod;
    _status = status;
    _service = service;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _serviceData = serviceData;
    _currency = currency;
    _user = user;
    _model = model;
    _shop = shop;
    _employee = employee;
  }

  SingleServiceData.fromJson(dynamic json) {
    _id = json['id'];
    _bookingId = json['booking_id'];
    _userId = json['user_id'];
    _shopId = json['shop_id'];
    _ownerId = json['owner_id'];
    _employeeId = json['employee_id'];
    _adminPer = json['admin_per'];
    _address = json['address'];
    _vehicleId = json['vehicle_id'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _serviceType = json['service_type'];
    _amount = json['amount'];
    _discount = json['discount'];
    _paymentStatus = json['payment_status'];
    _paymentToken = json['payment_token'];
    _paymentMethod = json['payment_method'];
    _status = json['status'];
    _service = json['service'] != null ? json['service'].cast<String>() : [];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    if (json['serviceData'] != null) {
      _serviceData = [];
      json['serviceData'].forEach((v) {
        _serviceData?.add(ServiceData.fromJson(v));
      });
    }
    _currency = json['currency'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _model = json['model'] != null ? RequestModel.fromJson(json['model']) : null;
    _shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    _employee = json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }

  num? _id;
  String? _bookingId;
  num? _userId;
  num? _shopId;
  num? _ownerId;
  num? _employeeId;
  num? _adminPer;
  String? _address;
  num? _vehicleId;
  String? _startTime;
  String? _endTime;
  num? _serviceType;
  num? _amount;
  num? _discount;
  num? _paymentStatus;
  String? _paymentToken;
  String? _paymentMethod;
  num? _status;
  List<String>? _service;
  String? _updatedAt;
  String? _createdAt;
  List<ServiceData>? _serviceData;
  String? _currency;
  User? _user;
  RequestModel? _model;
  Shop? _shop;
  Employee? _employee;

  SingleServiceData copyWith({
    num? id,
    String? bookingId,
    num? userId,
    num? shopId,
    num? ownerId,
    num? employeeId,
    num? adminPer,
    String? address,
    num? vehicleId,
    String? startTime,
    String? endTime,
    num? serviceType,
    num? amount,
    num? discount,
    num? paymentStatus,
    String? paymentToken,
    String? paymentMethod,
    num? status,
    List<String>? service,
    String? updatedAt,
    String? createdAt,
    List<ServiceData>? serviceData,
    String? currency,
    User? user,
    RequestModel? model,
    Shop? shop,
    Employee? employee,
  }) =>
      SingleServiceData(
        id: id ?? _id,
        bookingId: bookingId ?? _bookingId,
        userId: userId ?? _userId,
        shopId: shopId ?? _shopId,
        ownerId: ownerId ?? _ownerId,
        employeeId: employeeId ?? _employeeId,
        adminPer: adminPer ?? _adminPer,
        address: address ?? _address,
        vehicleId: vehicleId ?? _vehicleId,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        serviceType: serviceType ?? _serviceType,
        amount: amount ?? _amount,
        discount: discount ?? _discount,
        paymentStatus: paymentStatus ?? _paymentStatus,
        paymentToken: paymentToken ?? _paymentToken,
        paymentMethod: paymentMethod ?? _paymentMethod,
        status: status ?? _status,
        service: service ?? _service,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        serviceData: serviceData ?? _serviceData,
        currency: currency ?? _currency,
        user: user ?? _user,
        model: model ?? _model,
        shop: shop ?? _shop,
        employee: employee ?? _employee,
      );

  num? get id => _id;

  String? get bookingId => _bookingId;

  num? get userId => _userId;

  num? get shopId => _shopId;

  num? get ownerId => _ownerId;

  num? get employeeId => _employeeId;

  num? get adminPer => _adminPer;

  String? get address => _address;

  num? get vehicleId => _vehicleId;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  num? get serviceType => _serviceType;

  num? get amount => _amount;

  num? get discount => _discount;

  num? get paymentStatus => _paymentStatus;

  String? get paymentToken => _paymentToken;

  String? get paymentMethod => _paymentMethod;

  // ignore: unnecessary_getters_setters
  num? get status => _status;

  set status(num? value) {
    _status = value;
  }

  List<String>? get service => _service;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  List<ServiceData>? get serviceData => _serviceData;

  String? get currency => _currency;

  User? get user => _user;

  RequestModel? get model => _model;

  Shop? get shop => _shop;

  Employee? get employee => _employee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['booking_id'] = _bookingId;
    map['user_id'] = _userId;
    map['shop_id'] = _shopId;
    map['owner_id'] = _ownerId;
    map['employee_id'] = _employeeId;
    map['admin_per'] = _adminPer;
    map['address'] = _address;
    map['vehicle_id'] = _vehicleId;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['service_type'] = _serviceType;
    map['amount'] = _amount;
    map['discount'] = _discount;
    map['payment_status'] = _paymentStatus;
    map['payment_token'] = _paymentToken;
    map['payment_method'] = _paymentMethod;
    map['status'] = _status;
    map['service'] = _service;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    if (_serviceData != null) {
      map['serviceData'] = _serviceData?.map((v) => v.toJson()).toList();
    }
    map['currency'] = _currency;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_model != null) {
      map['model'] = _model?.toJson();
    }
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    if (_employee != null) {
      map['employee'] = _employee?.toJson();
    }
    return map;
  }
}

class Employee {
  Employee({
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
    _imageUri = imageUri;
  }

  Employee.fromJson(dynamic json) {
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
  String? _imageUri;

  Employee copyWith({
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
    String? imageUri,
  }) =>
      Employee(
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
    map['imageUri'] = _imageUri;
    return map;
  }
}

class Shop {
  Shop({
    num? id,
    num? ownerId,
    List<String>? serviceId,
    List<String>? packageId,
    List<String>? employeeId,
    String? name,
    String? address,
    String? image,
    String? phoneNo,
    num? isPopular,
    num? isBest,
    String? startTime,
    String? endTime,
    num? serviceType,
    num? status,
    String? imageUri,
    String? avgRating,
    List<EmployeeData>? employeeData,
  }) {
    _id = id;
    _ownerId = ownerId;
    _serviceId = serviceId;
    _packageId = packageId;
    _employeeId = employeeId;
    _name = name;
    _address = address;
    _image = image;
    _phoneNo = phoneNo;
    _isPopular = isPopular;
    _isBest = isBest;
    _startTime = startTime;
    _endTime = endTime;
    _serviceType = serviceType;
    _status = status;
    _imageUri = imageUri;
    _avgRating = avgRating;
    _employeeData = employeeData;
  }

  Shop.fromJson(dynamic json) {
    _id = json['id'];
    _ownerId = json['owner_id'];
    _serviceId = json['service_id'] != null ? json['service_id'].cast<String>() : [];
    _packageId = json['package_id'] != null ? json['package_id'].cast<String>() : [];
    _employeeId = json['employee_id'] != null ? json['employee_id'].cast<String>() : [];
    _name = json['name'];
    _address = json['address'];
    _image = json['image'];
    _phoneNo = json['phone_no'];
    _isPopular = json['is_popular'];
    _isBest = json['is_best'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _serviceType = json['service_type'];
    _status = json['status'];
    _imageUri = json['imageUri'];
    _avgRating = json['avg_rating'].toString();
    if (json['employeeData'] != null) {
      _employeeData = [];
      json['employeeData'].forEach((v) {
        _employeeData?.add(EmployeeData.fromJson(v));
      });
    }
  }

  num? _id;
  num? _ownerId;
  List<String>? _serviceId;
  List<String>? _packageId;
  List<String>? _employeeId;
  String? _name;
  String? _address;
  String? _image;
  String? _phoneNo;
  num? _isPopular;
  num? _isBest;
  String? _startTime;
  String? _endTime;
  num? _serviceType;
  num? _status;
  String? _imageUri;
  String? _avgRating;
  List<EmployeeData>? _employeeData;

  Shop copyWith({
    num? id,
    num? ownerId,
    List<String>? serviceId,
    List<String>? packageId,
    List<String>? employeeId,
    String? name,
    String? address,
    String? image,
    String? phoneNo,
    num? isPopular,
    num? isBest,
    String? startTime,
    String? endTime,
    num? serviceType,
    num? status,
    String? imageUri,
    String? avgRating,
    List<EmployeeData>? employeeData,
  }) =>
      Shop(
        id: id ?? _id,
        ownerId: ownerId ?? _ownerId,
        serviceId: serviceId ?? _serviceId,
        packageId: packageId ?? _packageId,
        employeeId: employeeId ?? _employeeId,
        name: name ?? _name,
        address: address ?? _address,
        image: image ?? _image,
        phoneNo: phoneNo ?? _phoneNo,
        isPopular: isPopular ?? _isPopular,
        isBest: isBest ?? _isBest,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        serviceType: serviceType ?? _serviceType,
        status: status ?? _status,
        imageUri: imageUri ?? _imageUri,
        avgRating: avgRating ?? _avgRating,
        employeeData: employeeData ?? _employeeData,
      );

  num? get id => _id;

  num? get ownerId => _ownerId;

  List<String>? get serviceId => _serviceId;

  List<String>? get packageId => _packageId;

  List<String>? get employeeId => _employeeId;

  String? get name => _name;

  String? get address => _address;

  String? get image => _image;

  String? get phoneNo => _phoneNo;

  num? get isPopular => _isPopular;

  num? get isBest => _isBest;

  String? get startTime => _startTime;

  String? get endTime => _endTime;

  num? get serviceType => _serviceType;

  num? get status => _status;

  String? get imageUri => _imageUri;

  String? get avgRating => _avgRating;

  List<EmployeeData>? get employeeData => _employeeData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner_id'] = _ownerId;
    map['service_id'] = _serviceId;
    map['package_id'] = _packageId;
    map['employee_id'] = _employeeId;
    map['name'] = _name;
    map['address'] = _address;
    map['image'] = _image;
    map['phone_no'] = _phoneNo;
    map['is_popular'] = _isPopular;
    map['is_best'] = _isBest;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['service_type'] = _serviceType;
    map['status'] = _status;
    map['imageUri'] = _imageUri;
    map['avg_rating'] = _avgRating;
    if (_employeeData != null) {
      map['employeeData'] = _employeeData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class EmployeeData {
  EmployeeData({
    String? name,
    num? id,
    String? email,
    num? online,
    String? image,
    String? imageUri,
  }) {
    _name = name;
    _id = id;
    _email = email;
    _online = online;
    _image = image;
    _imageUri = imageUri;
  }

  EmployeeData.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _email = json['email'];
    _online = json['online'];
    _image = json['image'];
    _imageUri = json['imageUri'];
  }

  String? _name;
  num? _id;
  String? _email;
  num? _online;
  String? _image;
  String? _imageUri;

  EmployeeData copyWith({
    String? name,
    num? id,
    String? email,
    num? online,
    String? image,
    String? imageUri,
  }) =>
      EmployeeData(
        name: name ?? _name,
        id: id ?? _id,
        email: email ?? _email,
        online: online ?? _online,
        image: image ?? _image,
        imageUri: imageUri ?? _imageUri,
      );

  String? get name => _name;

  num? get id => _id;

  String? get email => _email;

  num? get online => _online;

  String? get image => _image;

  String? get imageUri => _imageUri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['email'] = _email;
    map['online'] = _online;
    map['image'] = _image;
    map['imageUri'] = _imageUri;
    return map;
  }
}

class RequestModel {
  RequestModel({
    num? id,
    num? userId,
    num? modelId,
    String? regNumber,
    String? color,
    Model? model,
  }) {
    _id = id;
    _userId = userId;
    _modelId = modelId;
    _regNumber = regNumber;
    _color = color;
    _model = model;
  }

  RequestModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _modelId = json['model_id'];
    _regNumber = json['reg_number'];
    _color = json['color'];
    _model = json['model'] != null ? Model.fromJson(json['model']) : null;
  }

  num? _id;
  num? _userId;
  num? _modelId;
  String? _regNumber;
  String? _color;
  Model? _model;

  RequestModel copyWith({
    num? id,
    num? userId,
    num? modelId,
    String? regNumber,
    String? color,
    Model? model,
  }) =>
      RequestModel(
        id: id ?? _id,
        userId: userId ?? _userId,
        modelId: modelId ?? _modelId,
        regNumber: regNumber ?? _regNumber,
        color: color ?? _color,
        model: model ?? _model,
      );

  num? get id => _id;

  num? get userId => _userId;

  num? get modelId => _modelId;

  String? get regNumber => _regNumber;

  String? get color => _color;

  Model? get model => _model;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['model_id'] = _modelId;
    map['reg_number'] = _regNumber;
    map['color'] = _color;
    if (_model != null) {
      map['model'] = _model?.toJson();
    }
    return map;
  }
}

class Model {
  Model({
    num? id,
    num? brandId,
    String? name,
    Brand? brand,
  }) {
    _id = id;
    _brandId = brandId;
    _name = name;
    _brand = brand;
  }

  Model.fromJson(dynamic json) {
    _id = json['id'];
    _brandId = json['brand_id'];
    _name = json['name'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  num? _id;
  num? _brandId;
  String? _name;
  Brand? _brand;

  Model copyWith({
    num? id,
    num? brandId,
    String? name,
    Brand? brand,
  }) =>
      Model(
        id: id ?? _id,
        brandId: brandId ?? _brandId,
        name: name ?? _name,
        brand: brand ?? _brand,
      );

  num? get id => _id;

  num? get brandId => _brandId;

  String? get name => _name;

  Brand? get brand => _brand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['brand_id'] = _brandId;
    map['name'] = _name;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    return map;
  }
}

class Brand {
  Brand({
    num? id,
    String? name,
    String? icon,
    num? status,
    String? imageUri,
  }) {
    _id = id;
    _name = name;
    _icon = icon;
    _status = status;
    _imageUri = imageUri;
  }

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _icon = json['icon'];
    _status = json['status'];
    _imageUri = json['imageUri'];
  }

  num? _id;
  String? _name;
  String? _icon;
  num? _status;
  String? _imageUri;

  Brand copyWith({
    num? id,
    String? name,
    String? icon,
    num? status,
    String? imageUri,
  }) =>
      Brand(
        id: id ?? _id,
        name: name ?? _name,
        icon: icon ?? _icon,
        status: status ?? _status,
        imageUri: imageUri ?? _imageUri,
      );

  num? get id => _id;

  String? get name => _name;

  String? get icon => _icon;

  num? get status => _status;

  String? get imageUri => _imageUri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['icon'] = _icon;
    map['status'] = _status;
    map['imageUri'] = _imageUri;
    return map;
  }
}

class User {
  User({
    num? id,
    String? name,
    String? image,
    dynamic address,
    String? imageUri,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _address = address;
    _imageUri = imageUri;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _address = json['address'];
    _imageUri = json['imageUri'];
  }

  num? _id;
  String? _name;
  String? _image;
  dynamic _address;
  String? _imageUri;

  User copyWith({
    num? id,
    String? name,
    String? image,
    dynamic address,
    String? imageUri,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        address: address ?? _address,
        imageUri: imageUri ?? _imageUri,
      );

  num? get id => _id;

  String? get name => _name;

  String? get image => _image;

  dynamic get address => _address;

  String? get imageUri => _imageUri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['address'] = _address;
    map['imageUri'] = _imageUri;
    return map;
  }
}

class ServiceData {
  ServiceData({
    String? name,
    num? id,
    num? price,
    String? currency,
  }) {
    _name = name;
    _id = id;
    _price = price;
    _currency = currency;
  }

  ServiceData.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _price = json['price'];
    _currency = json['currency'];
  }

  String? _name;
  num? _id;
  num? _price;
  String? _currency;

  ServiceData copyWith({
    String? name,
    num? id,
    num? price,
    String? currency,
  }) =>
      ServiceData(
        name: name ?? _name,
        id: id ?? _id,
        price: price ?? _price,
        currency: currency ?? _currency,
      );

  String? get name => _name;

  num? get id => _id;

  num? get price => _price;

  String? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['price'] = _price;
    map['currency'] = _currency;
    return map;
  }
}
