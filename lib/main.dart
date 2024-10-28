import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InsBR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      home: LoginScreen(),
    );
  }
}

// Pantalla de Login
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Center(child: const Text("Iniciar Sesión", style: TextStyle(color: Colors.white),)),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Color.fromARGB(255, 0, 171, 251)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  'Registrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pantalla de Registro
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text("Registrarce", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre Completo',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Registrarse',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 171, 251)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pantalla Home
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      // Home
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (index == 1) {
      // Perfil
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
    } else if (index == 2) {
      // Logout (Vuelve a la pantalla de Login)
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (index == 3) {
      // Mostrar opciones adicionales
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCartScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.cake),
                title: Text('Productos'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PastryProductsScreen()));
                },
              ),
               ListTile(
                leading: Icon(Icons.contact_page),
                title: Text('Información de contacto'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Hacercad()));
                },
               ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Center(
        child: Text('¡Bienvenido!', style: TextStyle(fontSize: 24)),
      ),
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

// Pantalla de carrito de compras
class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int itemCount = 0;

  void _incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void _decrementItem() {
    setState(() {
      if (itemCount > 0) itemCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito de Compras", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           // Image.network('https://via.placeholder.com/150'),
           Image.network('https://bhgsuper.es/178-large_default/harina-de-trigo-espelta-bio-1kg-el-granero-integral.jpg'),
            SizedBox(height: 20),
            Text('Harina', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: _decrementItem,
                ),
                Text('$itemCount', style: TextStyle(fontSize: 24)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _incrementItem,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de productos pasteleros
class PastryProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos pasteleros", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Chocolate'),
            subtitle: Text('30 barras.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Levadura'),
            subtitle: Text('15 tarros.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Harina'),
            subtitle: Text('26 sacos.'),
          ),
             ListTile(
            leading: Icon(Icons.cake),
            title: Text('Azucar'),
            subtitle: Text('100 lb.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Polvo de hornear'),
            subtitle: Text('18 lb.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Azucar Morena'),
            subtitle: Text('25 lb.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Mantequilla'),
            subtitle: Text('25 Barra.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Chispas de caramelo'),
            subtitle: Text('libreado.'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Cerezas'),
            subtitle: Text('50 latas.'),
          ),
        ],
      ),
    );
  }
}

// Pantalla de Perfil  
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     title:  Text("Perfil", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60,
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135768.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre del Usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Juan Perez',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}


// Pantalla de Lista de Productos
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});
   @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ) , 
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
          ),          
        title: Text("Catalogos", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed:(){
              },
              icon:const Icon(Icons.article)
          ),
          ],
        ),
        body: Center(
          child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Producto", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Inventario", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Facturació", style: TextStyle(color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 148, 199, 241),
              child: const Text("Usuario", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 148, 199, 241),
              child: const Text("Cliente", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 148, 199, 241),
              child: const Text("Proveedores", style: TextStyle(color: Colors.white),),
            ),
          ],
        )
        ),
      )
    );
  }
}

// Pantalla Informacion de contacto
class Hacercad extends StatelessWidget {
  const Hacercad({super.key});
   @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ) , 
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
          ),          
        title: Text("Información de contacto", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          actions: [
          ],
        ),
        body: Center(
          child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Correo", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Telefono", style: TextStyle(color: Colors.white),),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Color.fromARGB(255, 148, 199, 241),
              child: const Text("Redes sociales", style: TextStyle(color: Colors.white)),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: const Color.fromARGB(255, 148, 199, 241),
              child: const Text("Pagina web", style: TextStyle(color: Colors.white),),
            ),
          ],
        )
        ),
      )
    );
  }
}