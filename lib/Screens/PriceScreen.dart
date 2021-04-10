import 'dart:io' show Platform;

import 'package:bitcoin_ticker/Services/GetPrice.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/Utilities/coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String bitCoinPrice = '?';
  String etheriumPrice = '?';
  String liteCoinPrice = '?';
  // ignore: non_constant_identifier_names

  //Android Drop Down Menu
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) async{
        await getprice('BTC',value);
        await getprice('ETH',value);
        await getprice('LTC',value);
        print(bitCoinPrice);
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  //iOS Cupertino Picker
  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async{
        await getprice('BTC',currenciesList[selectedIndex]);
        await getprice('ETH',currenciesList[selectedIndex]);
        await getprice('LTC',currenciesList[selectedIndex]);
        setState((){
          selectedCurrency = currenciesList[selectedIndex];
        });
      },
      children: pickerItems,
    );
  }

  //Selecting respective widget depending upon the Platform
  Widget getPicker() {
    if (Platform.isAndroid) {
      return androidDropdown();
    } else {
      return iOSPicker();
    }
  }

  //Getting Prices against set values
  getprice(String crypto, String Currency) async{
    var priceData = await GetPrice().getPrice(currency: Currency, crypto: crypto);
    if(crypto == 'BTC'){
      bitCoinPrice = '${priceData['rate'].round()}';
      print(bitCoinPrice);
    }
    else if(crypto== 'ETH'){
      etheriumPrice = '${priceData['rate'].round()}';
      print(etheriumPrice);
    }
    else if(crypto == 'LTC'){
      liteCoinPrice = '${priceData['rate'].round()}';
      print(liteCoinPrice);

    }

  }


  //Overriding build method
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("🤑 Bitcoin Ticker"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.blue,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ${bitCoinPrice} ${selectedCurrency}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.blue,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = ${etheriumPrice} ${selectedCurrency}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.blue,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = ${liteCoinPrice} ${selectedCurrency}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
