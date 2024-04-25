import 'package:fei_bookstore/core/values/colors.dart';
import 'package:fei_bookstore/modules/home/home_controller.dart';
import 'package:fei_bookstore/modules/home/widgets/featured_book_builder.dart';
import 'package:fei_bookstore/modules/home/widgets/list_book_builder.dart';
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
                // SizedBox(
                //   height: Get.height * 0.2,
                //   width: Get.width,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     padding: EdgeInsets.symmetric(
                //         horizontal: Get.width * 0.05, vertical: 10),
                //     children: [
                //       Container(
                //         margin: const EdgeInsets.only(right: 10),
                //         child: Stack(
                //           children: [
                //             Container(
                //               width: Get.width * 0.8,
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(15),
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.withOpacity(0.5),
                //                     blurRadius: 2,
                //                   ),
                //                 ],
                //               ),
                //               alignment: Alignment.bottomLeft,
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(
                //                     horizontal: 15, vertical: 7),
                //                 child: Text(
                //                   "Website Development",
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.w500,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               width: Get.width * 0.8,
                //               height: Get.height * 0.13,
                //               decoration: BoxDecoration(
                //                 color: softBrown,
                //                 borderRadius: BorderRadius.circular(15),
                //               ),
                //             ),
                //             Positioned(
                //               right: 10,
                //               child: Center(
                //                 child: Image.asset(
                //                   "assets/images/home/computer_icon.png",
                //                   width: 130,
                //                   height: 130,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         margin: const EdgeInsets.only(right: 10),
                //         child: Stack(
                //           children: [
                //             Container(
                //               width: Get.width * 0.8,
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(15),
                //                 boxShadow: [
                //                   BoxShadow(
                //                     color: Colors.grey.withOpacity(0.5),
                //                     blurRadius: 2,
                //                   ),
                //                 ],
                //               ),
                //               alignment: Alignment.bottomLeft,
                //               child: const Padding(
                //                 padding: EdgeInsets.symmetric(
                //                     horizontal: 15, vertical: 7),
                //                 child: Text(
                //                   "Mobile Development",
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.w500,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             Container(
                //               width: Get.width * 0.8,
                //               height: Get.height * 0.13,
                //               decoration: BoxDecoration(
                //                 color: softRed,
                //                 borderRadius: BorderRadius.circular(15),
                //               ),
                //             ),
                //             Positioned(
                //               right: 10,
                //               child: Center(
                //                 child: Image.asset(
                //                   "assets/images/home/mobile_icon.png",
                //                   width: 130,
                //                   height: 130,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                FeaturedBookBuilder(),
                ListBookBuilder("Recommended for you", controller.recommendedBooks),
                ListBookBuilder("New Books", controller.newBooks),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
