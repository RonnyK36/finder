import 'package:finder/config/configurations.dart';
import 'package:finder/data/apartments.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    required this.title,
    required this.image,
    required this.price,
    required this.location,
    required this.description,
  });
  final String title;
  final String image;
  final String price;
  final String location;
  final String description;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Config.screenHeight! * 0.5,
                width: double.infinity,
                child: Image.asset(widget.image),
              ),
              Row(
                children: [
                  Text(
                    'Location: ',
                    style: kUbuntu15.copyWith(fontSize: 20),
                  ),
                  Text(
                    widget.location,
                    style: kUbuntu15.copyWith(fontSize: 30),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Price: ',
                    style: kUbuntu15.copyWith(fontSize: 20),
                  ),
                  Text(
                    'KES ${widget.price}',
                    style: kUbuntu15.copyWith(fontSize: 30),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description: ',
                      style: kUbuntu15.copyWith(fontSize: 20)),
                  Text(
                    widget.description,
                    style: kUbuntu15.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
