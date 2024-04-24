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
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/profile.png',
                height: 200,
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  _buildTextWithHorizontalBorder('Nome'),
                  SizedBox(height: 20),
                  _buildTextWithHorizontalBorder('Idade'),
                  SizedBox(height: 20),
                  _buildTextWithHorizontalBorder('Gênero'),
                  SizedBox(height: 20),
                  _buildTextWithHorizontalBorder('CPF'),
                ],
              ),
              SizedBox(height: 20),
              _buildEditButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextWithHorizontalBorder(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFF870B00))),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 150,
        height: 45,
        child: TextButton.icon(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF870B00),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          icon: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          label: Text(
            'Editar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
