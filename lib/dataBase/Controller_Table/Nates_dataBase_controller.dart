import 'package:sqflite/sqflite.dart';
import '../../models/notes.dart';
import '../DataBase_control.dart';
import 'dataBase_operations.dart';

class NotesDataBaseController implements DataBaseOperations<Notes> {
  Database database = DataBaseControl().dataBase;

  //Insert values in table
  @override
  Future<int> create(Notes notes) async {
    int newRowId = await database.insert('Notes', notes.toMap());
    return newRowId;
  }

  //delete row from table
  @override
  Future<bool> delete(int id) async {
    int countOfDeleteRow =
        await database.delete('Notes', where: 'id=?', whereArgs: [id]);
    return countOfDeleteRow == 1;
  }

  //
  @override
  Future<List<Notes>> read() async {
    List<Map<String, dynamic>> rows = await database.query('Notes');
    return rows.map((Map<String, dynamic> row) => Notes.fromMap(row)).toList();
  }

  //
  @override
  Future<Notes?> show(int id) async {
    List<Map<String, dynamic>> rows =
        await database.query('Notes', where: 'id=?', whereArgs: ['id']);
    if (rows.isNotEmpty) {
      return Notes.fromMap(rows.first);
    }
    return null;
  }

  //Update on table
  @override
  Future<bool> update(Notes notes) async {
    int countOfUpdateRow = await database
        .update('Notes', notes.toMap(), where: 'id=?', whereArgs: [notes.id]);
    return countOfUpdateRow == 1;
  }
}
