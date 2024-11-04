import 'package:flutter/material.dart';


// Pantalla Informacion de contacto
class Hacercad extends StatelessWidget {
  const Hacercad({super.key});
   @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ) , 
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
          ),          
        title: Text("Información de contacto", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          actions: [
          ],
        ),
        body: Center(
          child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Correo", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Telefono", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Redes sociales", style: TextStyle(color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 148, 199, 241),
              child: const Text("Pagina web", style: TextStyle(color: Colors.white),),
            ),
          ],
        )
        ),
      )
    );
  }
}