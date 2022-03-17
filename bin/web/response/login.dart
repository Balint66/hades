// ignore_for_file: non_constant_identifier_names

import '../common/data/training.dart';
import 'response_base.dart';

class LoginR extends ResponseBase
{
  final List<Training> traininngs;

  LoginR(ResponseBase base, {required this.traininngs}) : super(base);

  @override
  void toJson(Map<String, dynamic> baseObject) {
    super.toJson(baseObject);
    final trainingsJson = traininngs.map((e) {
      final json = <String, dynamic>{};
      e.toJson(json);
      return json;
    },).toList(growable: false);
    baseObject["TrainingList"] = trainingsJson;
  }
}
