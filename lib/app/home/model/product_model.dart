class ProductModel {
  final String id;
  final String title;

  ProductModel({
    required this.id,
    required this.title,
  });

  ProductModel copyWith({
    String? id,
    String? title,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
