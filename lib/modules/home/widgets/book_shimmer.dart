import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BookShimmer extends StatelessWidget {
  const BookShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.23,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding:
        const EdgeInsets.symmetric(vertical: 10),
        itemCount: 7,
        itemBuilder:
            (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: Get.theme.canvasColor,
            highlightColor: Colors.grey[400]!,
            child: Container(
              margin:
              const EdgeInsets.only(right: 10),
              width: Get.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius:
                BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.black26, width: 1),
              ),
            ),
          );
        },
      ),
    );
  }
}
