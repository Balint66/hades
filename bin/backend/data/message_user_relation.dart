import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../managers/users.dart';
import 'indexable.dart';
import 'person_message.dart';
import 'user.dart';

@JsonSerializable(createToJson: false, createFactory: false)
class MessageUserRelation extends Equatable implements Indexable{
  const MessageUserRelation(this.user, this.messages);
  factory MessageUserRelation.fromJson(Map<String, dynamic> map){
    final set = HashSet<PersonMessage>.from(
      (map['messages'] as List<dynamic>)
          .map((dynamic e) => PersonMessage.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );
    final user = UsersManager.instance[map['user'] as int]!;
    return MessageUserRelation(user, set);
  }

  final User user;
  final Set<PersonMessage> messages;
  @override
  int get id => user.id;
  @override
  @JsonKey(ignore: true)
  List<Object?> get props => [user, messages];
}
