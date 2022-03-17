import 'dart:collection';
import 'dart:convert';

import 'dart:io';

import '../data/indexable.dart';

typedef _Cnstr<T extends Indexable> = T Function(Map<String, dynamic>);  

abstract class Manager<T extends Indexable>
{
  String get path;
  _Cnstr<T> get constructor;
  final HashSet<T> _set = HashSet<T>();
  Iterable<T> get items => _set;

  T? operator [](int item)
  {
    return _set.firstWhere((i)=>i.id == item);
  }

  void load()
  {
    final str = File(path).readAsStringSync();
    final List<Map<String, dynamic>> obj = (json.decode(str) as List<dynamic>).cast();
    _set.addAll(obj.map(constructor));
  }

}
