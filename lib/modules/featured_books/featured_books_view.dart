import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/colors.dart';
import '../../routes/route_name.dart';
import 'featured_books_controller.dart';

class FeaturedBooksView extends GetView<FeaturedBooksController> {
  const FeaturedBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Books'),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Get.back();
          },
        ),
        actions: [
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
      body: Obx(
        () => controller.featuredBooks.isEmpty
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
            : SingleChildScrollView(
                child: Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 25,
                    ),
                    itemCount: controller.featuredBooks.length,
                    itemBuilder: (context, index) {
                      final book = controller.featuredBooks[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.singleBook,
                              arguments: book.isbn13);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(book.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  book.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  book.price,
                                  style: TextStyle(
                                    color: softPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
