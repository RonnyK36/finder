import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/data/apartments.dart';
import 'package:finder/views/screens/tenant_views/details_screen.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                final url = document['url'];
                final owner = document['owner'];

                return Center(
                  child: Card(
                    color: Colors.black,
                    child: Container(
                      // width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

                                // color: kAccentColor,
                                borderRadius: BorderRadius.circular(15)),
                            // width: 300,
                            // width: Config.screenWidth! * 0.95,
                            // height: Config.screenHeight! * 0.86,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_city,
                                                  color: Colors.grey,
                                                ),
                                                Text(
                                                  '${document["name"]}',
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
                                                  '${document["location"]}',
                                                  style: kUbuntu15.copyWith(
                                                      fontSize: 15,
                                                      color: Colors.grey),
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
                                  onTap: () {
                                    Get.to(
                                      () => DetailsPage(
                                        title: "${document['name']}",
                                        image: url,
                                        price: "${document['price']}",
                                        location: "${document['location']}",
                                        description:
                                            "${document['description']}",
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: kAccentColor,
                                    height: Config.screenHeight! * 0.3,
                                    child: Center(
                                      child: url == null
                                          ? Container()
                                          : Image.network(
                                              url,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Description: \n',
                                            style: kUbuntu15.copyWith(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '${document["description"]}',
                                            style: kUbuntu15.copyWith(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height: Config.screenHeight! * 0.02),
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
                                                value:
                                                    "${document['location']}",
                                              ),
                                              ApartmentDetailsTile(
                                                title: 'Price: ',
                                                value:
                                                    'KES ${document["price"]}',
                                              ),
                                              ApartmentDetailsTile(
                                                title: 'Deposit: ',
                                                value:
                                                    'KES ${document["deposit"]}',
                                              ),
                                              ApartmentDetailsTile(
                                                title: 'Owner: ',
                                                value: '${document["owner"]}',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                            // color: color == Colors.red ? Colors.white : Colors.red,
                                          ),
                                          label: Text('Call landlord'),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Get.to(
                                              () => DetailsPage(
                                                title: "${document['name']}",
                                                image: url,
                                                price: "${document['price']}",
                                                location:
                                                    "${document['location']}",
                                                description:
                                                    "${document['description']}",
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: Config.screenHeight! * 0.35,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    child: Text("${owner[0]}"),
                                    radius: 20,
                                    backgroundColor: Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
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
                          ),
                        ],
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

  Scaffold buildLocalApartmnents() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CarouselSlider(
                items: apartmentCard,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 10),
                  enlargeCenterPage: true,
                  height: Config.screenHeight! * 0.86,
                  enableInfiniteScroll: false,
                ),
              ),
            ),
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

class ApartmentCard extends StatelessWidget {
  ApartmentCard(
    this.color,
    this.title,
    this.description,
    this.location,
    this.price,
    this.image,
  );

  final Color color;
  final String title;
  final String description;
  final String location;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(apartments);
        Get.to(() => DetailsPage(
            title: title,
            image: image,
            price: price,
            location: location,
            description: description));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

                color: kAccentColor,
                borderRadius: BorderRadius.circular(15)),
            // width: 300,
            width: Config.screenWidth! * 0.95,
            height: Config.screenHeight! * 0.86,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Config.screenWidth! * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$title',
                            style: kUbuntu15.copyWith(
                                fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: Config.screenHeight! * 0.25,
                    child: Image.asset(image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description: \n',
                            style: kUbuntu15.copyWith(
                                fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            '$description',
                            style: kUbuntu15.copyWith(
                                fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 0,
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Location: ',
                                      style: kUbuntu15,
                                    ),
                                    Text(
                                      '$location',
                                      style: kUbuntu15.copyWith(
                                          fontSize: 20, color: kAccentColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price: ',
                                      style: kUbuntu15,
                                    ),
                                    Text(
                                      'KES $price',
                                      style: kUbuntu15.copyWith(
                                          fontSize: 20, color: kAccentColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            // color: color == Colors.red ? Colors.white : Colors.red,
                          ),
                          label: Text('Remove'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                            color: Colors.white,
                            // color: color == Colors.red ? Colors.white : Colors.red,
                          ),
                          label: Text('Call landlord'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  SizedBox(height: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
