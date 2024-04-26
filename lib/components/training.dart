import 'package:flutter/material.dart';


class Trainings extends StatefulWidget {
  final int id;
  final String name;
  final String segunda;
  final String Tsegunda;
  final String terca;
  final String Tterca;
  final String quarta;
  final String Tquarta;
  final String quinta;
  final String Tquinta;
  final String sexta;
  final String Tsexta;
  final String sabado;
  final String Tsabado;
  final String domingo;
  final String Tdomingo;

  const Trainings({
    required this.id,
    required this.name,
    required this.segunda,
    required this.Tsegunda,
    required this.terca,
    required this.Tterca,
    required this.quarta,
    required this.Tquarta,
    required this.quinta,
    required this.Tquinta,
    required this.sexta,
    required this.Tsexta,
    required this.sabado,
    required this.Tsabado,
    required this.domingo,
    required this.Tdomingo,
    Key? key,
  }) : super(key: key);


  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Trainings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('id: ${widget.id}, name: ${widget.name}, segunda: ${widget.segunda}, Tsegunda: ${widget.Tsegunda}, terca: ${widget.terca}, Tterca: ${widget.Tterca}, quarta: ${widget.quarta}, Tquarta: ${widget.Tquarta}, quinta: ${widget.quinta}, Tquinta: ${widget.Tquinta}, sexta: ${widget.sexta}, Tsexta: ${widget.Tsexta}, sabado: ${widget.sabado}, Tsabado: ${widget.Tsabado}, domingo: ${widget.domingo}, Tdomingo: ${widget.Tdomingo}'),
    );
  }
}
