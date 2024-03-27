import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1C),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/profile.png',
                height: 200,
              ),
              Column(
                children: [
                  _buildTextWithBottomBorder('Nome'),
                  SizedBox(height: 20),
                  _buildTextWithBottomBorder('Idade'),
                  SizedBox(height: 20),
                  _buildTextWithBottomBorder('Gênero'),
                  SizedBox(height: 20),
                  _buildTextWithBottomBorder('CPF'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextWithBottomBorder(String text) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Color(0xFF870B00)),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
