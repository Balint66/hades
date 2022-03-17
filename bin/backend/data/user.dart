import 'dart:collection';

import '../managers/trainings.dart';
import 'indexable.dart';
import 'training.dart';

class User implements Indexable
{
  final String firstName;
  final String secondName;
  final String userName;
  final String password;
  @override
  final int id;
  final HashSet<Training> trainings = HashSet();

  User._(this.id, this.userName, this.password, this.firstName, this.secondName, List<Training> trainings)
  {
    this.trainings.addAll(trainings);
  }

  factory User.fromJson(final Map<String, dynamic> data)
  {
    final id = data["id"] as int? ?? (throw Exception("Data must contain an id!"));
    final username = data["username"] as String ? ?? (throw Exception("Data must contain a username!"));
    final pass = data["password"] as String? ?? (throw Exception("Data for user must conatin password!"));
    final fname = data["firstName"] as String? ?? (throw Exception("Data for user is missing first name!"));
    final sname = data["secondName"] as String? ?? (throw Exception("Data for user is missing second name!"));
    final List<int> trainings = ((data["trainings"] as List<dynamic>?)?.cast()) ?? (throw Exception("Data for user is missing traininig lista!"));
    final t = trainings.map((e) => TraininingsManager.INSTANCE[e],).toList();
    if(t.any((e) => e == null,)) throw Exception("Data must contain valid training id!");
    return User._(id, username, pass, fname, sname, t.cast());
  }

}
