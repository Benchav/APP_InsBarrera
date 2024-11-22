import 'package:flutter/foundation.dart';
import 'package:insumosbr/models/invoice.dart';
import '../models/cart_item.dart'; // Asegúrate de que esta ruta sea correcta

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  final List<Map<String, dynamic>> _purchaseHistory = [];
  final List<Invoice> _invoices = []; // Lista de facturas

  List<Invoice> get invoices => _invoices; // Getter para las facturas

  List<CartItem> get items => _items;

  List<Map<String, dynamic>> get purchaseHistory => _purchaseHistory;

  double get total {
    // Calcula el total del carrito
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(CartItem item) {
    final index = _items.indexWhere((element) => element.title == item.title);
    if (index != -1) {
      // Si el artículo ya existe, se incrementa la cantidad
      _items[index] = CartItem(
        title: item.title,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: _items[index].quantity + 1,
      );
    } else {
      // Si el artículo no existe, se agrega al carrito
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(String title) {
    // Elimina el artículo del carrito
    _items.removeWhere((item) => item.title == title);
    notifyListeners();
  }

  void clearCart() {
    // Limpia el carrito
    _items.clear();
    notifyListeners();
  }

  void incrementItem(String title) {
    final index = _items.indexWhere((item) => item.title == title);
    if (index != -1) {
      // Incrementa la cantidad del artículo
      _items[index] = CartItem(
        title: _items[index].title,
        imageUrl: _items[index].imageUrl,
        price: _items[index].price,
        quantity: _items[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  void decrementItem(String title) {
    final index = _items.indexWhere((item) => item.title == title);
    if (index != -1 && _items[index].quantity > 1) {
      // Decrementa la cantidad del artículo, solo si es mayor que 1
      _items[index] = CartItem(
        title: _items[index].title,
        imageUrl: _items[index].imageUrl,
        price: _items[index].price,
        quantity: _items[index].quantity - 1,
      );
      notifyListeners();
    } else {
      // Si la cantidad es 1, eliminamos el artículo del carrito
      removeItem(title);
    }
  }

  // Nueva funcionalidad: mover productos del carrito al historial
 void checkout() {
  if (_items.isNotEmpty) {
    // Crear un código único para la factura
    final invoiceCode = "FAC-${DateTime.now().millisecondsSinceEpoch}";

    // Agregar la factura con todos los productos
    final invoice = Invoice(
      invoiceCode: invoiceCode,
      date: DateTime.now().toString().split(' ')[0], // Fecha en formato corto
      totalPrice: total,
      products: _items.map((item) {
        return {
          'title': item.title,
          'quantity': item.quantity,
          'price': item.price,
          'imageUrl': item.imageUrl,
        };
      }).toList(),
    );

    _invoices.add(invoice);

    // Limpiar el carrito después del pago
    clearCart();
    notifyListeners();
  }
}


void removeInvoice(int index) {
  if (index >= 0 && index < _invoices.length) {
    _invoices.removeAt(index);
    notifyListeners();
  }
}


void removePurchaseHistoryItem(int index) {
  if (index >= 0 && index < _purchaseHistory.length) {
    _purchaseHistory.removeAt(index);
    notifyListeners();
  }
}
  // Nueva funcionalidad: limpiar el historial (opcional para cerrar sesión o reinicio)
  void clearPurchaseHistory() {
    _purchaseHistory.clear();
    notifyListeners();
  }
}





