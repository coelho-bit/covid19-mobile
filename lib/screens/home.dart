import 'package:covid19/components/label_value_column.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 38, 38, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 41, 41, 1),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'COVID',
                style: GoogleFonts.josefinSans(color: Color(0xFFFFF494), fontSize: 24.0, fontWeight: FontWeight.bold)
              ),
              TextSpan(
                text: '-19',
                  style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('\n'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                  child: FloatingActionButton(
                    elevation: 0,
                    mini: true,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    backgroundColor: Colors.grey[800],
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  visible: data["selectedCountryName"] != "World"),
              SizedBox(
                width: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: FlatButton.icon(
                    splashColor: Colors.grey[800],
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color.fromRGBO(60, 60, 60, 1),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/countries',
                          arguments: {'countriesList': data["countriesList"]});
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: Color(0xFFDEDEDE),
                      size: 24.0,
                    ),
                    label: Text(
                      data["selectedCountryName"],
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w300),
                    )
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Divider(
            thickness: 2.0,
            color: Color.fromRGBO(54, 54, 54, 1),
          ),
          LabelValueColumn(
            label: 'confirmed',
            value: data["confirmed"],
          ),
          Divider(
            thickness: 2.0,
            color: Color.fromRGBO(47, 47, 47, 1),
          ),
          LabelValueColumn(
            label: 'active',
            value: data["active"],
            valueColor: Color(0xFFFFD873),
          ),
          Divider(
            thickness: 2.0,
            color: Color.fromRGBO(47, 47, 47, 1),
          ),
          LabelValueColumn(
            label: 'deaths',
            value: data["deaths"],
            valueColor: Color(0xFFE76262),
          ),
          Divider(
            thickness: 2.0,
            color: Color.fromRGBO(47, 47, 47, 1),
          ),
          LabelValueColumn(
            label: 'recovered',
            value: data["recovered"],
            valueColor: Color(0xFF58FF91),
          ),
          Divider(
            thickness: 2.0,
            color: Color.fromRGBO(54, 54, 54, 1),
          ),
        ],
      ),
    );
  }
}
