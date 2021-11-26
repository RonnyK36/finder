import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateApartment extends StatefulWidget {
  UpdateApartment({required this.doc});
  final QueryDocumentSnapshot doc;

  @override
  _UpdateApartmentState createState() => _UpdateApartmentState();
}

class _UpdateApartmentState extends State<UpdateApartment> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update apartment'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
