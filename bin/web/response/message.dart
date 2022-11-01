import 'package:json_annotation/json_annotation.dart';

import '../../backend/data/person_message.dart';
import 'response_base.dart';

part 'message.g.dart';

@JsonSerializable(createFactory: false, ignoreUnannotated: true,
explicitToJson: true,)
class Message extends ResponseBase{
  const Message(super.base, {this.messageList = const []});
  @JsonKey(name: 'MessageList')
  final List<PersonMessage> messageList;

  @JsonKey(name: 'NewMessagesNumber')
  int get newMessageCount => messageList.where((e)=> e.isNew).length;
  @JsonKey(name: 'RequireToReadMessagesList')
  List<PersonMessage> get requiredMessages => messageList
    .where((e)=>e.message.required).toList(growable: false);

  @override
  Map<String, dynamic> toJson(
    [Map<String, dynamic> baseObject = const <String, dynamic>{},]){
    return super.toJson(baseObject)
      ..addAll(_$MessageToJson(this));
  }
}
