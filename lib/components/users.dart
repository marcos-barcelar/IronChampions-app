import 'package:flutter/material.dart';
import 'package:ironchampions_gym/database/users_dao.dart';
import 'package:ironchampions_gym/screens/insert_screen.dart';

class Users extends StatefulWidget {
  final int id;
  final String name;
  final String dtNascimento;
  final String genero;
  final String cpf;
  final String senha;

  const Users({
    required this.id,
    required this.name,
    required this.dtNascimento,
    required this.genero,
    required this.cpf,
    required this.senha,
    Key? key,
  }) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('id: ${widget.id}, name: ${widget.name}, dtNascimento: ${widget.dtNascimento}, genero: ${widget.genero}, cpf: ${widget.cpf}, senha: ${widget.senha}'),
    );
  }
}
