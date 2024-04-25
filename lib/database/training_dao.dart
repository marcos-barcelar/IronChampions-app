import 'package:sqflite/sqflite.dart';
import 'package:ironchampions_gym/database/database.dart';
import 'package:ironchampions_gym/components/training.dart';

class UsersDao {
  static const String tableSql = 'CREATE TABLE $_tableTraining('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_name TEXT, '
      '$_segunda TEXT, '
      '$_terca TEXT, '
      '$_quarta TEXT, '
      '$_quinta TEXT)';
      '$_sexta TEXT)';
      '$_sabado TEXT)';
      '$_domingo TEXT)';

  static const String _tableUsers = 'tableUsers';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _segunda = 'segunda';
  static const String _terca = 'terca';
  static const String _quarta = 'quarta';
  static const String _quinta = 'quinta';
  static const String _sexta = 'sexta';
  static const String _sabado = 'sabado';
  static const String _domingo = 'domingo';


  Future<int> save(Trainings training) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(training.id);
    Map<String, dynamic> userMap = toMap(training);
    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(
        _tableUsers,
        userMap,
      );
    } else {
      return await bancoDeDados.update(
        _tableUsers,
        userMap,
        where: '$_id = ?',
        whereArgs: [training.id],
      );
    }
  }

  Map<String, dynamic> toMap(Users user) {
    final Map<String, dynamic> userMap = {
      _name: user.name,
      _dtNascimento: user.dtNascimento,
      _genero: user.genero,
      _cpf: user.cpf,
      _senha: user.senha,
    };
    return userMap;
  }

  Future<List<Users>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tableUsers);
    return toList(result);
  }

  List<Users> toList(List<Map<String, dynamic>> userMapList) {
    final List<Users> users = [];
    for (Map<String, dynamic> userMap in userMapList) {
      final Users user = Users(
        id: userMap[_id],
        name: userMap[_name],
        dtNascimento: userMap[_dtNascimento],
        genero: userMap[_genero],
        cpf: userMap[_cpf],
        senha: userMap[_senha],
      );
      users.add(user);
    }
    return users;
  }

  Future<List<Users>> find(int userId) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableUsers,
      where: '$_id = ?',
      whereArgs: [userId],
    );
    return toList(result);
  }

  Future<bool> login(String cpf, String senha) async {
    List<Users> users = await findUserByCPF(cpf);
    if (users.isNotEmpty && users[0].senha == senha) {
      _loggedInUserCPF = cpf;
      return true;
    } else {
      return false;
    }
  }

  Future<List<Users>> findUserByCPF(String cpf) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableUsers,
      where: '$_cpf = ?',
      whereArgs: [cpf],
    );
    if (_loggedInUserCPF != null) {
      return toList(result.where((user) => user[_cpf] == _loggedInUserCPF).toList());
    } else {
      return toList(result);
    }
  }

  Future<int> update(Users user) async {
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.update(
      _tableUsers,
      toMap(user),
      where: '$_id = ?',
      whereArgs: [user.id],
    );
  }
}