import 'package:finder/models/apartments.dart';
import 'package:finder/services/database.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddApartment extends StatefulWidget {
  const AddApartment({Key? key}) : super(key: key);

  @override
  _AddApartmentState createState() => _AddApartmentState();
}

class _AddApartmentState extends State<AddApartment> {
  Future<void> _createApartment(context) async {
    // final database = Provider.of<Database>(context);
    final database = Get.find<Database>();
    await database.createJob(
      Apartment(
          apartmentId: 'apart_1',
          name: 'Haven House',
          description: 'Spacious rooms',
          location: 'Munene',
          price: '6500'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          reusableButton(
            context,
            onPressed: () => _createApartment(context),
            label: 'New apartment',
          ),
        ],
      ),
    ));
  }
}
