import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_provider.dart';
import '../services/wishlist_provider.dart'; // Importa el WishlistProvider
import '../models/cart_item.dart';
import '../models/wishlist_item.dart'; // Importa el modelo de WishlistItem

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
        title: Text(
          'Detalles de $title',
          style: TextStyle(color: Colors.white),
        ),
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
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final cartProvider =
                          Provider.of<CartProvider>(context, listen: false);
                      cartProvider.addItem(
                        CartItem(
                          title: title,
                          imageUrl: imageUrl,
                          price: price,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Añadido al carrito'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 0, 171, 251),
                    ),
                    child: Text(
                      'Añadir al carrito',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final wishlistProvider =
                          Provider.of<WishlistProvider>(context, listen: false);

                      if (!wishlistProvider.isInWishlist(title)) {
                        wishlistProvider.addToWishlist(WishlistItem(
                          title: title,
                          imageUrl: imageUrl,
                          price: price,
                        ));

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Añadido a lista de deseos'),
                            backgroundColor: const Color.fromARGB(255, 76, 152, 175),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Este producto ya está en la lista de deseos'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 0, 171, 251),
                    ),
                    child: Text(
                      'Añadir lista de deseos',
                      style: TextStyle(color: Colors.white),
                    ),
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
