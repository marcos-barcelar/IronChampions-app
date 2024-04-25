import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ironchampions_gym/database/users_dao.dart';
import 'package:ironchampions_gym/components/users.dart';
import 'package:ironchampions_gym/screens/profile_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController _nomeController;
  late TextEditingController _idadeController;
  String? _selectedGender;
  late TextEditingController _cpfController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _idadeController = TextEditingController();
    _cpfController = TextEditingController();
    _loadUserData();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  void _loadUserData() async {
    final String cpf = UsersDao.getLoggedInUserCPF();
    final List<Users> users = await UsersDao().findUserByCPF(cpf);
    if (users.isNotEmpty) {
      final Users user = users[0];
      setState(() {
        _nomeController.text = user.name;
        _idadeController.text = calculateAgeFromString(user.dtNascimento).toString();
        _selectedGender = user.genero;
        _cpfController.text = user.cpf;
      });
    }
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

  void _editProfile() async {
    String nome = _nomeController.text;
    String idade = _idadeController.text;
    String cpf = _cpfController.text;
    String senha = ''; // Você pode definir uma senha padrão aqui, ou alterá-la conforme necessário

    if (nome.isNotEmpty && idade.isNotEmpty && _selectedGender != null && cpf.isNotEmpty) {
      Users updatedUser = Users(
        id: 0, // ou defina o id apropriado aqui
        name: nome,
        dtNascimento: idade,
        genero: _selectedGender!,
        cpf: cpf,
        senha: senha, // Adicione a senha aqui
      );

      await UsersDao().update(updatedUser);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Alteração concluída')),
      );

      await Future.delayed(Duration(seconds: 1));

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos')),
      );
    }
  }

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
      ),
      body: SingleChildScrollView(
        child: Center(
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
                SizedBox(height: 5), // Reduzindo o espaçamento aqui
                Column(
                  children: [
                    _buildEditableTextFieldWithHorizontalBorder(_nomeController, 'Nome'),
                    SizedBox(height: 5), // Reduzindo o espaçamento aqui
                    _buildAgeTextField(context),
                    SizedBox(height: 5), // Reduzindo o espaçamento aqui
                    _buildGenderDropdown(),
                    SizedBox(height: 5), // Reduzindo o espaçamento aqui
                    _buildEditableTextFieldWithHorizontalBorder(_cpfController, 'CPF'),
                  ],
                ),
                SizedBox(height: 10), // Reduzindo o espaçamento aqui
                _buildEditButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEditableTextFieldWithHorizontalBorder(TextEditingController controller, String hintText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5), // Reduzindo o espaçamento aqui
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFF870B00))),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
          ),
          inputFormatters: hintText == 'CPF' ? [CpfInputFormatter(), LengthLimitingTextInputFormatter(14)] : null,
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5), // Reduzindo o espaçamento aqui
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFF870B00))),
      ),
      child: Center(
        child: DropdownButtonFormField<String>(
          value: _selectedGender,
          items: ["Masculino", "Feminino"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(
                child: Text(value, style: TextStyle(color: Colors.white)),
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _selectedGender = value;
            });
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Gênero',
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(fontSize: 20, color: Colors.white),
          isDense: true, // Reduz o espaço extra ao redor do texto
          isExpanded: true, // Expande o campo para baixo
          dropdownColor: Color(0xFF1C1C1C), // Define a cor do fundo do dropdown
        ),
      ),
    );
  }

  Widget _buildAgeTextField(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5), // Reduzindo o espaçamento aqui
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFF870B00))),
        ),
        child: Center(
          child: TextFormField(
            controller: _idadeController,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Idade',
              hintStyle: TextStyle(color: Colors.white),
            ),
            readOnly: true, // Para evitar que o teclado seja exibido
            onTap: () {
              _selectDate(context); // Chama o método ao clicar no campo
            },
          ),
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
          onPressed: _editProfile, // Chama a função _editProfile
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF870B00),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          icon: Icon(
            Icons.save,
            color: Colors.white,
          ),
          label: Text(
            'Salvar',
            style: TextStyle(color: Colors.white),
          ),
        ),
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
        _idadeController.text = calculateAge(picked).toString();
      });
    }
  }
}

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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
