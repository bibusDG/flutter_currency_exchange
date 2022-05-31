import 'package:currency_exchange/controllers/calculation_controller.dart';
import 'package:currency_exchange/controllers/home_controllers.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CalculationPage extends StatelessWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currencyController = Get.find<HomeController>();
    final calculationController = Get.put(CalculationController());

    void calculationResult(){
      double calculationResult = double.parse(calculationController.insertedValue.value) * double.parse(currencyController.currencyValue.value);
      calculationController.calculatedValue.value =  calculationResult.toStringAsFixed(2);
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300.0,
                  height: 400.0,
                  child: Column(
                    children: [
                      SizedBox(height: 10.0,),
                      Text('Insert goods price \nto recalculate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        fontSize: 30.0,
                          fontFamily: 'Amatic',

                      ),),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Obx(()=>TextField(
                          onSubmitted: (String value){
                            calculationController.insertedValue.value = value;
                            calculationResult();
                            print(calculationController.calculatedValue.value);
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: OutlineInputBorder(),
                          hintText: 'Insert price in ${currencyController.destinationCurrencyName.value}',)
                          ),
                        ),
                      ),
                      Text('Product price \nin yours currency',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Amatic',

                        ),),
                      SizedBox(height: 10.0,),
                      Obx(()=>Text('${calculationController.calculatedValue.value} ${currencyController.homeCurrencyName.value}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Amatic',

                          ),),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                FloatingActionButton.extended(
                  onPressed: () {
                    Get.toNamed('/detailPage');
                    calculationController.calculatedValue.value = '0';
                  },
                  backgroundColor: Colors.green,
                  label: Text(
                    'go back',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Amatic',
                    ),
                  ),
                  icon: Icon(Icons.check),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

