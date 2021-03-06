import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/views/screens/auth_views/root.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:finder/widgets/components/upload_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateApartment extends StatefulWidget {
  UpdateApartment({required this.doc});
  final QueryDocumentSnapshot doc;

  @override
  _UpdateApartmentState createState() => _UpdateApartmentState();
}

class _UpdateApartmentState extends State<UpdateApartment> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController depositController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  get doc => widget.doc;

  bool isLoading = false;

  setFields() {
    nameController.text = doc['name'];
    priceController.text = doc['price'];
    depositController.text = doc['deposit'];
    locationController.text = doc['location'];
    descriptionController.text = doc['description'];
  }

  CollectionReference apartmentsRef =
      FirebaseFirestore.instance.collection('apartments');

  @override
  Widget build(BuildContext context) {
    setState(() {
      nameController.text = doc['name'];
      priceController.text = doc['price'];
      depositController.text = doc['deposit'];
      locationController.text = doc['location'];
      descriptionController.text = doc['description'];
    });
    return isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(doc['name'],
                  style: kUbuntu15.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 22)),
              centerTitle: true,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Config.screenHeight! * 0.3,
                      child: Image.network(doc['url']),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
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
                              minLines: 2,
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
                    Card(
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: setFields,
                            child: Text(
                              'Reset',
                              style: kUbuntu15.copyWith(
                                fontSize: 18,
                                color: kAccentColor,
                              ),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                              });
                              if (_formKey.currentState!.validate()) {
                                apartmentsRef.doc(doc['name']).update({
                                  "price": priceController.text,
                                  "deposit": depositController.text,
                                  "location": locationController.text,
                                  "description": descriptionController.text,
                                }).then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                                Get.back();
                              }
                            },
                            icon: Icon(Icons.update, color: Colors.green),
                            label: Text('Update',
                                style: kUbuntu15.copyWith(color: Colors.green)),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              print('Deleting');
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Delete ${doc["name"]}!',
                                        style: kUbuntu15.copyWith(
                                            color: kAccentColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    content: Text(
                                        'Are you sure you want to delete the apartment? This can not be undone.',
                                        style:
                                            kUbuntu15.copyWith(fontSize: 18)),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel',
                                            style: kUbuntu15.copyWith(
                                                fontSize: 18)),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          apartmentsRef
                                              .doc(doc['name'])
                                              .delete()
                                              .then((value) {
                                            setState(() {
                                              isLoading = false;
                                              Navigator.of(context).pop();
                                            });
                                            Get.to(() => Root());
                                          });
                                        },
                                        child: Text(
                                          'Yes, I\'m sure',
                                          style: kUbuntu15.copyWith(
                                              color: Colors.red, fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete_forever, color: Colors.red),
                            label: Text(
                              'Delete',
                              style: kUbuntu15.copyWith(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
