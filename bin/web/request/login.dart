// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import '../common/base_data.dart';
import 'request_base.dart';

@JsonSerializable(createToJson: false, createFactory: false)
class Login extends RequestBase {

  const Login(super.base, {this.onlyLogin = false});

  factory Login.fromJson(final Map<String, dynamic> object)
  {
    final base = Builder()..addDefaults(object);
    final onlyLogin = object['OnlyLogin'] as bool? ?? false;
    return Login(base.build(), onlyLogin: onlyLogin);
  }

  final bool onlyLogin;

}
