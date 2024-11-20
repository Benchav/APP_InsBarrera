import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String brand;
  final String unit;
  final String description;
  final String expirationDate;
  final double price;

  const ProductDetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.unit,
    required this.description,
    required this.expirationDate,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de $title',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 26, 171, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imageUrl,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Marca: $brand',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Unidad de medida: $unit',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Descripción: $description',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Fecha de expiración: $expirationDate',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Precio: \$${price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para añadir al carrito
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 0, 171, 251),
                    ),
                    child: Text('Añadir al carrito',style: TextStyle(color: Colors.white),),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para añadir a la lista de deseos
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 0, 171, 251),
                    ),
                    child: Text('Añadir lista de deseos',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
