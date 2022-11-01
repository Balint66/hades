// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import '../common/data/training.dart';
import 'response_base.dart';

part 'login.g.dart';

@JsonSerializable(createFactory: false, ignoreUnannotated: true)
class Login extends ResponseBase {
  const Login(super.base, {required this.traininngs});

  @JsonKey(name: 'TrainingList')
  final List<Training> traininngs;

  @override
  Map<String, dynamic> toJson([Map<String, dynamic> baseObject = const <String, dynamic>{}]) =>
    super.toJson(baseObject)
      ..addAll(_$LoginToJson(this));
  
}
