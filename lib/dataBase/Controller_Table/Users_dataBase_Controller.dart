import 'package:sqflite/sqflite.dart';

import '../../Shared_preferences/shared_preferences.dart';
import '../../models/users.dart';
import '../DataBase_control.dart';
import 'dataBase_operations.dart';

class UsersDataBaseController implements DataBaseOperations<Users> {
  Database database = DataBaseControl().dataBase;

  Future<bool> login({required String email, required String password}) async {
    List<Map<String, dynamic>> maps = await database.query('Users',
        where: 'email=? AND password=?', whereArgs: [email, password]);
    if (maps.isNotEmpty) {
      Users users = Users.fromMap(maps.first);
      await SharedPreferencesController().save(users);
    }
    return maps.isNotEmpty;
  }

  //Insert values in table
  @override
  Future<int> create(Users users) async {
    int newRowId = await database.insert('Users', users.toMap());
    return newRowId;
  }

  //delete row from table
  @override
  Future<bool> delete(int id) async {
    int countOfDeleteRow =
        await database.delete('Users', where: 'id=?', whereArgs: [id]);
    return countOfDeleteRow == 1;
  }

  //
  @override
  Future<List<Users>> read() async {
    List<Map<String, dynamic>> rows = await database.query('Users');
    return rows.map((Map<String, dynamic> row) => Users.fromMap(row)).toList();
  }

  //
  @override
  Future<Users?> show(int id) async {
    List<Map<String, dynamic>> rows =
        await database.query('Users', where: 'id=?', whereArgs: ['id']);
    if (rows.isNotEmpty) {
      return Users.fromMap(rows.first);
    }
    return null;
  }

  //Update on table
  @override
  Future<bool> update(Users users) async {
    int countOfUpdateRow = await database
        .update('Users', users.toMap(), where: 'id=?', whereArgs: [users.id]);
    return countOfUpdateRow == 1;
  }
}
