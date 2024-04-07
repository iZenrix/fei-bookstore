import 'dart:math';

import 'package:fei_bookstore/core/values/colors.dart';
import 'package:fei_bookstore/modules/home/home_controller.dart';
import 'package:fei_bookstore/modules/home/widgets/book_shimmer.dart';
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
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Recommended For You",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Obx(
                        () => controller.recommendedBooks.isEmpty
                            ? const BookShimmer()
                            : SizedBox(
                                height: Get.height * 0.23,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  itemCount: controller.recommendedBooks.length >= 7
                                      ? 7
                                      : controller.recommendedBooks.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final book = controller.recommendedBooks[index];

                                    return Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: Get.width * 0.35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.black26, width: 1),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: Get.width * 0.35,
                                            height: Get.height * 0.16,
                                            decoration: BoxDecoration(
                                              color: colors[Random()
                                                  .nextInt(colors.length)],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.network(
                                                loadingBuilder: (context, child,
                                                        loadingProgress) =>
                                                    loadingProgress == null
                                                        ? child
                                                        : const CircularProgressIndicator(),
                                                book.image,
                                                width: 150,
                                                height: 150,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 5),
                                            child: Text(
                                              book.title,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
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
                      Obx(
                        () => controller.newBooks.isEmpty
                            ? const BookShimmer()
                            : SizedBox(
                                height: Get.height * 0.23,
                                width: Get.width,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  itemCount: controller.newBooks.length >= 7
                                      ? 7
                                      : controller.newBooks.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final book = controller.newBooks[index];

                                    return Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: Get.width * 0.35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.black26, width: 1),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: Get.width * 0.35,
                                            height: Get.height * 0.16,
                                            decoration: BoxDecoration(
                                              color: colors[Random()
                                                  .nextInt(colors.length)],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                              ),
                                            ),
                                            child: Center(
                                              child: Image.network(
                                                loadingBuilder: (context, child,
                                                        loadingProgress) =>
                                                    loadingProgress == null
                                                        ? child
                                                        : const CircularProgressIndicator(),
                                                book.image,
                                                width: 150,
                                                height: 150,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 5),
                                            child: Text(
                                              book.title,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
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
