// ignore_for_file: non_constant_identifier_names

import '../common/base_data.dart';
import 'request_base.dart';

class Login extends RequestBase
{
  final bool OnlyLogin;

  Login(Base base, {this.OnlyLogin = false}): super(base);

  factory Login.fromJson(final Map<String, dynamic> object)
  {
    final base = RequestBase.fromJson(object);
    final onlyLogin = object["OnlyLogin"] as bool? ?? false;
    return Login(base, OnlyLogin: onlyLogin);
  }

  @override
  void toJson(final Map<String, dynamic> baseObject) {
    super.toJson(baseObject);
    baseObject["OnlyLogin"] = OnlyLogin;
  }

}
