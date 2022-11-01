import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../managers/messages.dart';
import 'indexable.dart';
import 'message.dart';

part 'person_message.g.dart';

final _errors = <String, Exception>{
  'id': Exception("Data must conatin id for person's message!"),
  'isNew': Exception("Data must conatin isNew field for person's message!"),
  'message': Exception('Data must conatin id for the referenced message!'),
};

Message _convert(int id) => MessageManager.instance[id]!;

@JsonSerializable(constructor: '_',
ignoreUnannotated: true, createToJson: false,)
class PersonMessage extends Equatable implements Indexable
{

  factory PersonMessage.fromJson(Map<String, dynamic> data)
  {
    _errors.forEach((key, value) => data[key] ?? (throw value),);
    return _$PersonMessageFromJson(data);
  }

  const PersonMessage._(this.id, this.message, {required this.isNew});
  @override
  @JsonKey()
  final int id;
  @JsonKey()
  final bool isNew;
  @JsonKey(fromJson: _convert)
  final Message message;

  Map<String, dynamic> toJson() => message.toJson()
    ..['IsNew'] = isNew
    ..['PersonMessageId'] = id;
  
  @override
  List<Object?> get props => [id, isNew, message];

}
