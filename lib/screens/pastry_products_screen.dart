import 'package:flutter/material.dart';
import 'productdetails_screen.dart';
// Pantalla de productos pasteleros
class PastryProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('"Bienvenido usuario"', style: TextStyle(color: Colors.white)),
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
                  imageUrl: 'https://bhgsuper.es/178-large_default/harina-de-trigo-espelta-bio-1kg-el-granero-integral.jpg',
                  text: 'Harina',
                ),
                _SingleCard(
                  imageUrl: 'https://www.oetker.es/assets/hygraph/output=format:webp/resize=fit:clip,height:662,width:662/quality=value:75/compress/Km3OZrWBSL2RPeiulZY1',
                  text: 'Levadura',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTrKGOlLfSD1U3U8JFjmCOUxtRbiHRGoJ7SA&s',
                  text: 'Mantequilla',
                ),
                _SingleCard(
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_gRr5CrN2PcndKaCQh6TGK7WOVqEfktInw&s',
                  text: 'Azúcar Morena',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyF1BR0BksKEsUkW16ABhYeE__DMtk8K_pCA&s',
                  text: 'Colorante',
                ),
                _SingleCard(
                  imageUrl: 'https://www.lala.com.mx/storage/app/media/Prodcutos/7501020513134.png',
                  text: 'Crema',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  imageUrl: 'https://www.lacentraldeabasto.com/1417-large_default/azucar-glass-zulka-500-g.jpg',
                  text: 'Azúcar Glass',
                ),
                _SingleCard(
                  imageUrl: 'https://static.wixstatic.com/media/868e30_adf6388995d94d5381e5a79261377592~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
                  text: 'Chispas',
                ),
              ]),
              TableRow(children: [
                _SingleCard(
                  imageUrl: 'https://manitoba.com.co/storage/2021/06/Mani-con-sal.png',
                  text: 'Maní',
                ),
                _SingleCard(
                  imageUrl: 'https://delmontefrutas.mx/wp-content/uploads/2021/07/Cereza-Negras-454g.png',
                  text: 'Cereza',
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
      child: Container(
        margin: EdgeInsets.all(15),
        height: 180,
        decoration: BoxDecoration(
          color: Color.fromRGBO(82, 183, 230, 0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                this.imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              this.text,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
