import '../data/user.dart';
import 'base.dart';

class UsersManager extends Manager<User>
{

  static final INSTANCE = UsersManager();

  @override
  final constructor = User.fromJson;

  @override
  final path = "assets/users.json";

  User find(String username)
  {
    return items.firstWhere((element) => element.userName == username);
  }

}
