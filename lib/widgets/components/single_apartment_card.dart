import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/landlord_views/update_apartment.dart';
import 'package:finder/views/screens/tenant_views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleApartmentCard extends StatelessWidget {
  const SingleApartmentCard({
    Key? key,
    required this.isTenant,
    required this.doc,
    required this.updateApartment,
    required this.callLandlord,
  }) : super(key: key);

  final bool isTenant;
  final QueryDocumentSnapshot doc;
  final Function updateApartment;
  final Function callLandlord;

  @override
  Widget build(BuildContext context) {
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
                                    doc['name'],
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
                                    doc['location'],
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
                  GestureDetector(
                    onTap: isTenant
                        ? () {
                            Get.to(
                              () => DetailsPage(
                                title: doc['name'],
                                image: doc['url'],
                                price: doc['price'],
                                location: doc['location'],
                                description: doc['description'],
                              ),
                            );
                          }
                        : () {
                            Get.to(
                              () => UpdateApartment(
                                doc: doc,
                              ),
                            );
                          },
                    child: Container(
                      color: kAccentColor,
                      height: Config.screenHeight! * 0.3,
                      child: Center(
                        child: Image.network(
                          doc['url'],
                          fit: BoxFit.contain,
                        ),
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
                              doc['description'],
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
                                  value: doc['location'],
                                ),
                                ApartmentDetailsTile(
                                  title: 'Price: ',
                                  value: doc['price'],
                                ),
                                ApartmentDetailsTile(
                                  title: 'Deposit: ',
                                  value: doc['deposit'],
                                ),
                                isTenant
                                    ? ApartmentDetailsTile(
                                        title: 'Owner: ',
                                        value: doc['owner'],
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      isTenant
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      isTenant ? Icons.phone : Icons.update,
                                      color: Colors.white,
                                      // color: color == Colors.red ? Colors.white : Colors.red,
                                    ),
                                    label: Text('Call landlord')),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Get.to(
                                      () => DetailsPage(
                                        title: doc['name'],
                                        image: doc['url'],
                                        price: doc['price'],
                                        location: doc['location'],
                                        description: doc['description'],
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
                                    onPressed: () =>
                                        Get.to(() => UpdateApartment(doc: doc)),
                                    icon:
                                        Icon(Icons.update, color: Colors.green),
                                    label: Text('Update',
                                        style: kUbuntu15.copyWith(
                                            color: Colors.green)),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      print('Deleting');
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
            isTenant
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: Config.screenHeight! * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            child: Text('${doc["owner[0]"]}'),
                            radius: 20,
                            backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ),
                          // Text(owner, style: kUbuntu15),
                          SizedBox(height: 10),
                          IconButton(
                            onPressed: () {
                              // setState(() {
                              //   isFavorite = !isFavorite;
                              // });
                            },
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
