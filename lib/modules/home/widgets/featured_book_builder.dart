import 'dart:math';

import 'package:fei_bookstore/data/models/featured_book.dart';
import 'package:fei_bookstore/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../home_controller.dart';

class FeaturedBookBuilder extends GetView<HomeController> {
  const FeaturedBookBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.2,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05, vertical: 10),
        itemCount: featuredBooks.length,
        itemBuilder: (BuildContext context, int index) {
          final featuredBook = featuredBooks[index];

          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteName.featuredBooks, arguments: featuredBook.title);
            },
            child: Container(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 7),
                      child: Text(
                        featuredBook.title,
                        style: const TextStyle(
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
                      color: colors[Random().nextInt(colors.length)],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Center(
                      child: Image.asset(
                        featuredBook.image,
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
