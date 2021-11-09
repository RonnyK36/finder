import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/data/apartments.dart';
import 'package:finder/views/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Apartments extends StatefulWidget {
  const Apartments({Key? key}) : super(key: key);

  @override
  _ApartmentsState createState() => _ApartmentsState();
}

class _ApartmentsState extends State<Apartments> {
  @override
  Widget build(BuildContext context) {
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
