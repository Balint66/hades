import 'dart:collection';
import 'dart:convert';

import 'dart:io';

import '../data/indexable.dart';

typedef Constructor<T extends Indexable> = T Function(Map<String, dynamic>);  

abstract class Manager<T extends Indexable>{
  String get path;
  Constructor<T> get constructor;
  final HashSet<T> _set = HashSet<T>();
  Iterable<T> get items => _set;

  T? operator [](int item)
  {
    return _set.cast<T?>().firstWhere((i)=>i!.id == item, orElse: () => null,);
  }

  void load()
  {
    final str = File(path).readAsStringSync();
    final obj = (json.decode(str) as List<dynamic>)
      .cast<Map<String, dynamic>>();
    _set.addAll(obj.map(constructor));
  }

}
