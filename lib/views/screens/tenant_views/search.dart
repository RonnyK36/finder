import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/config/configurations.dart';
import 'package:finder/controllers/auth_controllers.dart';
import 'package:finder/widgets/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<QuerySnapshot>? landlordResults;
  searchLandlord(query) async {
    QuerySnapshot<Map<String, dynamic>> landlords = await landLordsRef
        .where('userMode', isGreaterThanOrEqualTo: query)
        .get();

    landlords.docs.forEach((DocumentSnapshot element) {
      print(element.data());
    });

    setState(() {
      // landlordResults = landlords;
    });
  }

  @override
  Widget build(BuildContext context) {
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
