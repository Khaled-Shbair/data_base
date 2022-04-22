import 'package:data_base/pref/shared_preference.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'HOME',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await SharedPrefController().clear();
              Navigator.pushReplacementNamed(context, '/LoginScreen');
            },
            icon: const Icon(Icons.login, color: Colors.black),
          ),
        ],
      ),
      body: Center(
        child: Text(SharedPrefController().email),
      ),
    );
  }
}
