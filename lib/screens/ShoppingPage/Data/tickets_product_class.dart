class Ticket {
  int? id;
  String name;
  String? sub_category;
  String? description;
  String? sku;
  double price;
  String? image;

  Ticket(
      {this.id,
      required this.name,
      this.description,
      required this.sku,
      required this.price,
      this.image,
      this.sub_category});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      sub_category: json["sub_category"] ?? "",
      price: double.parse(json["price"]),
      image: json["image"] ?? "",
      sku: json["SKU"] ?? "",
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
    data['SKU'] = this.sku;
    return data;
  }
}
