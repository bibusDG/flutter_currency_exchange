import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';


class HomeController extends GetxController{

  var homeCountry = 'Your Country'.obs;
  var destinationCountry = 'Destination'.obs;
  var checkButtonVisibility = false.obs;

  var homeCountryCurrencyName = ''.obs;
  var destinationCountryCurrencyName = ''.obs;

  var homeCurrencyName = ''.obs;
  var destinationCurrencyName = ''.obs;

  var currencyValue = ''.obs;

  void buttonVisibility(){
    if(homeCountry.value != 'Your Country' && destinationCountry.value != 'Destination') {
      checkButtonVisibility.value = true;
    }
  }


  Future<void> currencyRatio() async {
    var apiEndPoint = 'https://freecurrencyapi.net/api/v2/latest?apikey=a897bcc0-947e-11ec-88ff-ef8e9477feef&base_currency=$destinationCountryCurrencyName';
    final Uri url = Uri.parse(apiEndPoint);
    var response = await get(url);
    Map data = jsonDecode(response.body);
    currencyValue.value = data['data'][homeCountryCurrencyName].toString();

  }

  Future<void> currencyName() async {
    var apiEndPoint = 'https://api.currencyapi.com/v3/currencies?apikey=a897bcc0-947e-11ec-88ff-ef8e9477feef';
    final Uri url = Uri.parse(apiEndPoint);
    var response = await get(url);
    Map data = jsonDecode(response.body);
    var currencyNameHome = data['data'][homeCountryCurrencyName]['name'].toString().split(' ').last;
    var currencyNameDestiny = data['data'][destinationCountryCurrencyName]['name'].toString().split(' ').last;
    homeCurrencyName.value = currencyNameHome;
    destinationCurrencyName.value = currencyNameDestiny;

  }
}
