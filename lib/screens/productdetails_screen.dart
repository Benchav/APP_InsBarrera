import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_provider.dart';
import '../services/wishlist_provider.dart'; // Importa el WishlistProvider
import '../models/cart_item.dart';
import '../models/wishlist_item.dart'; // Importa el modelo de WishlistItem

class ProductDetailScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String brand;
  final String? unit; // Cambiado a opcional
  final String description;
  final String expirationDate;
  final double price;

  const ProductDetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.brand,
    this.unit, // Ahora es opcional
    required this.description,
    required this.expirationDate,
    required this.price,
  });

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? selectedUnit;

  final List<String> units = [
    'Unidad',
    'Libra',
    'Gramos',
    'Kilos',
    'Litros',
    'Mililitros',
  ];

  @override
  void initState() {
    super.initState();
    // Validar que la unidad inicial sea válida o asignar un valor predeterminado
    selectedUnit = widget.unit ?? 'Unidad';
    if (!units.contains(selectedUnit)) {
      selectedUnit = 'Unidad';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalles de ${widget.title}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 171, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.imageUrl,
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Marca: ${widget.brand}',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text('Descripción: ${widget.description}',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text('Fecha de expiración: ${widget.expirationDate}',
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        'Precio: \$${widget.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Unidad de medida:',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          DropdownButton<String>(
                            value: selectedUnit,
                            onChanged: (newValue) {
                              setState(() {
                                selectedUnit = newValue;
                              });
                            },
                            items: units.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final cartProvider =
                            Provider.of<CartProvider>(context, listen: false);
                        cartProvider.addItem(
                          CartItem(
                            title: widget.title,
                            imageUrl: widget.imageUrl,
                            price: widget.price,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Añadido al carrito'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor:
                            const Color.fromARGB(255, 0, 171, 251),
                      ),
                      child: const Text(
                        'Añadir al carrito',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final wishlistProvider = Provider.of<WishlistProvider>(
                            context,
                            listen: false);

                        if (!wishlistProvider.isInWishlist(widget.title)) {
                          wishlistProvider.addToWishlist(WishlistItem(
                            title: widget.title,
                            imageUrl: widget.imageUrl,
                            price: widget.price,
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Añadido a lista de deseos'),
                              backgroundColor:
                                  Color.fromARGB(255, 76, 152, 175),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Este producto ya está en la lista de deseos'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor:
                            const Color.fromARGB(255, 0, 171, 251),
                      ),
                      child: const Text(
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
      ),
    );
  }
}
