import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/models/apartments.dart';

abstract class Database {
  Future<void> createApartment(Apartment apartment);
}

class FirestoreDatabase implements Database {
  Future<void> createApartment(Apartment apartment) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore
        .collection('apartments')
        .doc(apartment.name)
        .set(apartment.toMap());

    print('Trying');
  }
}
