class UserModel {
  final int id;
  final String name;
  final String email;
  final String mobile;
  final String username;
  final String password;
  final String role;
  final String status;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.username,
    required this.password,
    required this.role,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
      status: json['status'] == "true" ? "Active" : "Disable",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'username': username,
      'password': password,
      'role': role,
      'status': status == "Active" ? "true" : "false",
    };
  }
}
