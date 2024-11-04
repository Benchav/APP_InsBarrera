import 'package:flutter/material.dart';

// Pantalla de productos pasteleros
class PastryProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos pasteleros", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Chocolate'),
            subtitle: Text('30 barras.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Levadura'),
            subtitle: Text('15 tarros.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Harina'),
            subtitle: Text('26 sacos.'),
          ),
             ListTile(
            leading: Icon(Icons.cake),
            title: Text('Azucar'),
            subtitle: Text('100 lb.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Polvo de hornear'),
            subtitle: Text('18 lb.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Azucar Morena'),
            subtitle: Text('25 lb.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Mantequilla'),
            subtitle: Text('25 Barra.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Chispas de caramelo'),
            subtitle: Text('libreado.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Cerezas'),
            subtitle: Text('50 latas.'),
          ),
        ],
      ),
    );
  }
}