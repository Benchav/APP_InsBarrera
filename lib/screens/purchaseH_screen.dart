import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_provider.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final invoices = cartProvider.invoices;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Historial de compras",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 171, 251),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: invoices.isEmpty
            ? Center(
                child: Text(
                  "No hay facturas disponibles.",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (context, index) {
                  final invoice = invoices[index];
                  final double subtotal = invoice.products.fold(
                    0.0,
                    (sum, product) =>
                        sum + (product['price'] * product['quantity']),
                  );
                  final double iva = subtotal * 0.15; // 15% IVA
                  final double total = subtotal + iva;

                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Factura: ${invoice.invoiceCode}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Fecha: ${invoice.date}"),
                          SizedBox(height: 10),
                          Divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: invoice.products.map((product) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      product['imageUrl'],
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        "${product['title']} (x${product['quantity']})",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Text(
                                      "\$${(product['price'] * product['quantity']).toStringAsFixed(2)}",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal:",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "\$${subtotal.toStringAsFixed(2)}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "IVA (15%):",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "\$${iva.toStringAsFixed(2)}",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              Text(
                                "\$${total.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Confirmar antes de eliminar
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Eliminar factura"),
                                    content: Text(
                                        "¿Estás seguro de que deseas eliminar esta factura?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Cancelar"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          cartProvider.removeInvoice(index);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Eliminar"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}