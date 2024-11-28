import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class PaymentDetailsScreen extends StatefulWidget {
  @override
  _PaymentDetailsScreenState createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  String? cardNumber;
  String? expiryDate;
  String? cvv;
  String? cardHolderName;

  @override
  void initState() {
    super.initState();
    _loadPaymentDetails();
  }

  Future<void> _loadPaymentDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cardNumber = prefs.getString('cardNumber');
      expiryDate = prefs.getString('expiryDate');
      cvv = prefs.getString('cvv');
      cardHolderName = prefs.getString('cardHolderName');
    });
  }

  Future<void> _deletePaymentDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cardNumber');
    await prefs.remove('expiryDate');
    await prefs.remove('cvv');
    await prefs.remove('cardHolderName');

    setState(() {
      cardNumber = null;
      expiryDate = null;
      cvv = null;
      cardHolderName = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Método de pago eliminado exitosamente.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Método de Pago',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cardNumber == null
            ? _buildEmptyPaymentDetails()
            : _buildPaymentDetails(),
      ),
    );
  }

  Widget _buildEmptyPaymentDetails() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.credit_card_off,
            size: 100,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            'No se han guardado métodos de pago.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCardRow(
                  icon: Icons.credit_card,
                  label: 'Número de tarjeta',
                  value: _maskCardNumber(cardNumber!),
                ),
                Divider(color: Colors.grey[300]),
                _buildCardRow(
                  icon: Icons.date_range,
                  label: 'Fecha de expiración',
                  value: expiryDate!,
                ),
                Divider(color: Colors.grey[300]),
                _buildCardRow(
                  icon: Icons.lock_outline,
                  label: 'CVV',
                  value: '*' * (cvv?.length ?? 0),
                ),
                Divider(color: Colors.grey[300]),
                _buildCardRow(
                  icon: Icons.person_outline,
                  label: 'Titular',
                  value: cardHolderName!,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                _deletePaymentDetails();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.delete, color: Colors.white),
              label: Text(
                'Eliminar método de pago',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: const Color.fromARGB(255, 0, 171, 251)),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _maskCardNumber(String cardNumber) {
    return cardNumber.replaceRange(0, cardNumber.length - 4, '*' * (cardNumber.length - 4));
  }
}