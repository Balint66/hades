import '../data/training.dart';
import 'base.dart';


class TraininingsManager extends Manager<Training>
{

  static final instance = TraininingsManager();

  @override
  final constructor = Training.fromJson;

  @override
  final path = 'assets/trainings.json';

}
