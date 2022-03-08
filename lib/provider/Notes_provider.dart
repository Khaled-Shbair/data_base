import 'package:flutter/material.dart';
import '../dataBase/Controller_Table/Nates_dataBase_controller.dart';
import '../models/notes.dart';

class UsersProvider extends ChangeNotifier {
  List<Notes> note = <Notes>[];
  final NotesDataBaseController _notesDataBaseController =
      NotesDataBaseController();

  void read() async {
    note = await _notesDataBaseController.read();
    notifyListeners();
  }

  Future<bool> create({required Notes notes}) async {
    int newRowId = await _notesDataBaseController.create(notes);
    if (newRowId != 0) {
      notes.id = newRowId;
      note.add(notes);
      notifyListeners();
    }
    return newRowId != 0;
  }

  Future<bool> delete(int index) async {
    bool deleted = await _notesDataBaseController.delete(note[index].id);
    if (deleted) {
      note.removeAt(index);
    }
    return deleted;
  }

  Future<bool> update(Notes notes) async {
    bool updated = await _notesDataBaseController.update(notes);
    if (updated) {
      int index = note.indexWhere((element) => element.id == notes.id);
      if (index != -1) {
        note[index] = notes;
        notifyListeners();
      }
    }
    return updated;
  }
}
