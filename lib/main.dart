import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/widgets/averageCalculate_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Dinamik Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Constants.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: AverageCalculate(),
    );
  }
}
