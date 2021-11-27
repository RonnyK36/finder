import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/tenant_views/landlord_apartments.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<QuerySnapshot>? landlordResults;
  searchLandlord(query) async {
    QuerySnapshot<Map<dynamic, dynamic>> landlords = await landLordsRef
        .where('userMode', isGreaterThanOrEqualTo: query)
        .get();

    landlords.docs.forEach((DocumentSnapshot element) {
      print(element.data());
    });

    setState(() {
      // landlordResults = landlords;
    });
  }

  TextEditingController searchController = TextEditingController();

  CollectionReference landlordsRef =
      FirebaseFirestore.instance.collection('landlords');

  @override
  Widget build(BuildContext context) {
    // return buildSearchPage();
    return Container(
      color: kAccentColor,
      child: StreamBuilder(
        stream: landlordsRef.snapshots(),
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
              elevation: 0,
              backgroundColor: kAccentColor,
              centerTitle: true,
              title: Text('Call for enquiries'),
            ),
            body: ListView(
              children: snapshot.data!.docs.map((document) {
                final name = document['displayName'];
                final ownerId = document['id'];

                return Center(
                  child: Card(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => LandlordAparmtents(
                              ownerId: ownerId,
                            ));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(name[0],
                              style: kUbuntu15.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          backgroundColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                        ),
                        title: Text(
                          '${document["displayName"]}',
                          style:
                              kUbuntu15.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${document["phone"]}',
                          style: kUbuntu15,
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            int phoneNumber = int.parse('${document["phone"]}');
                            await FlutterPhoneDirectCaller.callNumber(
                                "0${phoneNumber.toString()}");
                            // launch('');
                          },
                          icon: Icon(Icons.phone),
                        ),
                      ),
                    ),
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
