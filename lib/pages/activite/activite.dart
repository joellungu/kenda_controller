import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Activite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: SizedBox(
              height: Get.size.height / 3.5,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.airline_seat_recline_extra_rounded,
                        size: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Place assises ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: SizedBox(
              height: Get.size.height / 3.5,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.qr_code_scanner_sharp,
                        size: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Scanner le billet ",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
