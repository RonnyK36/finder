import 'package:flutter/material.dart';

class ManageApartments extends StatefulWidget {
  const ManageApartments({Key? key}) : super(key: key);

  @override
  _ManageApartmentsState createState() => _ManageApartmentsState();
}

class _ManageApartmentsState extends State<ManageApartments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Manage your apartments')),
    );
  }
}
