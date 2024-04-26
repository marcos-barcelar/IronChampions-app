import 'package:flutter/material.dart';
import 'package:ironchampions_gym/screens/profile_screen.dart';
import 'package:ironchampions_gym/database/training_dao.dart';
import 'package:ironchampions_gym/components/training.dart';
import 'package:ironchampions_gym/screens/primary_screen.dart';

class InsertScreen extends StatelessWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _segundaController = TextEditingController();
    final TextEditingController _TsegundaController = TextEditingController();
    final TextEditingController _tercaController = TextEditingController();
    final TextEditingController _TtercaController = TextEditingController();
    final TextEditingController _quartaController = TextEditingController();
    final TextEditingController _TquartaController = TextEditingController();
    final TextEditingController _quintaController = TextEditingController();
    final TextEditingController _TquintaController = TextEditingController();
    final TextEditingController _sextaController = TextEditingController();
    final TextEditingController _TsextaController = TextEditingController();
    final TextEditingController _sabadoController = TextEditingController();
    final TextEditingController _TsabadoController = TextEditingController();
    final TextEditingController _domingoController = TextEditingController();
    final TextEditingController _TdomingoController = TextEditingController();
    // Repita para os outros campos do formulário

    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1C),
        toolbarHeight: 60,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Criar treino',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
          child: Form(
            key: _formKey, // Define a chave global para o formulário
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Nome do treino',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um nome para o treino.';
                    }
                    return null;
                  },

                  controller: _nameController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Segunda',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _segundaController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Treino de...',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _TsegundaController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Ficha',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Terça',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _tercaController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Treino de...',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _TtercaController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Ficha',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Quarta',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _quartaController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Treino de...',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _TquartaController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Ficha',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Quinta',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _quintaController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Treino de...',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _TquintaController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Ficha',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Sexta',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _sextaController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Treino de...',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _TsextaController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Ficha',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Sabado',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _sabadoController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Treino de...',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _TsabadoController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Ficha',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'Domingo',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _domingoController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Treino de...',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _TdomingoController,
                  style: TextStyle(color: Colors.white),
                  maxLines: 5,
                  cursorColor: Color(0xFF870B00),
                  decoration: InputDecoration(
                    hintText: 'Ficha',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Color(0xFF1C1C1C),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Color(0xFF870B00)),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Capturar os dados do formulário
                      String name = _nameController.text;
                      String segunda = _segundaController.text;
                      String Tsegunda = _TsegundaController.text;
                      String terca = _tercaController.text;
                      String Tterca = _TtercaController.text;
                      String quarta = _quartaController.text;
                      String Tquarta = _TquartaController.text;
                      String quinta = _quintaController.text;
                      String Tquinta = _TquintaController.text;
                      String sexta = _sextaController.text;
                      String Tsexta = _TsextaController.text;
                      String sabado = _sabadoController.text;
                      String Tsabado = _TsabadoController.text;
                      String domingo = _domingoController.text;
                      String Tdomingo = _TdomingoController.text;

                      // Criar um novo objeto Trainings com os dados capturados
                      final newTraining = Trainings(
                        id: -1, // Deixe o ID como null para que seja gerado automaticamente
                        name: name,
                        segunda: segunda,
                        Tsegunda: Tsegunda,
                        terca: terca,
                        Tterca: Tterca,
                        quarta: quarta,
                        Tquarta: Tquarta,
                        quinta: quinta,
                        Tquinta: Tquinta,
                        sexta: sexta,
                        Tsexta: Tsexta,
                        sabado: sabado,
                        Tsabado: Tsabado,
                        domingo: domingo,
                        Tdomingo: Tdomingo,
                      );

                      final trainingDao = TrainingDao();
                      await trainingDao.insertTraining(newTraining); // Aqui você insere o novo treinamento no banco de dados

                      Navigator.pop(context); // Retorna à página anterior
                      Navigator.pushReplacement( // Substitui a rota atual pela nova rota
                        context,
                        MaterialPageRoute(builder: (context) => PrimaryScreen()),
                      );
                    }
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
