import 'indexable.dart';

class Message implements Indexable
{
  @override
  final int id;
  final int senderId;
  final String subject;
  final bool required;
  final String details;

  Message._(this.id, this.senderId, this.subject, this.required, this.details);

  factory Message.fromJson(Map<String, dynamic> data)
  {
    final id = data['id'] as int? ?? (throw Exception("Data must conatin id for message!"));
    final senderId = data['senderId'] as int? ?? (throw Exception("Data must conatin sender's id for message!"));
    final subject = data['subject'] as String? ?? (throw Exception("Data must conatin subject for message!"));
    final required = data['required'] as bool? ?? (throw Exception("Data must conatin required field for message!"));
    final details = data['details'] as String? ?? (throw Exception("Data must conatin details for message!"));
    return Message._(id, senderId, subject, required, details);
  }

}
