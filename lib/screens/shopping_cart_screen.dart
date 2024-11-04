import 'package:flutter/material.dart';

// Pantalla de carrito de compras
class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int itemCount = 0;

  void _incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void _decrementItem() {
    setState(() {
      if (itemCount > 0) itemCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito de Compras", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           // Image.network('https://via.placeholder.com/150'),
           Image.network('https://bhgsuper.es/178-large_default/harina-de-trigo-espelta-bio-1kg-el-granero-integral.jpg'),
            SizedBox(height: 20),
            Text('Harina', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decrementItem,
                ),
                Text('$itemCount', style: TextStyle(fontSize: 24)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _incrementItem,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}