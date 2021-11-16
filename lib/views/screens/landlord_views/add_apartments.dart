import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/models/apartments.dart';
import 'package:finder/services/database.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:finder/widgets/components/rounded_text_form_field.dart';
import 'package:finder/widgets/components/upload_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddApartment extends StatefulWidget {
  const AddApartment({Key? key}) : super(key: key);

  @override
  _AddApartmentState createState() => _AddApartmentState();
}

class _AddApartmentState extends State<AddApartment> {
  final _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController apartmentName = TextEditingController();

  FirestoreDatabase database = FirestoreDatabase();

  Future<void> _createApartment(context) async {
    await database.createApartment(
      Apartment(
          apartmentId: _authController.userProfile!.uid,
          name: 'Blessings Apartment',
          description: 'No extra charges on rent. Low deposit',
          location: 'Biafra',
          price: '5500',
          deposit: '17000'),
    );
    print('Trying');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                height: Config.screenHeight! * 0.7,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UploadTextFormField(
                        controller: apartmentName,
                        prefixText: 'Name:  ',
                        validator: null,
                        labelText: 'Apartment name',
                        keyboardType: TextInputType.name,
                      ),
                      UploadTextFormField(
                        controller: apartmentName,
                        prefixText: 'Price:  ',
                        validator: null,
                        labelText: 'Apartment name',
                        keyboardType: TextInputType.name,
                      ),
                      TextField(
                        decoration: InputDecoration(isDense: true),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            reusableButton(
              context,
              onPressed: () => _createApartment(context),
              label: 'New apartment',
            ),
          ],
        ),
      ),
    );
  }
}
