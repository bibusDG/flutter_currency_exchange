import 'package:currency_exchange/controllers/button_controller.dart';
import 'package:currency_exchange/controllers/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:currency_exchange/models/inner_button.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currencyController = Get.find<HomeController>();



    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 400,
                  // color: Colors.red,
                  child: Obx(()=>
                    Column(
                      children: [
                        Text('1 ${currencyController.destinationCurrencyName.value}', style: TextStyle(
                          fontFamily: 'Amatic',
                          fontSize: 35.0,
                        ),),
                        Text('=', style: TextStyle(
                          fontFamily: 'Amatic',
                          fontSize: 45.0,
                        ),),
                        Text('${currencyController.currencyValue.value} ${currencyController.homeCurrencyName.value}',
                            style:TextStyle(
                              fontSize: 35.0,
                              fontFamily: 'Amatic',
                            ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(width: 200, height:200,
                            child: ElevatedButton(onPressed: (){
                              Get.toNamed('/calculationPage');
                            },
                              style: ElevatedButton.styleFrom
                                (shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),primary: Colors.teal,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('calculate', style: TextStyle(
                                    fontFamily: 'Amatic',
                                    fontSize: 30.0,
                                  ),),
                                  Text('shop', style: TextStyle(
                                    fontFamily: 'Amatic',
                                    fontSize: 30.0,
                                  ),),
                                  Text('price',style: TextStyle(
                                    fontFamily: 'Amatic',
                                    fontSize: 30.0,
                                  ),),
                                ],
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                FloatingActionButton.extended(
                  onPressed: () {
                    Get.toNamed('/');
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
