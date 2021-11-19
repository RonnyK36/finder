import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/views/screens/tenant_views/details_screen.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<QuerySnapshot>? landlordResults;
  searchLandlord(query) async {
    QuerySnapshot<Map<dynamic, dynamic>> landlords = await landLordsRef
        .where('userMode', isGreaterThanOrEqualTo: query)
        .get();

    landlords.docs.forEach((DocumentSnapshot element) {
      print(element.data());
    });

    setState(() {
      // landlordResults = landlords;
    });
  }

  TextEditingController searchController = TextEditingController();

  CollectionReference landlordsRef =
      FirebaseFirestore.instance.collection('landlords');

  @override
  Widget build(BuildContext context) {
    // return buildSearchPage();
    return Container(
      color: kAccentColor,
      child: StreamBuilder(
        stream: landlordsRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Loading(),
              ),
            );
          }
          return Scaffold(
            backgroundColor: kPrimaryColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.name,
                onFieldSubmitted: searchLandlord,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search',
                  hintStyle: kUbuntu15.copyWith(fontSize: 18),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        searchController.clear();
                      },
                      icon: Icon(Icons.close)),
                ),
              ),
            ),
            body: ListView(
              children: snapshot.data!.docs.map((document) {
                // final url = document['url'];

                return Center(
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)]),
                      title: Text(
                        '${document["displayName"]}',
                        style: kUbuntu15.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${document["phone"]}',
                        style: kUbuntu15,
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          int phoneNumber = int.parse('${document["phone"]}');
                          await FlutterPhoneDirectCaller.callNumber(
                              "0${phoneNumber.toString()}");
                          // launch('');
                        },
                        icon: Icon(Icons.phone),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  Scaffold buildSearchPage() {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextFormField(
          onFieldSubmitted: searchLandlord,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search',
            hintStyle: kUbuntu15.copyWith(fontSize: 18),
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            ),
            suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
          ),
        ),
      ),
      body: landlordResults == null ? buildNoContent() : buildSearchResults(),
    );
  }

  buildSearchResults() {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: landlordResults,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            } else {
              List<Text> landlordResult = [];
              // snapshot.data!..forEach((doc) {});
              snapshot.data!.documents.forEach((doc) {});
              print(snapshot.data.toString());
              print(snapshot.data);
              print('Done executing future');

              return ListView(
                children: landlordResult,
              );
            }
          }),
    );
  }

  SingleChildScrollView buildNoContent() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/search.svg',
                height: Config.screenHeight! * 0.5,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Find verified Landlords',
                  style: kUbuntu15.copyWith(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
