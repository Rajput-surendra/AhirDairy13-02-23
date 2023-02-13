/// OrderHistory : {"id":"11","name":"surendra","mobile":"9999999999","email":"deve@gmail.com","status":"1","wallet":"0","profile_image":"uploads/63e3a99058c761675864464.png"}
/// ResponseCode : "200"
/// Result : "true"
/// ResponseMsg : "User Get Successfully!"

class ViewProfile {
  ViewProfile({
      OrderHistory? orderHistory, 
      String? responseCode, 
      String? result, 
      String? responseMsg,}){
    _orderHistory = orderHistory;
    _responseCode = responseCode;
    _result = result;
    _responseMsg = responseMsg;
}

  ViewProfile.fromJson(dynamic json) {
    _orderHistory = json['OrderHistory'] != null ? OrderHistory.fromJson(json['OrderHistory']) : null;
    _responseCode = json['ResponseCode'];
    _result = json['Result'];
    _responseMsg = json['ResponseMsg'];
  }
  OrderHistory? _orderHistory;
  String? _responseCode;
  String? _result;
  String? _responseMsg;
ViewProfile copyWith({  OrderHistory? orderHistory,
  String? responseCode,
  String? result,
  String? responseMsg,
}) => ViewProfile(  orderHistory: orderHistory ?? _orderHistory,
  responseCode: responseCode ?? _responseCode,
  result: result ?? _result,
  responseMsg: responseMsg ?? _responseMsg,
);
  OrderHistory? get orderHistory => _orderHistory;
  String? get responseCode => _responseCode;
  String? get result => _result;
  String? get responseMsg => _responseMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_orderHistory != null) {
      map['OrderHistory'] = _orderHistory?.toJson();
    }
    map['ResponseCode'] = _responseCode;
    map['Result'] = _result;
    map['ResponseMsg'] = _responseMsg;
    return map;
  }

}

/// id : "11"
/// name : "surendra"
/// mobile : "9999999999"
/// email : "deve@gmail.com"
/// status : "1"
/// wallet : "0"
/// profile_image : "uploads/63e3a99058c761675864464.png"

class OrderHistory {
  OrderHistory({
      String? id, 
      String? name, 
      String? mobile, 
      String? email, 
      String? status, 
      String? wallet, 
      String? profileImage,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _status = status;
    _wallet = wallet;
    _profileImage = profileImage;
}

  OrderHistory.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _status = json['status'];
    _wallet = json['wallet'];
    _profileImage = json['profile_image'];
  }
  String? _id;
  String? _name;
  String? _mobile;
  String? _email;
  String? _status;
  String? _wallet;
  String? _profileImage;
OrderHistory copyWith({  String? id,
  String? name,
  String? mobile,
  String? email,
  String? status,
  String? wallet,
  String? profileImage,
}) => OrderHistory(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  status: status ?? _status,
  wallet: wallet ?? _wallet,
  profileImage: profileImage ?? _profileImage,
);
  String? get id => _id;
  String? get name => _name;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get status => _status;
  String? get wallet => _wallet;
  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['status'] = _status;
    map['wallet'] = _wallet;
    map['profile_image'] = _profileImage;
    return map;
  }

}