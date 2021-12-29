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
      // color: kPrimaryColor,
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
            backgroundColor: kPrimaryColor,
            appBar: AppBar(
              backgroundColor: kAccentColor,
              title: Text(
                'All apartments',
                style: kUbuntu15.copyWith(fontSize: 23),
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: snapshot.data!.docs.map((document) {
                return Center(
                  child: Column(
                    children: [
                      SingleApartmentCard(
                        isTenant: true,
                        doc: document,
                      ),
                      Divider(
                        height: 10,
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ],
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
