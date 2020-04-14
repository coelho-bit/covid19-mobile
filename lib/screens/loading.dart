import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var url = 'https://coelho-covid19tracker.herokuapp.com';
  var selectedCountryName = 'World';

  void getTime(Map countryInfo) async {

    if(countryInfo != null) {
      url = '$url/country/${countryInfo["countryName"]}';
      selectedCountryName = countryInfo["countryName"];
    }
    try {
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'selectedCountryName': selectedCountryName,
        'confirmed': data["data"]["confirmed"],
        'active': data["data"]["active"],
        'deaths': data["data"]["deaths"],
        'recovered': data["data"]["recovered"],
        'countriesList': data["countriesList"] ?? countryInfo["countryList"]
      });
    } catch (err) {
      print(err);
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final countryInfo = ModalRoute.of(context).settings.arguments;
    getTime(countryInfo);
    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 41, 41, 1),
      body: SpinKitWave(
        size: 24,
        color: Colors.yellow,
      ),
    );
  }
}
