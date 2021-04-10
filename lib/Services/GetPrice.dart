import 'package:bitcoin_ticker/Services/NetworkHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetPrice{
  final apikey= '8479B908-9808-4F4D-8784-374DDD3C9763';
  final  coinApiURL = 'https://rest.coinapi.io/v1/exchangerate/';

  void getPrice ({String crypto, String currency}) async{
    //made complete url using coinApiURL, apikey, crypto currency and paper currency
    var completeURL = '${coinApiURL}${crypto}/${currency}?apikey=${apikey}';
    NetworkHelper networkHelper = NetworkHelper(completeURL);
    var priceData = await networkHelper.getData();
    print(priceData);
    return priceData;
  }


}

//BTC/usd?apikey=8479B908-9808-4F4D-8784-374DDD3C9763