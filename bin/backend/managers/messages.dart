import '../data/message.dart';
import 'base.dart';

class MessageManager extends Manager<Message> {
  
  static final instance = MessageManager();

  @override
  Constructor<Message> get constructor => Message.fromJson;

  @override
  String get path => 'assets/messages.json';

}
