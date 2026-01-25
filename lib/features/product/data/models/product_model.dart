class ProductModel {
    final int? id;
    final String? name;
    final String? description;
    final String? image;
    final double? rating;
    final double? price;

    ProductModel({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.rating,
        required this.price,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) {
        return ProductModel(
            id: json['id'],
            name: json['name'] ?? '',
            description: json['description'] ?? '',
            image: json['image'] ?? '',
            rating: double.parse(json['rating'].toString()),
            price: double.parse(json['price'].toString()),
        );
    }
}
