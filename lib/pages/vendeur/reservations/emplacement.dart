import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/widgets/buss.dart';
// import 'package:kenda/pages/reservations/paiement/paiement.dart';
// import 'package:kenda/widgets/buss.dart';

import 'paiement/paiement.dart';
import 'reservation_controller.dart';

class Emplacement extends StatefulWidget {
  List? l;
  Map? e;
  DateTime? date;

  String? depart;
  String? arrive;
  //
  Emplacement(this.depart, this.arrive, {super.key, this.l, this.e, this.date});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Emplacement();
  }
}

class _Emplacement extends State<Emplacement> {
  ReservationController reservationController = Get.find();

  @override
  void dispose() {
    //
    super.dispose();
    //
    reservationController.places.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  //
                  Get.back();
                  //
                },
                icon: const Icon(
                  Icons.close,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Obx(
                () => RichText(
                  text: TextSpan(
                    text: "Emplacement dans le bus\n",
                    children: [
                      TextSpan(
                        text:
                            "${widget.e!['bus']['capacite'] - widget.l!.length - reservationController.places.length} Places selectionnables",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              //                           Text(
              //   "Info trajet",
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ),
              // ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Buss(widget.l!, widget.e!),
          ),
        ),
        const SizedBox(
          height: 0,
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: InkWell(
            onTap: () {
              if (reservationController.places.isEmpty) {
                Get.snackbar("Attention",
                    "Veuillez selectionner une ou plusieurs places.",
                    colorText: Colors.white, backgroundColor: Colors.indigo);
              } else {
                Get.to(Paiement(
                    widget.e!, widget.date, widget.depart!, widget.arrive!));
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 2,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 50,
                padding: const EdgeInsets.only(
                  //left: 20,
                  //right: 20,
                  bottom: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: BorderRadius.circular(10),
                  // gradient: LinearGradient(
                  //   begin: Alignment.centerLeft,
                  //   end: Alignment.centerRight,
                  //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                  // ),
                ),
                child: Text(
                  "Continuer".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
