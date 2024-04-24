import 'package:flutter/material.dart';
import 'package:ironchampions_gym/database/users_dao.dart';
import 'package:ironchampions_gym/components/users.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String cpf = UsersDao.getLoggedInUserCPF();

    return FutureBuilder<List<Users>>(
      future: UsersDao().findUserByCPF(cpf),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar os dados do usuário'));
        } else {
          final List<Users> users = snapshot.data!;
          if (users.isEmpty) {
            return Center(child: Text('Usuário não encontrado'));
          } else {
            final Users user = users[0];
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
                    onPressed: () {
                      _logout(context);
                    },
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
                          _buildTextWithHorizontalBorder('${user.name}'),
                          SizedBox(height: 20),
                          _buildTextWithHorizontalBorder('${calculateAgeFromString(user.dtNascimento).toString()} anos'),
                          SizedBox(height: 20),
                          _buildTextWithHorizontalBorder('${user.genero}'),
                          SizedBox(height: 20),
                          _buildTextWithHorizontalBorder('${user.cpf}'),
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
        }
      },
    );
  }

  int calculateAgeFromString(String birthDateString) {
    final parts = birthDateString.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);

    final birthDate = DateTime(year, month, day);
    return calculateAge(birthDate);
  }

  int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
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

  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
