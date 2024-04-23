import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ironchampions_gym/screens/primary_screen.dart';
import 'package:ironchampions_gym/screens/register_screen.dart';
import 'package:ironchampions_gym/database/users_dao.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? cpf;
    String? senha;

    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: Center(
        child: Container(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Logo_IRONCHAMPIONSgym.png',
                height: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) => cpf = value,
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
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                    _CpfInputFormatter(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) => senha = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
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
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (cpf == null || cpf!.isEmpty || senha == null || senha!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Por favor, preencha todos os campos.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {

                    bool isAuthenticated = await UsersDao().login(cpf!, senha!);
                    if (isAuthenticated) {

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PrimaryScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('CPF ou senha incorretos.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  }
                },
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
                  child: Text('Entrar'),
                ),
              ),
              SizedBox(height: 20),
            ],
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Não tem conta? Crie uma ',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Esqueci a senha',
                  style: TextStyle(
                    color: Color(0xFF870B00),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final newText = StringBuffer();

    for (int i = 0; i < text.length; i += 1) {
      if (i == 3 || i == 6) {
        newText.write('.');
      }
      if (i == 9) {
        newText.write('-');
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
