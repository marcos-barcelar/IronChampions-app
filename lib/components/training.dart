import 'package:flutter/material.dart';
import 'package:ironchampions_gym/database/training_dao.dart';

class  extends Training StatefulWidget {
  final int id;
  final String name;
  final String segunda;
  final String terca;
  final String quarta;
  final String quinta;
  final String sexta;
  final String sabado;
  final String domingo;

  const Training({
    required this.id,
    required this.name,
    required this.segunda,
    required this.terca,
    required this.quarta,
    required this.quinta,
    required this.sexta,
    required this.sabado,
    required this.domingo,
    Key? key,
  }) : super(key: key);

  @override
  State<Training> createState() => _Training();
}

class _TrainingState extends State<Trainings> {
@override
Widget build(BuildContext context) {
return Container(
child: Text('id: ${widget.id}, name: ${widget.name}, segunda: ${widget.segunda}, terca: ${widget.terca}, quarta: ${widget.quarta},quinta: ${widget.quinta}, sexta: ${widget.sexta}, sabado: ${widget.sabado}, domingo: ${widget.domingo}'),
);
}
}