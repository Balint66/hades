import '../../web/common/data/training.dart' as w_traings;
import 'indexable.dart';

class Training implements Indexable
{
  @override
  final int id;
  final String code;
  final String name;
  final String level;
  final String kind;
  String get description => '$name - $level[$kind]';

  Training._(this.id, this.code, this.name, this.level, this.kind);

  factory Training.fromJson(final Map<String, dynamic> data)
  {

    final id = data['id'] as int? ?? (throw Exception("Data must conatin id for training!"));
    final code = data['code'] as String? ?? (throw Exception("Data must conatin code for training!"));
    final name = data['name'] as String? ?? (throw Exception("Data must conatin name for training!"));
    final level = data['level'] as String? ?? (throw Exception("Data must conatin level for training!"));
    final kind = data['kind'] as String? ?? (throw Exception("Data must conatin kind for training!"));

    return Training._(id, code, name, level, kind);
  }

  void toJosn(Map<String, dynamic> map)
  {
    map["Code"] = code;
    map["Description"] = description;
    map["Id"] = id;
  }

  w_traings.Training toTraining()
  {
    return w_traings.Training(Code: code, Id: id, Description: description);
  }

}