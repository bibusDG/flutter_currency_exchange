import 'package:currency_exchange/controllers/home_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:currency_exchange/countries_shortcuts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return SafeArea(
        child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                'CHOOSE CURRENCIES',
                style: TextStyle(
                  fontSize: 65.0,
                  fontFamily: 'Amatic',
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              child: Column(
                children: [
                  Obx(() => MainButtons(
                        dialogText: 'Choose Your Country',
                        buttonText: homeController.homeCountry.value,
                      )),
                  SizedBox(height: 30.0),
                  Obx(() => MainButtons(
                      dialogText: 'Choose Destination', buttonText: homeController.destinationCountry.value)),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            Obx(
              () => Visibility(
                visible: homeController.checkButtonVisibility.value,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    homeController.currencyName();
                    homeController.currencyRatio();
                    Get.toNamed('/detailPage');
                  },
                  backgroundColor: Colors.green,
                  label: Text(
                    'Go Next',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Amatic',
                    ),
                  ),
                  icon: Icon(Icons.check),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class MainButtons extends StatelessWidget {
  const MainButtons({
    required this.buttonText,
    required this.dialogText,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final String dialogText;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        elevation: 10,
        minimumSize: Size(300, 100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: () {
        Get.defaultDialog(
            titleStyle: TextStyle(fontFamily: 'Amatic', fontSize: 30.0),
            title: dialogText,
            backgroundColor: Colors.blue,
            content: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.white),
              width: 300,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                        pickerTextStyle: TextStyle(color: Colors.black, fontFamily: 'Amatic', fontSize: 25.0)),
                  ),
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    magnification: 1.2,
                    itemExtent: 30,
                    scrollController: FixedExtentScrollController(initialItem: 1),
                    children: [
                      for (var countryName in countriesShortcut) Text(countryName['country']),
                    ],
                    onSelectedItemChanged: (value) {
                      if (dialogText == 'Choose Your Country') {
                        homeController.homeCountry.value = countriesShortcut[value]['country'].toString();
                        homeController.homeCountryCurrencyName.value = countriesShortcut[value]['currency_code'];
                        // homeController.homeCurrencyName();
                        homeController.buttonVisibility();
                      } else {
                        homeController.destinationCountry.value = countriesShortcut[value]['country'].toString();
                        homeController.destinationCountryCurrencyName.value = countriesShortcut[value]['currency_code'];
                        // homeController.destinationCurrencyName();
                        homeController.buttonVisibility();
                      }
                    },
                  ),
                ),
              ),
            ));
      },
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: 'Amatic',
          fontSize: 40.0,
        ),
      ),
    );
  }
}
