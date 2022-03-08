import 'package:flutter/material.dart';
import '../dataBase/Controller_Table/Users_dataBase_Controller.dart';
import '../models/users.dart';

class UsersProvider extends ChangeNotifier {
  List<Users> user = <Users>[];

  final UsersDataBaseController _usersDataBaseController =
      UsersDataBaseController();
}
