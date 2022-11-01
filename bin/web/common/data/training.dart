// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'training.g.dart';

@JsonSerializable(createFactory: false, ignoreUnannotated: true)
class Training extends Equatable {
  const Training({
    required this.Code,
    required this.Description,
    required this.Id,
  });

  @JsonKey()
  final String Code;
  @JsonKey()
  final String Description;
  @JsonKey()
  final int Id;

  void toJson([Map<String, dynamic> object = const <String, dynamic>{}])
    => _$TrainingToJson(this);
  
  @override
  List<Object> get props => [Code, Description, Id];

}
