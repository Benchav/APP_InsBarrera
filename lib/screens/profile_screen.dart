import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navega de regreso a la pantalla de Home
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/3135/3135768.png',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre del Usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Juan Perez',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

