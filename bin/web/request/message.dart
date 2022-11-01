import '../common/base_data.dart';
import 'request_base.dart';

class Message extends RequestBase{
  const Message(super.base);
  factory Message.fromJson(Map<String, dynamic> map){
    final base = Builder()..addDefaults(map);
    return Message(base.build());
  }
}
