import 'dart:convert';

/// success : true
/// data : null
/// message : "Content reported successfully."

GenericReponseWrapper genericReponseWrapperFromJson(String str) => GenericReponseWrapper.fromJson(json.decode(str));
String genericReponseWrapperToJson(GenericReponseWrapper data) => json.encode(data.toJson());

class GenericReponseWrapper {
  GenericReponseWrapper({
    bool? success,
    dynamic data,
    String? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  GenericReponseWrapper.fromJson(dynamic json) {
    _success = json['status'];
    _data = json['data'];

    if (json['message'] is List) {
      _message = json['message'].first;
    } else {
      _message = json['message'];
    }
  }
  bool? _success;
  dynamic _data;
  String? _message;
  GenericReponseWrapper copyWith({
    bool? success,
    dynamic data,
    String? message,
  }) =>
      GenericReponseWrapper(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
      );
  bool? get success => _success;
  dynamic get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _success;
    map['data'] = _data;
    map['message'] = _message;
    return map;
  }
}
