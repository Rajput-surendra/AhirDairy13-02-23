/// Cityitem : [{"id":"1","title":"Milk","cimg":"category/63e387ae307aa1675855790.jpg","status":"1"},{"id":"2","title":"Dahi","cimg":"category/63e387e42c6e11675855844.jpg","status":"1"}]
/// ResponseCode : "200"
/// Result : "true"
/// ResponseMsg : "Category List Founded!"

class CateModel {
  CateModel({
      List<Cityitem>? cityitem, 
      String? responseCode, 
      String? result, 
      String? responseMsg,}){
    _cityitem = cityitem;
    _responseCode = responseCode;
    _result = result;
    _responseMsg = responseMsg;
}

  CateModel.fromJson(dynamic json) {
    if (json['Cityitem'] != null) {
      _cityitem = [];
      json['Cityitem'].forEach((v) {
        _cityitem?.add(Cityitem.fromJson(v));
      });
    }
    _responseCode = json['ResponseCode'];
    _result = json['Result'];
    _responseMsg = json['ResponseMsg'];
  }
  List<Cityitem>? _cityitem;
  String? _responseCode;
  String? _result;
  String? _responseMsg;
CateModel copyWith({  List<Cityitem>? cityitem,
  String? responseCode,
  String? result,
  String? responseMsg,
}) => CateModel(  cityitem: cityitem ?? _cityitem,
  responseCode: responseCode ?? _responseCode,
  result: result ?? _result,
  responseMsg: responseMsg ?? _responseMsg,
);
  List<Cityitem>? get cityitem => _cityitem;
  String? get responseCode => _responseCode;
  String? get result => _result;
  String? get responseMsg => _responseMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cityitem != null) {
      map['Cityitem'] = _cityitem?.map((v) => v.toJson()).toList();
    }
    map['ResponseCode'] = _responseCode;
    map['Result'] = _result;
    map['ResponseMsg'] = _responseMsg;
    return map;
  }

}

/// id : "1"
/// title : "Milk"
/// cimg : "category/63e387ae307aa1675855790.jpg"
/// status : "1"

class Cityitem {
  Cityitem({
      String? id, 
      String? title, 
      String? cimg, 
      String? status,}){
    _id = id;
    _title = title;
    _cimg = cimg;
    _status = status;
}

  Cityitem.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _cimg = json['cimg'];
    _status = json['status'];
  }
  String? _id;
  String? _title;
  String? _cimg;
  String? _status;
Cityitem copyWith({  String? id,
  String? title,
  String? cimg,
  String? status,
}) => Cityitem(  id: id ?? _id,
  title: title ?? _title,
  cimg: cimg ?? _cimg,
  status: status ?? _status,
);
  String? get id => _id;
  String? get title => _title;
  String? get cimg => _cimg;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['cimg'] = _cimg;
    map['status'] = _status;
    return map;
  }

}