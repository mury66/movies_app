class Userdata {
  String name;
  String email;
  String id;
  String phone;
  List<int> watchLater;
  List<int> history;

  Userdata({
    required this.name,
    required this.email,
    this.id = "",
    required this.phone,
    required this.watchLater,
    required this.history,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      phone: json['phone'],
      watchLater: List<int>.from(json['watchLater'] ?? []),
      history: List<int>.from(json['history'] ?? [])
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id, 'phone': phone, 'watchLater': watchLater, 'history': history};
  }
}
