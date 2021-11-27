class Apartment {
  final String apartmentId;
  final String name;
  final String description;
  final String location;
  final String price;
  final String deposit;
  final String owner;
  final String url;
  final String ownerId;

  Apartment({
    required this.apartmentId,
    required this.name,
    required this.description,
    required this.location,
    required this.price,
    required this.deposit,
    required this.owner,
    required this.url,
    required this.ownerId,
  });

  Map<String, dynamic> toMap() {
    return {
      'apartmentId': apartmentId,
      'name': name,
      'description': description,
      'location': location,
      'price': price,
      'deposit': deposit,
      'owner': owner,
      'ownerId': ownerId,
      'url': url,
    };
  }
}
