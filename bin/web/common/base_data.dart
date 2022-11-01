import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_data.g.dart';

mixin IBase on Equatable{
  IBase get base;

  @override
  List<Object> get props => [];

  T? findAs<T>() => this is T ? this as T : base.findAs();

}

mixin JsonBase on IBase
{
  Map<String, dynamic> toJson([final Map<String, dynamic> baseObject
    = const <String, dynamic>{},]);
  
}

typedef BuilderAddFunction = IBase? Function(IBase base);

class Builder{

  IBase _base = Empty.instance;

  void add(BuilderAddFunction fn) => _base = fn(_base) ?? _base;
  void addDefaults(Map<String, dynamic> object){
    add((base) =>Trash.validate(object) ? Trash(base: base as JsonBase) : null,);
    add((base) => Base.validate(object) ? Base(
      base: base as JsonBase, password: object['Password'] as String,
      user: object['UserLogin'] as String,)
    : null,);
  }

  IBase build() => _base;
}

class Empty extends Equatable with IBase, JsonBase {

  const Empty._();
  static const Empty instance  = Empty._();

  @override
  IBase get base => instance;

  @override
  List<Object> get props => [];

  @override
  T? findAs<T>() => this is T ? this as T : null;
  
  @override
  Map<String, dynamic> toJson(
    [Map<String, dynamic> baseObject = const <String, dynamic>{},]
    ) => <String, dynamic>{}..addAll(baseObject);
}

@JsonSerializable(createFactory: false, ignoreUnannotated: true)
class Trash extends Equatable with IBase, JsonBase {
  Trash({this.rowCount = -1, this.page = 0, this.base = Empty.instance});

  @JsonKey(name: 'CurrentPage')
  final int page;
  @JsonKey(name: 'TotalRowCount')
  final int rowCount;

  @JsonKey(ignore: true)
  @override
  final JsonBase base;

  @override
  List<Object> get props => [page, rowCount];

  static bool validate(Map<String, dynamic> object) => object.keys
    .where((element) => ['CurrentPage', 'TotalRowCount'].contains(element),)
      .length == 2;

  @override
  Map<String, dynamic> toJson(
    [Map<String, dynamic> baseObject = const <String, dynamic>{},]
    ) => base.toJson(baseObject)..addAll(_$TrashToJson(this));

}

@JsonSerializable(createFactory: false, ignoreUnannotated: true)
class Base extends Equatable with IBase, JsonBase {
  const Base({required this.base, required this.user, required this.password,});

  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'UserLogin')
  final String user;
  //Csak magyar diákokkal foglalkozunk
  @JsonKey(name: 'LCID')
  final int local = 1038;

  @JsonKey(ignore: true)
  @override
  final JsonBase base;

  @override
  List<Object> get props => [password, user, local, base];

  static bool validate(Map<String, dynamic> object) => object.keys
    .where((element) => ['Password','UserLogin'].contains(element),)
      .length == 2;

  @override
  Map<String, dynamic> toJson(
    [Map<String, dynamic> baseObject = const <String, dynamic>{},])
    => base.toJson(baseObject)..addAll(_$BaseToJson(this));

}

@JsonSerializable(createFactory: false, ignoreUnannotated: true)
class Training extends Equatable with IBase, JsonBase {
  Training({required this.base,required this.studentTrainingID});

  @JsonKey(name: 'StudentTrainingID')
  final int studentTrainingID;
  @JsonKey(ignore: true)
  @override
  final JsonBase base;
  
  @override
  List<Object> get props => [studentTrainingID, base];
  
  static bool validate(Map<String, dynamic> object) => object.keys
    .where((element) => ['StudentTrainingID'].contains(element),)
      .length == 1;

  @override
  Map<String, dynamic> toJson(
    [Map<String, dynamic> baseObject = const <String, dynamic>{},]
    ) => baseObject..addAll(_$TrainingToJson(this));
}
