import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/category.dart';
import 'productdetails_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Category>> _categories;

  // Simulación de productos para asociarlos a las categorías
  final List<Map<String, String>> _products = [
    {
      'imageUrl': 'https://bhgsuper.es/178-large_default/harina-de-trigo-espelta-bio-1kg-el-granero-integral.jpg',
      'text': 'Harina',
    },
    {
      'imageUrl': 'https://www.oetker.es/assets/hygraph/output=format:webp/resize=fit:clip,height:662,width:662/quality=value:75/compress/Km3OZrWBSL2RPeiulZY1',
      'text': 'Levadura',
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTrKGOlLfSD1U3U8JFjmCOUxtRbiHRGoJ7SA&s',
      'text': 'Mantequilla',
    },
    // Agrega el resto de productos aquí
  ];

  @override
  void initState() {
    super.initState();
    _categories = ApiService().fetchCategories();
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context); // Cambiar comportamiento si es necesario
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categorías'),
          backgroundColor: const Color.fromARGB(255, 26, 171, 238),
        ),
        body: FutureBuilder<List<Category>>(
          future: _categories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No hay categorías disponibles.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              );
            }

            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                // Asignar una imagen desde la lista de productos
                final product = _products[index % _products.length]; // Evitar desbordamiento

                return CategoryCard(
                  category: category,
                  imageUrl: product['imageUrl']!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final String imageUrl; // Nueva propiedad para la imagen

  const CategoryCard({
    Key? key,
    required this.category,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.descripcion,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Estado: ${category.estado ? 'Activo' : 'Inactivo'}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          imageUrl: imageUrl,
                          title: category.descripcion,
                          brand: 'Marca ejemplo',
                          unit: 'Unidad',
                          description: 'Detalles del producto.',
                          expirationDate: '2025-12-31',
                          price: 30.0,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 26, 171, 238),
                  ),
                  child: const Text(
                    'Ver detalles',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}