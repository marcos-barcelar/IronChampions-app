import 'package:flutter/material.dart';

class InsertScreen extends StatelessWidget {
  const InsertScreen({Key? key}) : super(key: key);

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
          'Criar treino',
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
      body: Padding(
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
