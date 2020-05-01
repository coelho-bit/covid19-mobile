import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Countries extends StatefulWidget {
  var argument;

  Countries({
    @required this.argument
  });

  @override
  State<StatefulWidget> createState() {
    return _CountriesState();
  }
}

class _CountriesState extends State<Countries> {
  var countryList = List();
  var filteredCountryList = List();

  searchCountryData(countryName, countryList) {
    print('$countryName from countries.dart');
    Navigator.pushReplacementNamed(context, '/',
        arguments: {"countryName": countryName, "countryList": countryList});
  }

  @override
  void initState() {
    widget.argument.toString();
    countryList = widget.argument["countriesList"];
    filteredCountryList = countryList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(41, 41, 41, 1),
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(38, 38, 38, 1),
        title: Text(
          'Locations',
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Color(0xFFFFF494)),
        ),
        centerTitle: true,
      ),
      body:
      Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child:  TextField(
                onChanged: (string) {
                  setState(() {
                    filteredCountryList = countryList
                        .where((u) => (u
                        .toLowerCase()
                        .startsWith(string.toLowerCase())))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Search by country',
                    fillColor: Color(0xFFFFF494)
                ),
              ),
          ),
          Expanded(
            child:  ListView.builder(
              primary: true,
              itemCount: filteredCountryList.length,
              itemBuilder: (context, index) {
                return Material(
                  child: ListTile(
                      title: Center(
                          child: Text(
                            filteredCountryList[index],
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Color(0xFFE1E1E1),
                                fontWeight: FontWeight.w300),
                          )),
                      onTap: () {
                        searchCountryData(countryList[index], countryList);
                      }),
                  color: Color.fromRGBO(41, 41, 41, 1),
                );
              }),
          )],
      )
    );
  }
}
