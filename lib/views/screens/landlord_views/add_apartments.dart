import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/models/apartments.dart';
import 'package:finder/services/database.dart';
import 'package:finder/widgets/components/reusable_button.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController depositController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FirestoreDatabase database = FirestoreDatabase();

  Future<void> _createApartment(
    context, {
    required String name,
    required String price,
    required String deposit,
    required String location,
    required String description,
  }) async {
    await database.createApartment(
      Apartment(
        apartmentId: _authController.userProfile!.uid,
        name: name,
        description: description,
        location: location,
        price: price,
        deposit: deposit,
      ),
    );
    print('Trying');
  }

  Container buildSuccessPage() {
    return Container(
      child: Center(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isUploadComplete = false;
                  });
                },
                icon: Icon(Icons.close)),
            Spacer(),
            Center(child: Text('Upload was successful')),
            Spacer(),
          ],
        ),
      ),
    );
  }

  bool isUploadComplete = false;

  @override
  Widget build(BuildContext context) {
    return isUploadComplete ? buildSuccessPage() : buildUploadForm();
  }

  Scaffold buildUploadForm() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add new apartment',
          style: kUbuntu15.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: kAccentColor,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  height: Config.screenHeight! * 0.95,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: Config.screenHeight! * 0.3,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Add images of the apartment',
                                  style: kUbuntu15.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.image_search,
                                    size: 80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        UploadTextFormField(
                          controller: nameController,
                          prefixText: 'Name:  ',
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            if (val.length <= 5) {
                              return 'Provide a valid name';
                            }
                          },
                          labelText: 'Apartment name',
                          keyboardType: TextInputType.name,
                        ),
                        UploadTextFormField(
                          controller: priceController,
                          prefixText: 'Price:  ',
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                          },
                          labelText: 'Price in KES',
                          keyboardType: TextInputType.number,
                        ),
                        UploadTextFormField(
                          controller: depositController,
                          prefixText: 'Deposit:  ',
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                          },
                          labelText: 'Deposit in KES',
                          keyboardType: TextInputType.number,
                        ),
                        UploadTextFormField(
                          controller: locationController,
                          prefixText: 'Location:  ',
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                          },
                          labelText: 'Apartment Location',
                          keyboardType: TextInputType.name,
                        ),
                        UploadTextFormField(
                          controller: descriptionController,
                          prefixText: 'Description:  ',
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            if (val.length <= 15) {
                              return 'Please provide a more descriptive input';
                            }
                          },
                          labelText: 'Describe your apartment',
                          keyboardType: TextInputType.name,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              reusableButton(
                context,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String name = nameController.text.trim();
                    String price = priceController.text.trim();
                    String deposit = depositController.text.trim();
                    String location = locationController.text.trim();
                    String description = descriptionController.text.trim();
                    _createApartment(
                      context,
                      name: name,
                      price: price,
                      deposit: deposit,
                      location: location,
                      description: description,
                    );
                  }
                  nameController.clear();
                  priceController.clear();
                  depositController.clear();
                  locationController.clear();
                  descriptionController.clear();
                  setState(() {
                    isUploadComplete = true;
                  });
                },
                label: 'New apartment',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
