import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:finder/widgets/components/single_apartment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageApartments extends StatefulWidget {
  @override
  _ManageApartmentsState createState() => _ManageApartmentsState();
}

class _ManageApartmentsState extends State<ManageApartments> {
  final _authController = Get.find<AuthController>();

  CollectionReference apartmentsRef =
      FirebaseFirestore.instance.collection('apartments');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: apartmentsRef.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final String uid = _authController.userProfile!.uid;
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: Loading(),
            ),
          );
        }
        return Scaffold(
          body: ListView(
            children: snapshot.data!.docs.map((doc) {
              if (doc["ownerId"] == uid) {
                return SingleApartmentCard(
                  isTenant: false,
                  doc: doc,
                );
              }
              return SizedBox.shrink();
            }).toList(),
          ),
        );
      },
    );
  }
}
