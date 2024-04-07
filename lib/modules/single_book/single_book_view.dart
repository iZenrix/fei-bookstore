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
      body: SlidingUpPanel(
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
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.book?.authors ?? "author",
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    controller.book?.title ?? "title",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controller.book!.subtitle != ""
                      ? Text(
                          controller.book?.subtitle ?? "-",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 15),
                  Text(
                    controller.book?.price ?? "price",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  RatingBarIndicator(
                    rating: double.parse(controller.book?.rating ?? "0"),
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
                    controller.book?.desc ?? "description",
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
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 12),
                          ),
                          Text(controller.book?.publisher ?? "publisher"),
                          const SizedBox(height: 10),
                          const Text(
                            "Year",
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 12),
                          ),
                          Text(controller.book?.year ?? "year"),
                          const SizedBox(height: 10),
                          const Text(
                            "Pages",
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 12),
                          ),
                          Text(controller.book?.pages ?? "pages"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Language",
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 12),
                          ),
                          Text(controller.book?.language ?? "language"),
                          const SizedBox(height: 10),
                          const Text(
                            "ISBN10",
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 12),
                          ),
                          Text(controller.book?.isbn10 ?? "isbn10"),
                          const SizedBox(height: 10),
                          const Text(
                            "ISBN13",
                            style:
                            TextStyle(color: Colors.blueGrey, fontSize: 12),
                          ),
                          Text(controller.book?.isbn13 ?? "isbn13"),
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
                  image: NetworkImage(controller.book?.image ?? ""),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(Icons.arrow_back_ios_new),
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
    );
  }
}
