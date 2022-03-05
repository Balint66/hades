// ignore_for_file: non_constant_identifier_names

import '../common/data/training.dart';
import 'response_base.dart';

class LoginR implements ResponseBase
{
  final List<Training> traininngs;
  final ResponseBase _encapsulated;

  @override
  int get CurrentPage => _encapsulated.CurrentPage;

  @override
  String? get ErrorMessage => _encapsulated.ErrorMessage;

  @override
  Map<String, dynamic>? get ExceptionData => _encapsulated.ExceptionData;

  @override
  int get ExceptionsEnum => _encapsulated.ExceptionsEnum;

  @override
  int get LCID => _encapsulated.LCID;

  @override
  int get MobileServiceVersion => _encapsulated.MobileServiceVersion;

  @override
  String get Password => _encapsulated.Password;

  @override
  String? get StudentTrainingID => _encapsulated.StudentTrainingID;

  @override
  int get TotalRowCount => _encapsulated.TotalRowCount;

  @override
  String get UserLogin => _encapsulated.UserLogin;

  LoginR(this._encapsulated, {required this.traininngs});

  @override
  void toJson(Map<String, dynamic> baseObject) {
    _encapsulated.toJson(baseObject);
    final trainingsJson = traininngs.map((e) {
      final json = <String, dynamic>{};
      e.toJson(json);
      return json;
    },).toList(growable: false);
    baseObject["TrainingList"] = trainingsJson;
  }
}
