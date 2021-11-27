import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/auth_views/root.dart';
import 'package:finder/views/screens/landlord_views/update_apartment.dart';
import 'package:finder/views/screens/tenant_views/details_screen.dart';
import 'package:finder/views/screens/tenant_views/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleApartmentCard extends StatefulWidget {
  SingleApartmentCard({
    Key? key,
    required this.isTenant,
    required this.doc,
  }) : super(key: key);

  final bool isTenant;

  final QueryDocumentSnapshot doc;

  @override
  State<SingleApartmentCard> createState() => _SingleApartmentCardState();
}

class _SingleApartmentCardState extends State<SingleApartmentCard> {
  bool isLoading = false;
  CollectionReference apartmentsRef =
      FirebaseFirestore.instance.collection('apartments');
  CollectionReference landlordsRef =
      FirebaseFirestore.instance.collection('landlords');

  callLandlord(String id) async {
    // Future<DocumentSnapshot> doc = landlordsRef.doc(id).get();
  }

  @override
  Widget build(BuildContext context) {
    String owner = widget.doc['owner'];
    String name = widget.doc['name'];
    return Card(
      color: Colors.black,
      child: Container(
        // width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Config.screenWidth! * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    widget.doc['name'],
                                    style: kUbuntu15.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: kAccentColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add_location,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    widget.doc['location'],
                                    style: kUbuntu15.copyWith(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    color: kAccentColor,
                    height: Config.screenHeight! * 0.3,
                    child: Center(
                      child: Image.network(
                        widget.doc['url'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description: \n',
                              style: kUbuntu15.copyWith(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              widget.doc['description'],
                              style: kUbuntu15.copyWith(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Config.screenHeight! * 0.02),
                      Card(
                        elevation: 0,
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              children: [
                                ApartmentDetailsTile(
                                  title: 'Location:',
                                  value: widget.doc['location'],
                                ),
                                ApartmentDetailsTile(
                                  title: 'Price: ',
                                  value: widget.doc['price'],
                                ),
                                ApartmentDetailsTile(
                                  title: 'Deposit: ',
                                  value: widget.doc['deposit'],
                                ),
                                widget.isTenant
                                    ? ApartmentDetailsTile(
                                        title: 'Owner: ',
                                        value: widget.doc['owner'],
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      widget.isTenant
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () {
                                      print('Calling');
                                    },
                                    icon: Icon(
                                      Icons.phone,

                                      color: Colors.white,
                                      // color: color == Colors.red ? Colors.white : Colors.red,
                                    ),
                                    label: Text('Call landlord')),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Get.to(
                                      () => DetailsPage(
                                        title: widget.doc['name'],
                                        image: widget.doc['url'],
                                        price: widget.doc['price'],
                                        location: widget.doc['location'],
                                        description: widget.doc['description'],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.more,
                                    // color: color == Colors.red ? Colors.white : Colors.red,
                                  ),
                                  label: Text('View Details'),
                                ),
                              ],
                            )
                          : Card(
                              elevation: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton.icon(
                                    onPressed: () => Get.to(
                                        () => UpdateApartment(doc: widget.doc)),
                                    icon:
                                        Icon(Icons.update, color: Colors.green),
                                    label: Text('Update',
                                        style: kUbuntu15.copyWith(
                                            color: Colors.green)),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      print('Deleting');
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Delete $name!',
                                                style: kUbuntu15.copyWith(
                                                    color: kAccentColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            content: Text(
                                                'Are you sure you want to delete the apartment? This can not be undone.',
                                                style: kUbuntu15.copyWith(
                                                    fontSize: 18)),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Cancel',
                                                    style: kUbuntu15.copyWith(
                                                        fontSize: 18)),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isLoading = true;
                                                  });
                                                  apartmentsRef
                                                      .doc(widget.doc['name'])
                                                      .delete()
                                                      .then((value) {
                                                    setState(() {
                                                      isLoading = false;
                                                    });
                                                    Get.to(() => Root());
                                                  });
                                                },
                                                child: Text(
                                                  'Yes, I\'m sure',
                                                  style: kUbuntu15.copyWith(
                                                      color: Colors.red,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.delete_forever,
                                        color: Colors.red),
                                    label: Text(
                                      'Delete',
                                      style:
                                          kUbuntu15.copyWith(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            widget.isTenant
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: Config.screenHeight! * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            child: Text(owner[0]),
                            radius: 20,
                            backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ),
                          // Text(owner, style: kUbuntu15),
                          SizedBox(height: 10),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              // color: isFavorite
                              //     ? Colors.red
                              //     : Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class ApartmentDetailsTile extends StatelessWidget {
  const ApartmentDetailsTile({
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kUbuntu15,
        ),
        Text(
          value,
          style: kUbuntu15.copyWith(fontSize: 20, color: kAccentColor),
        ),
      ],
    );
  }
}
