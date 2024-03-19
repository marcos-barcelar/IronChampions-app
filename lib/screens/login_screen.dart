import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              Image.asset(
                'assets/Logo_IRONCHAMPIONSgym.png',
                height: 75,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
