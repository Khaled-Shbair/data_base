import 'package:data_base/pref/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(
          AppLocalizations.of(context)!.home,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await _confirmLogout();
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

  Future<void> _confirmLogout() async {
    bool? logout = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.logout),
          content: Text(AppLocalizations.of(context)!.areYorSure),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(AppLocalizations.of(context)!.no),
            ),
          ],
        );
      },
    );
    if (logout ?? false) {
      await _logout();
    }
  }

  Future<void> _logout() async {
    bool cleared = await SharedPrefController().cleared();
    if (cleared) {
      Navigator.pushReplacementNamed(context, '/LoginScreen');
    }
  }
}
