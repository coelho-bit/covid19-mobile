import 'package:covid19/screens/countries.dart';
import 'package:covid19/screens/home.dart';
import 'package:covid19/screens/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/countries': (context) => Countries(),
  }
));

