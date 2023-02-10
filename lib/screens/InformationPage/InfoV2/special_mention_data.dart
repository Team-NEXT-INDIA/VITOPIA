class SpecialPerson {
  final int id;
  final String name;
  final String designation;
  final String quote;
  final String image;
  final String category;

  SpecialPerson({
    required this.image,
    required this.id,
    required this.name,
    required this.designation,
    required this.quote,
    required this.category,
  });

  factory SpecialPerson.fromJson(Map<String, dynamic> json) {
    return SpecialPerson(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      designation: json['designation'] ?? "",
      quote: json['quote'] ?? "",
      category: json['category'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
