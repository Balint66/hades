// ignore_for_file: non_constant_identifier_names

import '../common/base_data.dart';

class ResponseBase implements Base
{
  final int ExceptionsEnum;
  final String? ErrorMessage;
  final Map<String, dynamic>? ExceptionData;
  final int MobileServiceVersion;

  @override
  int get CurrentPage => _encapsulated.CurrentPage;
  @override
  int get LCID => _encapsulated.LCID;
  @override
  String get Password => _encapsulated.Password;
  @override
  String? get StudentTrainingID => _encapsulated.StudentTrainingID;
  @override
  int get TotalRowCount => _encapsulated.TotalRowCount;
  @override
  String get UserLogin => _encapsulated.UserLogin;

  final Base _encapsulated;

  ResponseBase(this._encapsulated, {this.ExceptionsEnum = 0, this.ErrorMessage, this.ExceptionData}) 
    : MobileServiceVersion = 6; //Mert a hatos szám a kedvencem, de simán lehetne itt 5 is.

  factory ResponseBase.fromJson(final Map<String, dynamic> object)
  {
    final base = Base.fromJson(object);
    final eEnum = object["ExceptionsEnum"] as int? ?? 0;
    final eMessage = object["ErrorMessage"] as String?;
    final eData = object["ExceptionData"] as Map<String, dynamic>?;

    return ResponseBase(base, ExceptionsEnum: eEnum,
      ErrorMessage: eMessage, ExceptionData: eData);

  }

  @override
  void toJson(final Map<String, dynamic> baseObject) {
    _encapsulated.toJson(baseObject);

    baseObject["ExceptionsEnum"] = ExceptionsEnum;
    baseObject["ErrorMessage"] = ErrorMessage;
    baseObject["ExceptionData"] = ExceptionData;

  }
}
