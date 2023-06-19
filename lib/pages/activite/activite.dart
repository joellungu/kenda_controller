import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'detail_ticket.dart';
import 'emplacement.dart';

class Activite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*
          Card(
            child: InkWell(
              onTap: () async {
                //
                var box = GetStorage();
                Map a = box.read('agent') ?? {};
                //
                String code = await FlutterBarcodeScanner.scanBarcode(
                    "red", "Annuler", true, ScanMode.QR);
                //
                Get.to(TicketDetails("${a["idPartenaire"]}", code, 2));
                //
              },
              child: SizedBox(
                height: Get.size.height / 3.5,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4, //airline_seat_recline_extra_rounded
                      child: Container(
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.call_received,
                          size: 100,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Scanner le billet à la sortie",
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
          ),
          */
          Card(
            child: InkWell(
              onTap: () async {
                //
                String code = await FlutterBarcodeScanner.scanBarcode(
                    "red", "Annuler", true, ScanMode.QR);

                //
                var box = GetStorage();
                Map a = box.read('agent') ?? {};
                //
                //agent['idPartenaire']
                //code
                //
                Get.to(TicketDetails("${a["idPartenaire"]}", code, 1));
                //
              },
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
                          Icons.call_made,
                          size: 100,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Scanner le billet à l'entré",
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
          ),
        ],
      ),
    );
  }
}
