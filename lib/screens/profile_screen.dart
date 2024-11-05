import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) => route.isFirst); // Redirige a Home al retroceder
        return false; // Evita que el usuario regrese a otra pantalla
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Perfil", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 171, 251),
          automaticallyImplyLeading: false, // Oculta el botón de regreso
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                // Imagen de Perfil
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/3135/3135768.png',
                  ),
                ),
                SizedBox(height: 20),
                // Nombre de Usuario
                Text(
                  'Setsi',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  '@papirico',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 20),
                
                // Detalles del Usuario
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileDetailRow(icon: Icons.email, label: 'Correo', value: 'papirey@gmail.com'),
                        ProfileDetailRow(icon: Icons.phone, label: 'Teléfono', value: '+505 456 789'),
                        ProfileDetailRow(icon: Icons.location_on, label: 'Ubicación', value: 'Jinotepe, Nicaragua'),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 30),
                
                // Botones de Configuración
                Column(
                  children: [
                    ProfileButton(icon: Icons.settings, label: 'Configuración de Cuenta', onTap: () {}),
                    ProfileButton(icon: Icons.security, label: 'Privacidad', onTap: () {}),
                    ProfileButton(icon: Icons.logout, label: 'Cerrar Sesión', onTap: () {
                       Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                       );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget personalizado para los detalles del usuario
class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileDetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Color.fromARGB(255, 0, 171, 251)),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[700]),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

// Widget personalizado para botones de configuración
class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[700]),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[800]),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}


