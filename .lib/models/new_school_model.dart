class School {
  String name;
  String address;
  String phone;
  String email;
  String eiin;
  String logo;
  String password;
  String confirmPassword;

  School({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.eiin,
    required this.logo,
    required this.password,
    required this.confirmPassword,
  });

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      eiin: json['eiin'],
      logo: json['logo'],
      password: json['password'],
      confirmPassword: json['password_confirmation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'eiin': eiin,
      'logo': logo,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }
}
