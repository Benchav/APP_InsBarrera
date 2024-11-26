import 'package:flutter/material.dart';                                                                                                             
import 'package:insumosbr/screens/home_screen.dart';

class Hacercad extends StatelessWidget {
  const Hacercad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Información Insumos Barrera",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contáctanos",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.blueAccent, size: 30),
                title: const Text(
                  "Correo electrónico",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  "InsBarrera@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.blueAccent, size: 30),
                title: const Text(
                  "Teléfono",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  "+505 1234-5678",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.language, color: Colors.blueAccent, size: 30),
                title: const Text(
                  "Página web",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  "www.insumosBR.com",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.share, color: Colors.blueAccent, size: 30),
                title: const Text(
                  "Redes sociales",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  "Facebook, Instagram, Twitter, Whatsapp",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}