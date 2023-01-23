class User {
  int? id;
  String? name;
  String? email;
  String? registration_number;
  String? created_at;
  bool? is_active;
  String? image;

  User(
      {this.id,
      this.name,
      this.email,
      this.registration_number,
      this.created_at,
      this.is_active,
      this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      registration_number: json["registration_number"],
      created_at: json["created_at"],
      is_active: json["is_active"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['registration_number'] = this.registration_number;
    data['created_at'] = this.created_at;
    data['is_active'] = this.is_active;
    data['image'] = this.image;
    return data;
  }
}
