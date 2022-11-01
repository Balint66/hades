import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../managers/trainings.dart';
import 'indexable.dart';
import 'training.dart';

part 'user.g.dart';

final _erros = <String, Exception>{
  'id': Exception('Data must contain an id!'),
  'userName': Exception('Data must contain a username!'),
  'password': Exception('Data for user must conatin password!'),
  'firstName': Exception('Data for user is missing first name!'),
  'secondName': Exception('Data for user is missing second name!'),
  'trainings': Exception('Data must contain valid training id!'),
};

HashSet<Training> _convert(List<dynamic> id) => HashSet.of(id.cast<int>()
  .map((e) => TraininingsManager.instance[e]
    ?? (throw Exception('Unable to find the right training data!')),),);

@JsonSerializable(constructor: '_', createToJson: false)
class User extends Equatable implements Indexable
{

  factory User.fromJson(final Map<String, dynamic> data){
    _erros.forEach((key, value) => data[key] ?? (throw value),);
    return _$UserFromJson(data);
  }

  User._(this.id, this.userName, this.password, this.firstName, this.secondName,
      Iterable<Training> trainings,) {
    this.trainings.addAll(trainings);
  }
  final String firstName;
  final String secondName;
  final String userName;
  final String password;
  @override
  final int id;
  @JsonKey(fromJson: _convert)
  final trainings = HashSet<Training>();
  
  @override
  @JsonKey(ignore: true)
  List<Object?> get props => [id, userName, password, firstName, secondName, trainings];

}
