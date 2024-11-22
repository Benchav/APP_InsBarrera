import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importar el HomeScreen

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }

  void _processPayment() {
    if (_formKey.currentState!.validate()) {
      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se guardó correctamente el método de pago'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Redirigir al Home después de un pequeño retraso
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()), // Redirigir a tu HomeScreen
          (route) => false, // Eliminar todas las rutas anteriores
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Cuando el usuario intente retroceder, redirigir al HomeScreen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()), // Redirigir al HomeScreen
          (route) => false, // Eliminar todas las rutas anteriores
        );
        return false; // Evitar el comportamiento predeterminado (que cierra la pantalla)
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
            'Forma de Pago',
            style: TextStyle(color: Colors.white),),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 171, 251),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header decorativo
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 171, 251),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Center(
                  child: Icon(
                    Icons.credit_card,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Campo: Número de tarjeta
                      _buildTextFormField(
                        controller: _cardNumberController,
                        labelText: 'Número de tarjeta',
                        hintText: '1234 5678 9012 3456',
                        icon: Icons.credit_card,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length != 16) {
                            return 'Ingrese un número de tarjeta válido (16 dígitos)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      // Campo: Fecha de expiración
                      _buildTextFormField(
                        controller: _expiryDateController,
                        labelText: 'Fecha de expiración (MM/AA)',
                        hintText: 'MM/AA',
                        icon: Icons.calendar_today,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese la fecha de expiración';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      // Campo: CVV
                      _buildTextFormField(
                        controller: _cvvController,
                        labelText: 'CVV',
                        hintText: '123',
                        icon: Icons.lock,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length != 3) {
                            return 'Ingrese un CVV válido (3 dígitos)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      // Campo: Nombre del titular
                      _buildTextFormField(
                        controller: _cardHolderNameController,
                        labelText: 'Nombre del titular',
                        hintText: 'Nombre completo',
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese el nombre del titular';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24),
                      // Botón de pago
                      ElevatedButton(
                        onPressed: _processPayment,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 171, 251),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.payment, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Pagar ahora',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 0, 171, 251)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 0, 171, 251),
          ),
        ),
      ),
      validator: validator,
    );
  }
}
