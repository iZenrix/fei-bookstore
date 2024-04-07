import 'package:fei_bookstore/core/values/colors.dart';
import 'package:fei_bookstore/modules/single_book/single_book_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../routes/route_name.dart';
import '../home/home_view.dart';

class NavbarController extends GetxController{

  PersistentTabController navbarController = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const HomeView(),
      const SingleBookView(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: softBrown,
        activeColorSecondary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: RouteName.homeView,
          routes: {
            RouteName.homeView: (context) => const HomeView(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart),
        title: ("Liked"),
        activeColorPrimary: softBrown,
        activeColorSecondary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}