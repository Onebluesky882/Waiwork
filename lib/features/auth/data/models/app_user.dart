class AppUser {
  final String email;
  final String? password;
  AppUser({required this.email, this.password});

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
