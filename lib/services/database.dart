import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/models/apartments.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storageRef = FirebaseStorage.instance.ref();

abstract class Database {
  Future<void> createApartment(Apartment apartment);
  Future<String> uploadImage(name, image);
}

class FirestoreDatabase implements Database {
  Future<String> uploadImage(name, image) async {
    UploadTask uploadTask = storageRef.child('apart_$name.jpg').putFile(image);
    TaskSnapshot storageSnap = await uploadTask;
    Future<String> downloadUrl = storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> createApartment(Apartment apartment) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore
        .collection('apartments')
        .doc(apartment.name)
        .set(apartment.toMap());

    print('Trying');
  }
}
