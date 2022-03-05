// ignore_for_file: non_constant_identifier_names

import 'request_base.dart';

class Login implements RequestBase
{
  final bool OnlyLogin;
  final RequestBase _encapsulated;

  @override
  int get CurrentPage => _encapsulated.CurrentPage;
  @override
  int get LCID => throw _encapsulated.LCID;
  @override
  String get Password => _encapsulated.Password;
  @override
  String? get StudentTrainingID => _encapsulated.StudentTrainingID;
  @override
  int get TotalRowCount => _encapsulated.TotalRowCount;
  @override
  String get UserLogin => _encapsulated.UserLogin;
  @override
  String get MobileVersion => _encapsulated.MobileVersion;

  Login(this._encapsulated, {this.OnlyLogin = false});

  factory Login.fromJson(final Map<String, dynamic> object)
  {
    final base = RequestBase.fromJson(object);
    final onlyLogin = object["OnlyLogin"] as bool? ?? false;
    return Login(base, OnlyLogin: onlyLogin);
  }

  @override
  void toJson(final Map<String, dynamic> baseObject) {
    _encapsulated.toJson(baseObject);
    baseObject["OnlyLogin"] = OnlyLogin;
  }

}
