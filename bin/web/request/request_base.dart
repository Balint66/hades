import '../common/base_data.dart';

class RequestBase implements Base
{
  final String MobileVersion;
  final Base _encapsulated;

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

  const RequestBase(this._encapsulated,) : MobileVersion = "1.5.2-rc1";

  factory RequestBase.fromJson(final Map<String,dynamic> baseObject)
  {
    final base = Base.fromJson(baseObject);
    return RequestBase(base);
  }

  @override
  void toJson(final Map<String, dynamic> baseObject) {
   _encapsulated.toJson(baseObject);
   baseObject["MobileVersion"] = MobileVersion; 
  }

  

}