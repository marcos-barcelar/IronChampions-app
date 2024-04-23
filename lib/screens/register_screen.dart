import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ironchampions_gym/main.dart';
import 'package:ironchampions_gym/database/users_dao.dart';
import 'package:ironchampions_gym/components/users.dart';
import 'login_screen.dart'; // Importe a tela de login

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime? _selectedDate;
  String? _selectedGender;
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  _saveToDatabase() async {
    String name = _nameController.text;
    String dtNascimento = _selectedDate != null
        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
        : "";
    String genero = _selectedGender ?? "";
    String cpf = _cpfController.text;
    String senha = _passwordController.text;
    String confirmarSenha = _confirmPasswordController.text;

    if (name.isNotEmpty &&
        dtNascimento.isNotEmpty &&
        genero.isNotEmpty &&
        cpf.isNotEmpty &&
        senha.isNotEmpty &&
        senha == confirmarSenha) {
      Users user = Users(
        id: 0,
        name: name,
        dtNascimento: dtNascimento,
        genero: genero,
        cpf: cpf,
        senha: senha,
      );

      try {
        await UsersDao().save(user);

        _nameController.clear();
        _cpfController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        setState(() {
          _selectedDate = null;
          _selectedGender = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dados salvos com sucesso!'),
            duration: Duration(seconds: 2),
          ),
        );


        await Future.delayed(Duration(seconds: 2));


        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Erro ao salvar os dados. Por favor, tente novamente.'),
            duration: Duration(seconds: 2),
          ),
        );
        print('Erro ao salvar os dados: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Os campos de senha e confirmação de senha são diferentes ou estão vazios.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Image.asset(
                    'assets/Logo_IRONCHAMPIONSgym.png',
                    height: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF870B00)),
                      ),
                    ),
                    cursorColor: Color(0xFF870B00),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "Data Nascimento",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xFF870B00)),
                          ),
                        ),
                        cursorColor: Color(0xFF870B00),
                        controller: _selectedDate != null
                            ? TextEditingController(
                            text:
                            "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}")
                            : TextEditingController(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Genero",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF870B00)),
                      ),
                    ),
                    dropdownColor: Color(0xFF1C1C1C),
                    iconEnabledColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    items: ["Masculino", "Feminino"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _cpfController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                    decoration: InputDecoration(
                      labelText: "CPF",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF870B00)),
                      ),
                    ),
                    cursorColor: Color(0xFF870B00),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Criar Senha",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF870B00)),
                      ),
                    ),
                    cursorColor: Color(0xFF870B00),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirmar Senha",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF870B00)),
                      ),
                    ),
                    cursorColor: Color(0xFF870B00),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _saveToDatabase,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF870B00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    text: 'Já tem conta? Entre ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'aqui',
                        style: TextStyle(
                          color: Color(0xFF870B00),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
