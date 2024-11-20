import 'package:flutter/material.dart';
import 'productdetails_screen.dart';

class PastryProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '"Bienvenido usuario"',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
        automaticallyImplyLeading: false, // Oculta el botón de regreso
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            return _SingleCard(
              imageUrl: _products[index]['imageUrl']!,
              text: _products[index]['text']!,
            );
          },
        ),
      ),
    );
  }
}

class _SingleCard extends StatelessWidget {
  final String imageUrl;
  final String text;

  const _SingleCard({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              imageUrl: imageUrl,
              title: text,
              brand: 'Suli', // Ejemplo
              unit: '20 lb', // Ejemplo
              description: 'Especial para repostería.', // Ejemplo
              expirationDate: '24/12/2024', // Ejemplo
              price: 30.0, // Ejemplo
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
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
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      imageUrl: imageUrl,
                      title: text,
                      brand: 'Suli',
                      unit: '20 lb',
                      description: 'Especial para repostería.',
                      expirationDate: '24/12/2024',
                      price: 30.0,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  const Color.fromARGB(255, 0, 171, 251),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              child: Text('Ver detalles',
            style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

// Lista de productos
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
  {
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_gRr5CrN2PcndKaCQh6TGK7WOVqEfktInw&s',
    'text': 'Azúcar Morena',
  },
  {
    'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyF1BR0BksKEsUkW16ABhYeE__DMtk8K_pCA&s',
    'text': 'Colorante',
  },
  {
    'imageUrl': 'https://www.lala.com.mx/storage/app/media/Prodcutos/7501020513134.png',
    'text': 'Crema',
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
    'imageUrl': 'https://manitoba.com.co/storage/2021/06/Mani-con-sal.png',
    'text': 'Maní',
  },
  {
    'imageUrl': 'https://delmontefrutas.mx/wp-content/uploads/2021/07/Cereza-Negras-454g.png',
    'text': 'Cereza',
  },
];
