import 'package:json_annotation/json_annotation.dart';

class FormatedDate extends DateTime {
  FormatedDate(super.millisecondsSinceEpoch)
    : super.fromMillisecondsSinceEpoch();

  @override
  String toString() => '/Date($millisecondsSinceEpoch)/';

  FormatedDate fromJson(String json) =>
    FormatedDate(int.parse(json.split('(').last.split(')').first));

}

class DateConverter extends JsonConverter<FormatedDate, String> {
  const DateConverter();

  @override
  FormatedDate fromJson(String json) =>
    FormatedDate(int.parse(json.split('(').last.split(')').first));

  @override
  String toJson(FormatedDate object) => object.toString();

}
