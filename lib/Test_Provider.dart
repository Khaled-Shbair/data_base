
/*
* Change title appBar and text by (enter text in textFiled)
* Using provider
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MassageProvider>(
      create: (context) => MassageProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const AppBarTitle(),
          ),
          body: const ScaffoldBody(),
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<MassageProvider>(context).massage);
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AppMassage(),
          AppTextFiled(),
        ],
      ),
    );
  }
}

class AppMassage extends StatelessWidget {
  const AppMassage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<MassageProvider>(context).massage);
  }
}

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        Provider.of<MassageProvider>(context, listen: false)
            .changeMassage(value);
      },
    );
  }
}

class MassageProvider extends ChangeNotifier {
  String massage = 'Welcome massage';

  void changeMassage(String massage) {
    this.massage = massage;
    notifyListeners();
  }
}
