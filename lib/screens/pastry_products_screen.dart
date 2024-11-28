import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/category.dart';
import 'productdetails_screen.dart';

class PastryProductsScreen extends StatefulWidget {
  @override
  _PastryProductsScreenState createState() => _PastryProductsScreenState();
}

class _PastryProductsScreenState extends State<PastryProductsScreen> {
  late Future<List<Category>> _categories;

  // Productos simulados para asociarlos a las categorías
  final List<Map<String, String>> _products = [
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyF1BR0BksKEsUkW16ABhYeE__DMtk8K_pCA&s',
      'text': 'Colorante',
    },
    {
      'imageUrl': 'https://www.oetker.es/assets/hygraph/output=format:webp/resize=fit:clip,height:662,width:662/quality=value:75/compress/Km3OZrWBSL2RPeiulZY1',
      'text': 'Levadura',
    },
    {
      'imageUrl': 'https://www.lacentraldeabasto.com/1417-large_default/azucar-glass-zulka-500-g.jpg',
      'text': 'Azúcar Glass',
    },
    {
      'imageUrl': 'https://static.wixstatic.com/media/868e30_adf6388995d94d5381e5a79261377592~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
      'text': 'Chispas',
    },
    {
      'imageUrl': 'https://www.lala.com.mx/storage/app/media/Prodcutos/7501020513134.png',
      'text': 'Crema',
    },
    {
      'imageUrl': 'https://manitoba.com.co/storage/2021/06/Mani-con-sal.png',
      'text': 'Maní',
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_gRr5CrN2PcndKaCQh6TGK7WOVqEfktInw&s',
      'text': 'Azúcar Morena',
    },
    {
      'imageUrl': 'https://bhgsuper.es/178-large_default/harina-de-trigo-espelta-bio-1kg-el-granero-integral.jpg',
      'text': 'Harina',
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTrKGOlLfSD1U3U8JFjmCOUxtRbiHRGoJ7SA&s',
      'text': 'Mantequilla',
    },
    {
      'imageUrl': 'https://delmontefrutas.mx/wp-content/uploads/2021/07/Cereza-Negras-454g.png',
      'text': 'Cereza',
    },
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
          title: Center(
            child: Text(
              'Bienvenido usuario',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
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
                  'No hay productos disponibles.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              );
            }

            final categories = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final product = _products[index % _products.length];

                  return _PastryProductCard(
                    category: category,
                    imageUrl: product['imageUrl']!,
                    productName: product['text']!,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PastryProductCard extends StatelessWidget {
  final Category category;
  final String imageUrl;
  final String productName;

  const _PastryProductCard({
    Key? key,
    required this.category,
    required this.imageUrl,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imageUrl: imageUrl,
              title: productName,
              brand: 'Marca ejemplo',
              unit: 'Unidad',
              description: category.descripcion,
              expirationDate: '2025-12-31',
              price: 30.0,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                productName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      imageUrl: imageUrl,
                      title: productName,
                      brand: 'Marca ejemplo',
                      unit: 'Unidad',
                      description: category.descripcion,
                      expirationDate: '2025-12-31',
                      price: 30.0,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 26, 171, 238),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              child: const Text(
                'Ver detalles',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}