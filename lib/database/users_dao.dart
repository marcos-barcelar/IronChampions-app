import 'package:ironchampions_gym/components/users.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ironchampions_gym/database/database.dart';

class UsersDao {
  static const String tableSql = 'CREATE TABLE $_tableUsers('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT,'
      '$_name TEXT, '
      '$_dtNascimento DATE, '
      '$_genero TEXT, '
      '$_cpf TEXT, '
      '$_senha TEXT)';

  static const String _tableUsers = 'tableUsers';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _dtNascimento = 'dtNascimento';
  static const String _genero = 'genero';
  static const String _cpf = 'cpf';
  static const String _senha = 'senha';

  Future<int> save(Users user) async {
    print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(user.id);
    Map<String, dynamic> userMap = toMap(user);
    if (itemExists.isEmpty) {
      print('Usuário não existia.');
      return await bancoDeDados.insert(
        _tableUsers,
        userMap,
      );
    } else {
      print('Usuário já existia.');
      return await bancoDeDados.update(
        _tableUsers,
        userMap,
        where: '$_id = ?',
        whereArgs: [user.id],
      );
    }
  }

  Map<String, dynamic> toMap(Users user) {
    print('Convertendo usuário em Map: ');
    final Map<String, dynamic> userMap = Map();
    userMap[_name] = user.name;
    userMap[_dtNascimento] = user.dtNascimento;
    userMap[_genero] = user.genero;
    userMap[_cpf] = user.cpf;
    userMap[_senha] = user.senha;
    print('Mapa de Usuário: $userMap');
    return userMap;
  }

  Future<List<Users>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tableUsers);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Users> toList(List<Map<String, dynamic>> userMapList) {
    print('Convertendo para Lista:');
    final List<Users> users = [];
    for (Map<String, dynamic> userMap in userMapList) {
      final Users user = Users(
        id: userMap[_senha],
        name: userMap[_name],
        dtNascimento: userMap[_dtNascimento],
        genero: userMap[_genero],
        cpf: userMap[_cpf],
        senha: userMap[_senha],
      );
      users.add(user);
    }
    print('Lista de Usuários: $users');
    return users;
  }

  Future<List<Users>> find(int userId) async {
    print('Acessando o find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableUsers,
      where: '$_id = ?',
      whereArgs: [userId],
    );
    print('Usuário encontrado: ${toList(result)}');
    return toList(result);
  }
}
