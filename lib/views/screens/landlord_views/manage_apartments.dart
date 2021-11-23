import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageApartments extends StatefulWidget {
  const ManageApartments({required this.uid});
  final String uid;

  @override
  _ManageApartmentsState createState() => _ManageApartmentsState();
}

class _ManageApartmentsState extends State<ManageApartments> {
  final _authController = Get.find<AuthController>();

  CollectionReference apartmentsRef =
      FirebaseFirestore.instance.collection('apartments');
  final userApartments =
      FirebaseFirestore.instance.collection('apartments').doc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: apartmentsRef.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          final String uid = _authController.userProfile!.uid;
          return Container(
            child: Center(
              child: Loading(),
            ),
          );
        }
        return Scaffold(
          body: ListView(
            children: snapshot.data!.docs.map((doc) {
              return Card(
                child: Text("doc['name']"),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
