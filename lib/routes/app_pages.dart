import 'package:fei_bookstore/modules/home/home_view.dart';
import 'package:fei_bookstore/routes/route_name.dart';
import 'package:get/get.dart';
import '../modules/home/home_binding.dart';

var appPages = [
  GetPage(
    name: RouteName.homeView,
    page: () => const HomeView(),
    binding: HomeBinding(),
  )
];
