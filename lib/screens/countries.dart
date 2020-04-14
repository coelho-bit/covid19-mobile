import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  searchCountryData(countryName, countryList) {
    print('$countryName from countries.dart');
    Navigator.pushReplacementNamed(context, '/',
        arguments: {"countryName": countryName, "countryList": countryList});
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    List countries = data["countriesList"];
    return Scaffold(
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
      body: ListView.builder(
          primary: true,
          itemCount: countries.length,
          itemBuilder: (context, index) {
            return Material(
              child: ListTile(
                  title: Center(
                      child: Text(
                    countries[index],
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        color: Color(0xFFE1E1E1),
                        fontWeight: FontWeight.w300),
                  )),
                  onTap: () {
                    searchCountryData(countries[index], countries);
                  }),
              color: Color.fromRGBO(41, 41, 41, 1),
            );
          }),
    );
  }
}
