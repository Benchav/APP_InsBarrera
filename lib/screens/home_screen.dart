import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'shopping_cart_screen.dart';
import 'pastry_products_screen.dart';
import 'hacerad_screen.dart';
import 'purchaseH_screen.dart';
import 'favorite_cart.screen.dart';
import 'login_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    PastryProductsScreen(),
    ProfileScreen(),
    ShoppingCartScreen(),
    Hacercad(),
    WishlistScreen(),
    PurchaseHistoryScreen()
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (index == 3) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Carrito de Compras'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartScreen(),
                    ),
                  ).then((_) {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  });
                },
              ),
           /*   ListTile(
                leading: Icon(Icons.contact_page),
                title: Text('Información de contacto'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hacercad(),
                    ),
                  ).then((_) {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  });
                },
              ),*/
                ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Lista de deseos'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WishlistScreen(),
                    ),
                  ).then((_) {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  });
                },
              ),
                     ListTile(
                leading: Icon(Icons.shopify_sharp),
                title: Text('Historial de compra'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PurchaseHistoryScreen(),
                    ),
                  ).then((_) {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Mostrando la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Salir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Más',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}