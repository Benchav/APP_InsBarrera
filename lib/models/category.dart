class Category {
  final String id;
  final String descripcion;
  final bool estado;
  final DateTime fechaCreacion;

  Category({
    required this.id,
    required this.descripcion,
    required this.estado,
    required this.fechaCreacion,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['Id'],
      descripcion: json['Descripcion'],
      estado: json['Estado'],
      fechaCreacion: DateTime.parse(json['FechaCreacion']),
    );
  }
}