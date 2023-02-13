/// Banneritem : [{"id":"2","bimg":"banner/63e34327cedc11675838248.png","status":"1"},{"id":"4","bimg":"banner/63e3425a9b0a21675838043.jpg","status":"1"}]
/// ResponseCode : "200"
/// Result : "true"
/// ResponseMsg : "Banner List Founded!"

class SliderModel {
  SliderModel({
      List<Banneritem>? banneritem,
      String? responseCode,
      String? result,
      String? responseMsg,}){
    _banneritem = banneritem;
    _responseCode = responseCode;
    _result = result;
    _responseMsg = responseMsg;
}

  SliderModel.fromJson(dynamic json) {
    if (json['Banneritem'] != null) {
      _banneritem = [];
      json['Banneritem'].forEach((v) {
        _banneritem?.add(Banneritem.fromJson(v));
      });
    }
    _responseCode = json['ResponseCode'];
    _result = json['Result'];
    _responseMsg = json['ResponseMsg'];
  }
  List<Banneritem>? _banneritem;
  String? _responseCode;
  String? _result;
  String? _responseMsg;
SliderModel copyWith({  List<Banneritem>? banneritem,
  String? responseCode,
  String? result,
  String? responseMsg,
}) => SliderModel(  banneritem: banneritem ?? _banneritem,
  responseCode: responseCode ?? _responseCode,
  result: result ?? _result,
  responseMsg: responseMsg ?? _responseMsg,
);
  List<Banneritem>? get banneritem => _banneritem;
  String? get responseCode => _responseCode;
  String? get result => _result;
  String? get responseMsg => _responseMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_banneritem != null) {
      map['Banneritem'] = _banneritem?.map((v) => v.toJson()).toList();
    }
    map['ResponseCode'] = _responseCode;
    map['Result'] = _result;
    map['ResponseMsg'] = _responseMsg;
    return map;
  }

}

/// id : "2"
/// bimg : "banner/63e34327cedc11675838248.png"
/// status : "1"

class Banneritem {
  Banneritem({
      String? id,
      String? bimg,
      String? status,}){
    _id = id;
    _bimg = bimg;
    _status = status;
}

  Banneritem.fromJson(dynamic json) {
    _id = json['id'];
    _bimg = json['bimg'];
    _status = json['status'];
  }
  String? _id;
  String? _bimg;
  String? _status;
Banneritem copyWith({  String? id,
  String? bimg,
  String? status,
}) => Banneritem(  id: id ?? _id,
  bimg: bimg ?? _bimg,
  status: status ?? _status,
);
  String? get id => _id;
  String? get bimg => _bimg;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bimg'] = _bimg;
    map['status'] = _status;
    return map;
  }

}