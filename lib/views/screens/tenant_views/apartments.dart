import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:finder/widgets/components/single_apartment_card.dart';
import 'package:flutter/material.dart';

class Apartments extends StatefulWidget {
  const Apartments({Key? key}) : super(key: key);

  @override
  _ApartmentsState createState() => _ApartmentsState();
}

class _ApartmentsState extends State<Apartments> {
  CollectionReference apartmentsRef =
      FirebaseFirestore.instance.collection('apartments');
//  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // return buildLocalApartmnents();
    return Container(
      color: kAccentColor,
      child: StreamBuilder(
        stream: apartmentsRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Loading(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Available now'),
            ),
            body: ListView(
              children: snapshot.data!.docs.map((document) {
            

                return Center(
                  child: SingleApartmentCard(
                    isTenant: true,
                    doc: document,
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
