import 'package:flutter/material.dart';
import 'Screen/lunch_Screen.dart';
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
    return MaterialApp(
      initialRoute: '/Lunch_Screen',
      routes: {
        '/Lunch_Screen': (context) => const LunchScreen(),
        //    '/Login_Screen':(context)=>const LoginScreen(),
        //  '/Register_Screen':(context)=>const RegisterScreen(),
      },
    );
  }
}
