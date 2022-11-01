import 'package:json_annotation/json_annotation.dart';

import '../../web/common/data/training.dart' as w_traings;
import 'indexable.dart';

part 'training.g.dart';

final _errors = <String, Exception>{
  'id': Exception('Data must conatin id for training!'),
  'code':Exception('Data must conatin code for training!'),
  'name':Exception('Data must conatin name for training!'),
  'level':Exception('Data must conatin level for training!'),
  'kind':Exception('Data must conatin kind for training!'),
};

@JsonSerializable(constructor: '_', ignoreUnannotated: true)
class Training implements Indexable
{

  factory Training.fromJson(final Map<String, dynamic> data)
  {
    _errors.forEach((key, value) => data[key] ?? (throw value),);
    return _$TrainingFromJson(data);
  }

  const Training._(this.id, this.code, this.name, this.level, this.kind);
  @override
  @JsonKey()
  final int id;
  @JsonKey()
  final String code;
  @JsonKey()
  final String name;
  @JsonKey()
  final String level;
  @JsonKey()
  final String kind;
  
  String get description => '$name - $level[$kind]';

  void toJosn(Map<String, dynamic> map)
  {
    map['Code'] = code;
    map['Description'] = description;
    map['Id'] = id;
  }

  w_traings.Training toTraining()
  {
    return w_traings.Training(Code: code, Id: id, Description: description);
  }

}
