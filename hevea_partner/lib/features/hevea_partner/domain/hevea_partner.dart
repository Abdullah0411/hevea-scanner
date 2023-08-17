class HeveaPartner {
  HeveaPartner({
    required this.name,
    required this.password,
    required this.token,
  });

  String name;
  String password;
  String token;

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'token': token,
      };

  factory HeveaPartner.fromJson(Map<String, dynamic> json) {
    return HeveaPartner(
      name: json['name'],
      password: json['password'],
      token: json['token'],
    );
  }
}
