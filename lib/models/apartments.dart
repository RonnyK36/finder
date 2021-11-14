class Apartment {
  final String apartmentId;
  final String name;
  final String description;
  final String location;
  final String price;
  Apartment({
    required this.apartmentId,
    required this.name,
    required this.description,
    required this.location,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'apartmentId': apartmentId,
      'name': name,
      'description': description,
      'location': location,
      'price': price,
    };
  }
}
