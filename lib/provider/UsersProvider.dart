import 'package:flutter/material.dart';
import '../dataBase/Controller_Table/Users_dataBase_Controller.dart';
import '../models/users.dart';

class UsersProvider extends ChangeNotifier {
  List<Users> user = <Users>[];

  final UsersDataBaseController _usersDataBaseController =
      UsersDataBaseController();

  Future<bool> login({required String email, required String password}) async {
    return await _usersDataBaseController.login(
        email: email, password: password);
  }

  Future<bool> create(Users users) async {
    int newRowId = await _usersDataBaseController.create(users);
    return newRowId != 0;
  }

  Future<bool> update(Users users) async {
    return await _usersDataBaseController.update(users);
  }

  Future<bool> delete(int id) async {
    return await _usersDataBaseController.delete(id);
  }
}
