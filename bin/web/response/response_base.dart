import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../common/base_data.dart';

part 'response_base.g.dart';

@JsonSerializable(createFactory: false, ignoreUnannotated: true)
abstract class ResponseBase extends Equatable with IBase, JsonBase {
  const ResponseBase(this.base, {this.exceptionsEnum = 0,
    this.errorMessage = '', this.exceptionData = const <String, dynamic>{},}) 
    : mobileServiceVersion = 6; //Mert a hatos szám a kedvencem, de simán lehetne itt 5 is.

  @JsonKey(name: 'ExceptionsEnum')
  final int exceptionsEnum;
  @JsonKey(name: 'ErrorMessage')
  final String errorMessage;
  @JsonKey(name: 'ExceptionData')
  final Map<String, dynamic> exceptionData;
  @JsonKey(name: 'MobileServiceVersion')
  final int mobileServiceVersion;

  @override
  final JsonBase base;

  @override
  Map<String, dynamic> toJson(
    [final Map<String, dynamic> baseObject = const <String, dynamic>{},]) =>
    base.toJson(baseObject)..addAll(_$ResponseBaseToJson(this));
  
  @override
  List<Object> get props => [ base, exceptionsEnum, errorMessage,
                              exceptionData, mobileServiceVersion];
}
