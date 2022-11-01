import '../data/user.dart';
import 'base.dart';

class UsersManager extends Manager<User>
{

  static final instance = UsersManager();

  @override
  final constructor = User.fromJson;

  @override
  final path = 'assets/users.json';

  User? find(String username)
  {
    return items.cast<User?>().firstWhere(
      (element) => element!.userName == username,
      orElse: () => null,);
  }

}
