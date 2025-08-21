class Userdata {
  String name;
  String email;
  String id;
  String phone;

  Userdata({
    required this.name,
    required this.email,
    this.id = "",
    required this.phone,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id, 'phone': phone};
  }
}
