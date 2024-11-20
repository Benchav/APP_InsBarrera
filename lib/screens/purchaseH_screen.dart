import 'package:flutter/material.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> purchaseHistory = [
  {
    'imageUrl': 'https://bhgsuper.es/178-large_default/harina-de-trigo-espelta-bio-1kg-el-granero-integral.jpg',
    'title': 'Harina',
    'quantity': 2,
    'date': '15/11/2024',
    'price': 20.0,
  },
  {
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTrKGOlLfSD1U3U8JFjmCOUxtRbiHRGoJ7SA&s',
    'title': 'Mantequilla',
    'quantity': 1,
    'date': '10/11/2024',
    'price': 25.0,
  },
  {
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_gRr5CrN2PcndKaCQh6TGK7WOVqEfktInw&s',
    'title': 'Azúcar morena',
    'quantity': 3,
    'date': '05/11/2024',
    'price': 25.0,
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Historial de compras",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Compras anteriores",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            Expanded(
             child: ListView.builder(
             itemCount: purchaseHistory.length,
             itemBuilder: (context, index) {
           final item = purchaseHistory[index];
            return _buildPurchaseItem(
            imageUrl: item['imageUrl'],
            title: item['title'],
            quantity: item['quantity'],
            date: item['date'],
            price: item['price'],
                 );
               },
             ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseItem({required String imageUrl, required String title, required int quantity, required String date, required double price,}) {
     return Card(
     elevation: 4,
     margin: EdgeInsets.symmetric(vertical: 10),
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
                  "Cantidad: $quantity",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "Fecha: $date",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  "Precio: \$${(price * quantity).toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
 }
}