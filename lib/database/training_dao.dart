import 'package:sqflite/sqflite.dart';
import 'package:ironchampions_gym/database/database.dart';
import 'package:ironchampions_gym/components/training.dart';

class TrainingDao {
  static const String _tableTraining = 'tableTraining';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _segunda = 'segunda';
  static const String _Tsegunda = 'Tsegunda';
  static const String _terca = 'terca';
  static const String _Tterca = 'Tterca';
  static const String _quarta = 'quarta';
  static const String _Tquarta = 'Tquarta';
  static const String _quinta = 'quinta';
  static const String _Tquinta = 'Tquinta';
  static const String _sexta = 'sexta';
  static const String _Tsexta = 'Tsexta';
  static const String _sabado = 'sabado';
  static const String _Tsabado = 'Tsabado';
  static const String _domingo = 'domingo';
  static const String _Tdomingo = 'Tdomingo';

  static const String tableSql = 'CREATE TABLE $_tableTraining('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_name TEXT, '
      '$_segunda TEXT, '
      '$_Tsegunda TEXT, '
      '$_terca TEXT, '
      '$_Tterca TEXT, '
      '$_quarta TEXT, '
      '$_Tquarta TEXT, '
      '$_quinta TEXT, '
      '$_Tquinta TEXT, '
      '$_sexta TEXT, '
      '$_Tsexta TEXT, '
      '$_sabado TEXT, '
      '$_Tsabado TEXT, '
      '$_domingo TEXT, '
      '$_Tdomingo TEXT)';

  Future<int> save(Trainings training) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(training.id);
    Map<String, dynamic> trainingMap = _toMap(training);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(
        _tableTraining,
        trainingMap,
      );
    } else {
      return await bancoDeDados.update(
        _tableTraining,
        trainingMap,
        where: '$_id = ?',
        whereArgs: [training.id],
      );
    }
  }

  Map<String, dynamic> _toMap(Trainings training) {
    final Map<String, dynamic> trainingMap = {
      _name: training.name,
      _segunda: training.segunda,
      _Tsegunda: training.Tsegunda,
      _terca: training.terca,
      _Tterca: training.Tterca,
      _quarta: training.quarta,
      _Tquarta: training.Tquarta,
      _quinta: training.quinta,
      _Tquinta: training.Tquinta,
      _sexta: training.sexta,
      _Tsexta: training.Tsexta,
      _sabado: training.sabado,
      _Tsabado: training.Tsabado,
      _domingo: training.domingo,
      _Tdomingo: training.Tdomingo,
    };
    return trainingMap;
  }



  Future<List<Trainings>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tableTraining);
    return _toList(result);
  }

  List<Trainings> _toList(List<Map<String, dynamic>> trainingMapList) {
    final List<Trainings> trainings = [];
    for (Map<String, dynamic> trainingMap in trainingMapList) {
      final Trainings training = Trainings(
        id: trainingMap[_id],
        name: trainingMap[_name],
        segunda: trainingMap[_segunda],
        Tsegunda: trainingMap[_Tsegunda],
        terca: trainingMap[_terca],
        Tterca: trainingMap[_Tterca],
        quarta: trainingMap[_quarta],
        Tquarta: trainingMap[_Tquarta],
        quinta: trainingMap[_quinta],
        Tquinta: trainingMap[_Tquinta],
        sexta: trainingMap[_sexta],
        Tsexta: trainingMap[_Tsexta],
        sabado: trainingMap[_sabado],
        Tsabado: trainingMap[_Tsabado],
        domingo: trainingMap[_domingo],
        Tdomingo: trainingMap[_Tdomingo],
      );
      trainings.add(training);
    }
    return trainings;
  }

  Future<List<Trainings>> find(int trainingId) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableTraining,
      where: '$_id = ?',
      whereArgs: [trainingId],
    );
    return _toList(result);
  }

  Future<int> getLastId() async {
    final Database bancoDeDados = await getDatabase();
    List<Map<String, dynamic>> result = await bancoDeDados.rawQuery('SELECT MAX($_id) as $_id FROM $_tableTraining');
    int lastId = result[0][_id];
    return lastId != null ? lastId : 0;
  }
  Future<void> insertTraining(Trainings training) async {
    final db = await getDatabase();
    await db.insert(_tableTraining, _toMap(training));
  }

  Future<int> update(Trainings training) async {
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.update(
      _tableTraining,
      _toMap(training),
      where: '$_id = ?',
      whereArgs: [training.id],
    );
  }
}
