import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
       // title: Text("Iniciar Sesión"),
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
       // title: Text("Registro"),
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
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    //    title: Text("Inicio"),
title:  Text("Inicio", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(
                '    Ir al Perfil   ',
                style: TextStyle(color: const Color.fromARGB(255, 0, 171, 251)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.8),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(
                'Ver Catelogos',
                style: TextStyle(color: const Color.fromARGB(255, 0, 171, 251)),
              ),
            ),
          ],
        ),
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
            //  backgroundImage: AssetImage('assets/profile_pic.png'),
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135768.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre del Usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Insumos BR',
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
    return MaterialApp( //este siempre debe ir
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
        //  title: Center(child: const Text("Catalogos", style: TextStyle(color: Colors.white),)),
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