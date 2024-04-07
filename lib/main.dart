import 'package:fei_bookstore/modules/navbar/navbar_binding.dart';
import 'package:fei_bookstore/routes/app_pages.dart';
import 'package:fei_bookstore/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fei Bookstore',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: appPages,
      initialRoute: RouteName.navbar,
      initialBinding: NavbarBinding(),
    );
  }
}
