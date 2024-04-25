import 'package:fei_bookstore/modules/single_book/single_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../core/values/colors.dart';

class SingleBookView extends GetView<SingleBookController> {
  const SingleBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.book.value == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text("Loading..."),
                  ],
                ),
              )
            : SlidingUpPanel(
                minHeight: Get.height * 60 / 100,
                maxHeight: Get.height * 86 / 100,
                borderRadius: BorderRadiusGeometry.lerp(
                  const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                  const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                  1,
                ),
                parallaxEnabled: true,
                parallaxOffset: 0.3,
                panel: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.book.value?.authors ?? "author",
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            controller.book.value?.title ?? "title",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          controller.book.value!.subtitle != ""
                              ? Text(
                                  controller.book.value?.subtitle ?? "-",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey,
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(height: 15),
                          Text(
                            controller.book.value?.price ?? "price",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          RatingBarIndicator(
                            rating: double.parse(
                                controller.book.value?.rating ?? "0"),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(height: 25),
                          const Text("Description",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text(
                            controller.book.value?.desc ?? "description",
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 15),
                          const Text("Detail",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Publisher",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 12),
                                  ),
                                  Text(controller.book.value?.publisher ??
                                      "publisher"),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Year",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 12),
                                  ),
                                  Text(controller.book.value?.year ?? "year"),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Pages",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 12),
                                  ),
                                  Text(controller.book.value?.pages ?? "pages"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Language",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 12),
                                  ),
                                  Text(controller.book.value?.language ??
                                      "language"),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "ISBN10",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 12),
                                  ),
                                  Text(controller.book.value?.isbn10 ??
                                      "isbn10"),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "ISBN13",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 12),
                                  ),
                                  Text(controller.book.value?.isbn13 ??
                                      "isbn13"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                body: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05, vertical: 10),
                      height: Get.height * 0.4,
                      decoration: BoxDecoration(
                        color: softBrown,
                        image: DecorationImage(
                          image:
                              NetworkImage(controller.book.value?.image ?? ""),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: GestureDetector(
                              child: const Icon(Icons.arrow_back_ios_new),
                              onTap: () {
                                Get.back();
                              },
                            ),
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
                  ],
                ),
              ),
      ),
    );
  }
}
