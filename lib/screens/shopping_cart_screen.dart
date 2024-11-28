import 'package:flutter/material.dart';
import 'package:insumosbr/screens/purchaseH_screen.dart';
import 'package:insumosbr/services/cart_provider.dart';
import 'package:provider/provider.dart';
// Importa tu pantalla de forma de pago

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Carrito de Compras",
          style: TextStyle(color: Colors.white, fontSize: 20),),),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final item = cartProvider.items[index];
                return _buildCartItem(
                  imageUrl: item.imageUrl,
                  title: item.title,
                  price: item.price,
                  itemCount: item.quantity,
                  decrementItem: () {
                    cartProvider.decrementItem(item.title);
                  },
                  incrementItem: () {
                    cartProvider.incrementItem(item.title);
                  },
                  removeItem: () {
                    cartProvider.removeItem(item.title);
                  },
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${cartProvider.total.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
  ElevatedButton(
  onPressed: () {
    // Realizar la compra
    cartProvider.checkout();
    // Navegar al historial de compras
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PurchaseHistoryScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blueAccent,
    padding: EdgeInsets.symmetric(vertical: 14),
    minimumSize: Size(double.infinity, 40),
  ),
  child: Text(
    "Comprar",
    style: TextStyle(fontSize: 17, color: Colors.white),
  ),
),


        ],
      ),
    );
  }

  Widget _buildCartItem({
    required String imageUrl,
    required String title,
    required double price,
    required int itemCount,
    required VoidCallback decrementItem,
    required VoidCallback incrementItem,
    required VoidCallback removeItem,
  }) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$$price",
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: decrementItem,
                ),
                Text('$itemCount', style: TextStyle(fontSize: 18)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: incrementItem,
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: removeItem,
            ),
          ],
        ),
      ),
    );
  }
}