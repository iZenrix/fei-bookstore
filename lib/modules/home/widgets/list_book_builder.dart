import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../../../data/models/books_model.dart';
import '../../../routes/route_name.dart';
import '../home_controller.dart';
import 'book_shimmer.dart';

class ListBookBuilder extends GetView<HomeController> {
  const ListBookBuilder(this.title, this.books, {super.key});

  final String title;
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Obx(
            () => books.isEmpty
                ? const BookShimmer()
                : SizedBox(
                    height: Get.height * 0.29,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: books.length >= 7 ? 7 : books.length,
                      itemBuilder: (BuildContext context, int index) {
                        final book = books[index];

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RouteName.singleBook,
                              arguments: book.isbn13,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: Get.width * 0.35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.black26, width: 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  width: Get.width * 0.35,
                                  height: Get.height * 0.16,
                                  decoration: BoxDecoration(
                                    color:
                                        colors[Random().nextInt(colors.length)],
                                    borderRadius: const BorderRadius.only(
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
                                      horizontal: 8, vertical: 5),
                                  child: Text(
                                    book.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    book.price,
                                    style: TextStyle(
                                      color: softPurple,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
