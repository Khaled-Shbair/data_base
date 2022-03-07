import 'package:flutter/material.dart';
import 'dataBase/DataBase_control.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseControl().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
