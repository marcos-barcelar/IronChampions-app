import 'package:flutter/material.dart';
import 'package:ironchampions_gym/screens/edit_screen.dart';
import 'package:ironchampions_gym/screens/insert_screen.dart';
import 'package:ironchampions_gym/screens/login_screen.dart';
import 'package:ironchampions_gym/screens/primary_screen.dart';
import 'package:ironchampions_gym/screens/profile_screen.dart';
import 'package:ironchampions_gym/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IronChampions Gym',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/register',
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => PrimaryScreen(),
      },
    );
  }
}
