import 'package:fei_bookstore/modules/featured_books/featured_books_binding.dart';
import 'package:fei_bookstore/modules/featured_books/featured_books_view.dart';
import 'package:fei_bookstore/modules/home/home_view.dart';
import 'package:fei_bookstore/modules/navbar/navbar_binding.dart';
import 'package:fei_bookstore/modules/navbar/navbar_view.dart';
import 'package:fei_bookstore/modules/single_book/single_book_binding.dart';
import 'package:fei_bookstore/routes/route_name.dart';
import 'package:get/get.dart';
import '../modules/home/home_binding.dart';
import '../modules/single_book/single_book_view.dart';

var appPages = [
  GetPage(
    name: RouteName.navbar,
    page: () => const NavbarView(),
    bindings: [NavbarBinding(), HomeBinding()],
  ),
  GetPage(
    name: RouteName.homeView,
    page: () => const HomeView(),
  ),
  GetPage(
    name: RouteName.singleBook,
    page: () => const SingleBookView(),
    binding: SingleBookBinding(),
  ),
  GetPage(
    name: RouteName.featuredBooks,
    page: () => const FeaturedBooksView(),
    binding: FeaturedBooksBinding(),
  )
];
