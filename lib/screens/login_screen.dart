import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
                onPressed: () {},
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
