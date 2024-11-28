import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insumosbr/screens/PaymentDetailsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';


class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
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

  void _processPayment() async {
    if (_formKey.currentState!.validate()) {
      // Guardar los datos localmente
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('cardNumber', _cardNumberController.text);
      await prefs.setString('expiryDate', _expiryDateController.text);
      await prefs.setString('cvv', _cvvController.text);
      await prefs.setString('cardHolderName', _cardHolderNameController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se guardó correctamente el método de pago'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => PaymentDetailsScreen()),
          (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Forma de Pago',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 171, 251),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                      _buildTextFormField(
                        controller: _cardNumberController,
                        labelText: 'Número de tarjeta',
                        hintText: '1234 5678 9012 3456',
                        icon: Icons.credit_card,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          _CardNumberInputFormatter(),
                        ],
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.replaceAll(' ', '').length != 16) {
                            return 'Ingrese un número de tarjeta válido (16 dígitos)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      _buildTextFormField(
                        controller: _expiryDateController,
                        labelText: 'Fecha de expiración (MM/AA)',
                        hintText: 'MM/AA',
                        icon: Icons.calendar_today,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          _ExpiryDateInputFormatter(),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese la fecha de expiración';
                          }
                          if (!RegExp(r'^(0[1-9]|1[0-2])/[0-9]{2}$').hasMatch(value)) {
                            return 'Ingrese una fecha válida (MM/AA)';
                          }
                          final now = DateTime.now();
                          final parts = value.split('/');
                          if (parts.length == 2) {
                            final month = int.tryParse(parts[0]);
                            final year = int.tryParse('20${parts[1]}');
                            if (month == null ||
                                year == null ||
                                DateTime(year, month).isBefore(DateTime(now.year, now.month))) {
                              return 'La fecha no puede estar en el pasado';
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      _buildTextFormField(
                        controller: _cvvController,
                        labelText: 'CVV',
                        hintText: '123',
                        icon: Icons.lock,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty || value.length != 3) {
                            return 'Ingrese un CVV válido (3 dígitos)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
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
                              'Guardar',
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
    List<TextInputFormatter>? inputFormatters,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
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

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final newText = text.replaceAllMapped(
      RegExp(r'.{1,4}'),
      (match) => '${match.group(0)} ',
    );
    return newValue.copyWith(
      text: newText.trimRight(),
      selection: TextSelection.collapsed(offset: newText.trimRight().length),
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(text[i]);
    }

    final newText = buffer.toString();
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
