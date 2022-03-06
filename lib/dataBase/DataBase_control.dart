import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseControl {
  static final DataBaseControl _instance = DataBaseControl._();
  late Database _database;

  factory DataBaseControl() {
    return _instance;
  }

  DataBaseControl._();

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'database.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) {
        db.execute('CREATE TABLE users('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'name TEXT,'
            'email TEXT,'
            'password TEXT'
            ')');
        db.execute('CREATE TABLE notes('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'title TEXT,'
            'details TEXT,'
            'user_id INTEGER,'
            'FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE RESTRICT ON UPDATE CASCADE'
            ')');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
