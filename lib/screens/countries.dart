import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Countries extends StatefulWidget {
  var argument;

  Countries({@required this.argument});

  @override
  State<StatefulWidget> createState() {
    return _CountriesState();
  }
}

class _CountriesState extends State<Countries> {
  var countryList = List();
  var filteredCountryList = List();
  double _width = 56;

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
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
                          searchCountryData(
                              filteredCountryList[index], countryList);
                        }),
                    color: Color.fromRGBO(41, 41, 41, 1),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Visibility(
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white12,
                  ),
                  duration: Duration(milliseconds: 400),
                  width: _width,
                  height: 56,
                  child: TextField(
                    onChanged: (string) {
                      setState(() {
                        filteredCountryList = countryList
                            .where((u) =>
                        (u.toLowerCase().startsWith(string.toLowerCase())))
                            .toList();
                      });
                    },
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
                        border: InputBorder.none),
                  ),
                ),
                visible: _width == 56 ? false : true,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _width = MediaQuery. of(context).size.width;
          });
        },
        elevation: 0,
        child: Icon(
          Icons.search,
          color: Colors.black87,
        ),
        backgroundColor: Color(0xFFFFF494),
      ),
    );
  }
}
