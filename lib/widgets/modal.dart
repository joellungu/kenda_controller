import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSimpleModal(Widget vue, BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (c) {
      return Container(
        height: Get.size.height / 1.05,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 10,
              child: Container(
                height: 7,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: vue,
            )
          ],
        ),
      );
    },
  );
}
