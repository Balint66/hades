// ignore_for_file: non_constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/base_data.dart';

abstract class RequestBase extends Equatable with IBase {

  const RequestBase(this.base,) 
    // ignore: avoid_field_initializers_in_const_classes
    : MobileVersion = '1.5.2-rc1';

  final String MobileVersion;
  @override
  @JsonKey(ignore: true)
  final IBase base;
  
  @override
  List<Object> get props => [base, MobileVersion];

  

}
