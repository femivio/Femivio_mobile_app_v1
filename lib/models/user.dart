class User {
  String name;
  String email;
  String phone;
  String place;
  String password;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.place,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'place': place,
    'password': password,
  };
}
