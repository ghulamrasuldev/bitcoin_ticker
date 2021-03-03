import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/Utilities/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String defaultValue = 'PKR';
  // ignore: non_constant_identifier_names

  List<DropdownMenuItem<String>> getPaperCurrency() {
    List<DropdownMenuItem<String>> PaperCurrencies = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currencyName = currenciesList[i];
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        child: Text(currencyName),
        value: currencyName,
      );
      PaperCurrencies.add(newItem);
    }
    return PaperCurrencies;
  }

  @override
  Widget build(BuildContext context) {
    getPaperCurrency();
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
            child: Card(
              color: Colors.blue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 200.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              autofocus: true,
              focusColor: Colors.blue,
              dropdownColor: Colors.lightBlue.shade300,
              value: defaultValue,
              items: getPaperCurrency(),
              style: Theme.of(context).textTheme.title,
              onChanged: (value) {
                defaultValue = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
