import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../web/common/data/formated_date.dart';
import '../managers/users.dart';
import 'indexable.dart';

part 'message.g.dart';

final _errors = <String, Exception>{
  'Id': Exception('Data must conatin id for message!'),
  'senderId': Exception("Data must conatin sender's id for message!"),
  'Subject': Exception('Data must conatin subject for message!'),
  'required': Exception('Data must conatin required field for message!'),
  'Details': Exception('Data must conatin details for message!'),
  'SendDate': Exception('Data must contain the date when the messahge was sent!'),
};

@JsonSerializable(ignoreUnannotated: true,
  constructor: '_',)
class Message extends Equatable implements Indexable
{

  factory Message.fromJson(Map<String, dynamic> data)
  {
    _errors.forEach((key, value) => data[key] ?? (throw value),);
    return _$MessageFromJson(data);
  }

  const Message._(this.id, this.senderId, this.subject,
    this.required, this.details, this.sendDate,);
  @override
  @JsonKey(name: 'Id')
  final int id;
  @JsonKey()
  final int senderId;
  @JsonKey(name: 'Subject')
  final String subject;
  @JsonKey(toJson: null)
  final bool required;
  @JsonKey(name: 'Details')
  final String details;
  @JsonKey(name: 'SendDate')
  @DateConverter()
  final FormatedDate sendDate;

  Map<String, dynamic> get sender {
    final user = UsersManager.instance[senderId]!;
    return <String, dynamic>{
      'Name': '${user.firstName} ${user.secondName}',
      'UserCode': user.userName,
    };
  }

  Map<String, dynamic> toJson() => _$MessageToJson(this)
  ..remove('required')
  ..remove('senderId')
  ..addAll(sender);
  
  @override
  List<Object> get props => [ id, senderId, subject, required,
                              details, sendDate];

}
