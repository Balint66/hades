import '../data/message_user_relation.dart';
import '../data/user.dart';
import 'base.dart';

class MessageUserRelationManager extends Manager<MessageUserRelation>{
  static final instance = MessageUserRelationManager();
  @override
  Constructor<MessageUserRelation> get constructor
    => MessageUserRelation.fromJson;
  @override
  String get path => 'assets/person_messages.json';
  MessageUserRelation? find(User user){
    return items.cast<MessageUserRelation?>() 
      .firstWhere((element) => element!.user == user,
      orElse: () => null,);
  }
}
