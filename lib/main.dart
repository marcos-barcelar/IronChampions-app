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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EditScreen(),
    );
  }
}
