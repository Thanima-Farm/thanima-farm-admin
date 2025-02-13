class Visitor {
  final String name;
  final String location;
  final String daysAgo;

  Visitor({required this.name, required this.location, required this.daysAgo});

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      name: json['name'],
      location: json['location'],
      daysAgo: json['daysAgo'],
    );
  }
}