import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/models/apartments.dart';

abstract class Database {
  Future<void> createJob(Apartment apartment);
}

class FirestoreDatabase implements Database {
  final String uid;
  FirestoreDatabase({required this.uid});

  Future<void> createJob(Apartment apartment) async {
    final path = '/apartments/$uid/apartment_123';
    final docReference = FirebaseFirestore.instance.doc(path);
    await docReference.set(apartment.toMap());
  }
}
