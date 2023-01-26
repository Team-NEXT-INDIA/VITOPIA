class Product {
  int? id;
  String name;
  String? sub_category;
  String? description;
  String? SKU;
  double price;
  String? image;

  Product(
      {this.id,
      required this.name,
      this.description,
      required this.SKU,
      required this.price,
      this.image,
      this.sub_category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      sub_category: json["sub_category"] ?? "",
      price: double.parse(json["price"]),
      image: json["image"] ?? "",
      SKU: json["SKU"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sub_category'] = this.sub_category;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}
