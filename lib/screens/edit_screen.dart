import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1C),
        toolbarHeight: 60,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Editar treino',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
            SizedBox(height: 25), Text(
              'Terça',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextFormField(
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
            SizedBox(height: 10),SizedBox(height: 25), Text(
              'Quarta',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextFormField(
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
            SizedBox(height: 10),SizedBox(height: 25), Text(
              'Quinta',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextFormField(
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
            SizedBox(height: 10),SizedBox(height: 25), Text(
              'Sexta',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextFormField(
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
            SizedBox(height: 10),SizedBox(height: 25), Text(
              'Sabado',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextFormField(
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
            SizedBox(height: 10),SizedBox(height: 25), Text(
              'Domingo',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            TextFormField(
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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
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
                  child: Text('Editar'),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
