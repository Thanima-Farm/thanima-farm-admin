class User {
  final String serial;
  final String name;
  final String contact;
  final String mail;
  final String role;
  final String username;
  final String password;
  String status; // Mutable field

  User({
    required this.serial,
    required this.name,
    required this.contact,
    required this.mail,
    required this.role,
    required this.username,
    required this.password,
    required this.status,
  });
}