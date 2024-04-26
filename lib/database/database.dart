import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ironchampions_gym/database/users_dao.dart';
import 'package:ironchampions_gym/database/training_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(UsersDao.tableSql);
    db.execute(TrainingDao.tableSql);
  }, version: 1);
}
