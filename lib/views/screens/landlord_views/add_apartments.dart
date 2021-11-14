import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/models/apartments.dart';
import 'package:finder/services/database.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddApartment extends StatefulWidget {
  const AddApartment({Key? key}) : super(key: key);

  @override
  _AddApartmentState createState() => _AddApartmentState();
}

class _AddApartmentState extends State<AddApartment> {
  final _authController = Get.find<AuthController>();

  FirestoreDatabase database = FirestoreDatabase();

  Future<void> _createApartment(context) async {
    await database.createApartment(
      Apartment(
          apartmentId: _authController.userProfile!.uid,
          name: 'Haven House',
          description: 'Spacious rooms',
          location: 'Munene',
          price: '6500'),
    );
    print('Trying');
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
