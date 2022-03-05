// ignore_for_file: non_constant_identifier_names

class Base
{

  final int TotalRowCount;
  final String UserLogin;
  final String Password;
  final int CurrentPage;
  final String? StudentTrainingID;
  final int LCID; //Csak magyar diákokkal foglalkozunk

  const Base({this.TotalRowCount = -1, this.CurrentPage = 0,
  required this.UserLogin, required this.Password, this.StudentTrainingID,})
    : LCID = 1038;

  factory Base.fromJson(final Map<String, dynamic> object)
  {
    final user = object["UserLogin"] as String? ?? "";
    final password = object["Password"] as String? ?? "";
    final int currentPage = object["CurrentPage"] as int? ?? 0;
    final String? training = object["StudentTrainingID"] as String?;
    final int totalRow = object["TotalRowCount"] as int? ?? -1;

    return Base(UserLogin: user, Password: password, StudentTrainingID: training,
      CurrentPage: currentPage, TotalRowCount: totalRow,);
  }

  @override
  void toJson(final Map<String, dynamic> baseObject)
  {
    baseObject["TotalRowCount"] = TotalRowCount;
    baseObject["UserLogin"] = UserLogin;
    baseObject["Password"] = Password;
    baseObject["CurrentPage"] = CurrentPage;
    baseObject["StudentTrainingID"] = StudentTrainingID;
    baseObject["LCID"] = LCID; 
  }

}
