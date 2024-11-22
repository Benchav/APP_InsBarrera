class Invoice {
  final String invoiceCode;
  final String date;
  final double totalPrice;
  final List<Map<String, dynamic>> products;

  Invoice({
    required this.invoiceCode,
    required this.date,
    required this.totalPrice,
    required this.products,
  });
}
