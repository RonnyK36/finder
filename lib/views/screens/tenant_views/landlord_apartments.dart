import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:finder/widgets/components/single_apartment_card.dart';
import 'package:flutter/material.dart';

class LandlordAparmtents extends StatefulWidget {
  LandlordAparmtents({
    required this.ownerId,
    required this.owner,
  });
  final String ownerId;
  final String owner;

  @override
  _LandlordAparmtentsState createState() => _LandlordAparmtentsState();
}

class _LandlordAparmtentsState extends State<LandlordAparmtents> {
  CollectionReference apartmentsRef =
      FirebaseFirestore.instance.collection('apartments');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: apartmentsRef.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final String ownerId = widget.ownerId;
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: Loading(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.owner,
              style: kUbuntu15.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView(
            children: snapshot.data!.docs.map((doc) {
              if (doc["ownerId"] == ownerId) {
                return SingleApartmentCard(
                  isTenant: true,
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
