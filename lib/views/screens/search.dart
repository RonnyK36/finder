import 'package:finder/config/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextFormField(
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
      body: Container(
        child: Center(
          child: ListView(
            children: [
              SvgPicture.asset(
                'assets/images/search.svg',
                height: 300,
              ),
              Text('Find verified Landlords')
            ],
          ),
        ),
      ),
    );
  }
}
