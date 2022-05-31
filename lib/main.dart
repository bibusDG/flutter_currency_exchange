import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/home_page.dart';
import 'views/detail_page.dart';
import 'views/calculation_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/', page: ()=>HomePage()),
        GetPage(name: '/detailPage', page: ()=>DetailPage()),
        GetPage(name: '/calculationPage', page: ()=>CalculationPage()),
      ],
    );
  }
}
