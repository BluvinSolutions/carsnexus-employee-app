class ReviewsResponse {
  ReviewsResponse({
    dynamic msg,
    List<ReviewData>? data,
    bool? success,
  }) {
    _msg = msg;
    _data = data;
    _success = success;
  }

  ReviewsResponse.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ReviewData.fromJson(v));
      });
    }
    _success = json['success'];
  }

  dynamic _msg;
  List<ReviewData>? _data;
  bool? _success;

  ReviewsResponse copyWith({
    dynamic msg,
    List<ReviewData>? data,
    bool? success,
  }) =>
      ReviewsResponse(
        msg: msg ?? _msg,
        data: data ?? _data,
        success: success ?? _success,
      );

  dynamic get msg => _msg;

  List<ReviewData>? get data => _data;

  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    return map;
  }
}

class ReviewData {
  ReviewData({
    num? id,
    num? userId,
    num? employeeId,
    num? shopId,
    num? bookingId,
    num? star,
    String? cmt,
    String? createdAt,
    String? updatedAt,
    User? user,
  }) {
    _id = id;
    _userId = userId;
    _employeeId = employeeId;
    _shopId = shopId;
    _bookingId = bookingId;
    _star = star;
    _cmt = cmt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
  }

  ReviewData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _employeeId = json['employee_id'];
    _shopId = json['shop_id'];
    _bookingId = json['booking_id'];
    _star = json['star'];
    _cmt = json['cmt'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  num? _id;
  num? _userId;
  num? _employeeId;
  num? _shopId;
  num? _bookingId;
  num? _star;
  String? _cmt;
  String? _createdAt;
  String? _updatedAt;
  User? _user;

  ReviewData copyWith({
    num? id,
    num? userId,
    num? employeeId,
    num? shopId,
    num? bookingId,
    num? star,
    String? cmt,
    String? createdAt,
    String? updatedAt,
    User? user,
  }) =>
      ReviewData(
        id: id ?? _id,
        userId: userId ?? _userId,
        employeeId: employeeId ?? _employeeId,
        shopId: shopId ?? _shopId,
        bookingId: bookingId ?? _bookingId,
        star: star ?? _star,
        cmt: cmt ?? _cmt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        user: user ?? _user,
      );

  num? get id => _id;

  num? get userId => _userId;

  num? get employeeId => _employeeId;

  num? get shopId => _shopId;

  num? get bookingId => _bookingId;

  num? get star => _star;

  String? get cmt => _cmt;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['employee_id'] = _employeeId;
    map['shop_id'] = _shopId;
    map['booking_id'] = _bookingId;
    map['star'] = _star;
    map['cmt'] = _cmt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    String? name,
    num? id,
    String? image,
    String? imageUri,
  }) {
    _name = name;
    _id = id;
    _image = image;
    _imageUri = imageUri;
  }

  User.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _image = json['image'];
    _imageUri = json['imageUri'];
  }

  String? _name;
  num? _id;
  String? _image;
  String? _imageUri;

  User copyWith({
    String? name,
    num? id,
    String? image,
    String? imageUri,
  }) =>
      User(
        name: name ?? _name,
        id: id ?? _id,
        image: image ?? _image,
        imageUri: imageUri ?? _imageUri,
      );

  String? get name => _name;

  num? get id => _id;

  String? get image => _image;

  String? get imageUri => _imageUri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['image'] = _image;
    map['imageUri'] = _imageUri;
    return map;
  }
}
