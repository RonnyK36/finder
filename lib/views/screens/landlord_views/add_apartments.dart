import 'dart:io';

import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/models/apartments.dart';
import 'package:finder/services/database.dart';
import 'package:finder/widgets/components/reusable_button.dart';
import 'package:finder/widgets/components/upload_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
    required String downloadUrl,
  }) async {
    await database.createApartment(
      Apartment(
        apartmentId: "${name}_${_authController.userProfile!.uid}",
        ownerId: _authController.userProfile!.uid,
        name: name,
        owner: _authController.userProfile!.displayName!,
        description: description,
        location: location,
        price: price,
        deposit: deposit,
        url: downloadUrl,
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
            Center(
                child: Text(
              'Upload was successful',
              style: kUbuntu15.copyWith(fontSize: 25),
            )),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Future<String> _uploadImage(name, File file) async {
    String downloadUrl = await database.uploadImage(name, image);
    return downloadUrl;
  }

  bool isUploadComplete = false;
  File? image;

  final picker = ImagePicker();
  Future chooseImage(ImageSource source) async {
    try {
      final pickedImage = await picker.pickImage(source: source);
      if (pickedImage == null) {
        return null;
      }
      final tempImage = File(pickedImage.path);
      setState(() {
        this.image = tempImage;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  bool isLoading = false;

  handleSubmit(
    String price,
    name,
    deposit,
    location,
    description,
    image,
  ) async {
    setState(() {
      isLoading = true;
    });

    if (image == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'No Image selected',
                style: kUbuntu15.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kAccentColor,
                ),
              ),
              content: Text('Please select an image to continue.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Got it'))
              ],
            );
          });
    } else {
      setState(() {
        isUploadComplete = true;
      });
      String downloadUrl = await _uploadImage(name, image);
      _createApartment(
        context,
        downloadUrl: downloadUrl,
        name: name,
        price: price,
        deposit: deposit,
        location: location,
        description: description,
      );
      nameController.clear();
      priceController.clear();
      depositController.clear();
      locationController.clear();
      descriptionController.clear();
    }
  }

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
                        image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Column(
                                  children: [
                                    Image.file(
                                      image!,
                                      height: Config.screenHeight! * 0.3,
                                      width: Config.screenWidth! * 0.8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton.icon(
                                          onPressed: () =>
                                              chooseImage(ImageSource.camera),
                                          icon: Icon(
                                            Icons.add_a_photo,
                                            color: kAccentColor,
                                          ),
                                          label: Text(
                                            'Take pictures',
                                            style: kUbuntu15.copyWith(
                                              color: kAccentColor,
                                            ),
                                          ),
                                        ),
                                        TextButton.icon(
                                          onPressed: () =>
                                              chooseImage(ImageSource.gallery),
                                          icon: Icon(
                                            Icons.photo,
                                            color: kAccentColor,
                                          ),
                                          label: Text(
                                            'Choose from gallery',
                                            style: kUbuntu15.copyWith(
                                              color: kAccentColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: Config.screenHeight! * 0.3,
                                // color: kAccentColor,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Text(
                                      //   'Add images of the apartment',
                                      //   style: kUbuntu15.copyWith(
                                      //     fontSize: 18,
                                      //     // fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      Icon(
                                        Icons.image,
                                        color: kAccentColor,
                                        size: 80,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () =>
                                                chooseImage(ImageSource.camera),
                                            icon: Icon(
                                              Icons.add_a_photo,
                                              color: kAccentColor,
                                            ),
                                            label: Text(
                                              'Take pictures',
                                              style: kUbuntu15.copyWith(
                                                color: kAccentColor,
                                              ),
                                            ),
                                          ),
                                          TextButton.icon(
                                            onPressed: () => chooseImage(
                                                ImageSource.gallery),
                                            icon: Icon(
                                              Icons.photo,
                                              color: kAccentColor,
                                            ),
                                            label: Text(
                                              'Choose from gallery',
                                              style: kUbuntu15.copyWith(
                                                color: kAccentColor,
                                              ),
                                            ),
                                          ),
                                        ],
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
                        Container(
                          width: Config.screenWidth! * 0.9,
                          child: TextFormField(
                            controller: descriptionController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Field cannot be empty';
                              }
                              if (val.length <= 15) {
                                return 'Please provide a more descriptive input';
                              }
                            },
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: 5,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              alignLabelWithHint: true,
                              prefixText: 'Description:  ',
                              labelText: 'Describe your apartment',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: kAccentColor,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kErrorColor),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: kAccentColor,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
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
                    handleSubmit(
                      price,
                      name,
                      deposit,
                      location,
                      description,
                      image,
                    );
                  }
                },
                label: 'Create apartment',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
