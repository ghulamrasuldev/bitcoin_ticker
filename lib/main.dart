import 'package:bitcoin_ticker/Screens/PriceScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(

    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PriceScreen(),
    ),
  );
}
