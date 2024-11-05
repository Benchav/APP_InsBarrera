import 'package:flutter/material.dart';

// Pantalla de productos pasteleros
class PastryProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('"Bienvenido a la app de InsumosBr"',style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 26, 171, 238),
        automaticallyImplyLeading: false, // Oculta el botón de regreso
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            children: [
              TableRow(children: [
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Harina',
                ),
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Levadura',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Mantequilla',
                ),
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Azúcar',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Colorante',
                ),
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Crema',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Azúcar Glass',
                ),
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Chispas',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Maní',
                ),
                _SingleCard(
                  color: Colors.white,
                  icon: Icons.cake_rounded,
                  text: 'Rikitiksi',
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {super.key, required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 180,
      decoration: BoxDecoration(
          color: Color.fromRGBO(82, 183, 230, 0.6),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: this.color,
            child: Icon(
              this.icon,
              size: 35,
            ),
            radius: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            this.text,
            style: TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    );
  }
}
