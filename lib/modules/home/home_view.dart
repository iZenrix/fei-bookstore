import 'package:fei_bookstore/core/values/colors.dart';
import 'package:fei_bookstore/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(Icons.menu),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: softPurple,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(99),
                            bottomLeft: Radius.circular(99),
                          ),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 10),
                            Icon(Icons.shopping_bag, color: Colors.white),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.05, vertical: 10),
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              alignment: Alignment.bottomLeft,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                child: Text(
                                  "Website Development",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width * 0.8,
                              height: Get.height * 0.13,
                              decoration: BoxDecoration(
                                color: softBrown,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              child: Center(
                                child: Image.asset(
                                  "assets/images/home/computer_icon.png",
                                  width: 130,
                                  height: 130,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              alignment: Alignment.bottomLeft,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 7),
                                child: Text(
                                  "Mobile Development",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width * 0.8,
                              height: Get.height * 0.13,
                              decoration: BoxDecoration(
                                color: softRed,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              child: Center(
                                child: Image.asset(
                                  "assets/images/home/mobile_icon.png",
                                  width: 130,
                                  height: 130,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recommended for you",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.23,
                        width: Get.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black26, width: 1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width * 0.35,
                                    height: Get.height * 0.16,
                                    decoration: BoxDecoration(
                                      color: beige,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/home/mobile_icon.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                    child: Text(
                                      "Membasuh",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black26, width: 1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width * 0.35,
                                    height: Get.height * 0.16,
                                    decoration: BoxDecoration(
                                      color: softPurple,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/home/mobile_icon.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                    child: Text(
                                      "Evakuasi",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "New Books",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.23,
                        width: Get.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black26, width: 1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width * 0.35,
                                    height: Get.height * 0.16,
                                    decoration: BoxDecoration(
                                      color: softRed,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/home/mobile_icon.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                    child: Text(
                                      "Nabi Palsu",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black26, width: 1),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width * 0.35,
                                    height: Get.height * 0.16,
                                    decoration: BoxDecoration(
                                      color: softBrown,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/home/mobile_icon.png",
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                                    child: Text(
                                      "Iya, sebentar",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
