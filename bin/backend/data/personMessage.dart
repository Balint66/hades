import 'indexable.dart';
import 'message.dart';

class PersonMessage implements Indexable
{
  @override
  final int id;
  final bool isNew;
  final Message msg;

  PersonMessage._(this.id, this.msg, {required this.isNew});

  factory PersonMessage.fromJson(Map<String, dynamic> data)
  {
    final id = data['id'] as int? ?? (throw Exception("Data must conatin id for person's message!"));
    final isNew = data['isNew'] as bool? ?? (throw Exception("Data must conatin isNew field for person's message!"));
    final mid = data['message'] as int? ?? (throw Exception("Data must conatin id for the referenced message!"));
    throw "Get the message with id $mid from the manager!";
    //return PersonMessage._(id, isNew, msg);
  }

}
