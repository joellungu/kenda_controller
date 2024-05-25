import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/activite/detail_ticket.dart';

import 'detail_ticket.dart';
import 'historique_controller.dart';

// class Resultat extends GetView<ResultatController> {
//   @override
//   State<StatefulWidget> createState() {
//     return _Resultat();
//   }
// }

class Historique extends GetView<HistoriqueController> {
  //
  var box = GetStorage();
  //
  //List historiques = [];
  //
  Historique() {
    Map agent = box.read("agent");
    //
    DateTime d = DateTime.now();
    //
    controller.touteReservation(
        "${agent['id']}", "${d.day}-${d.month}-${d.year}");
    //"idAgentVendeur": agent['id'],
    //"datePaiement": "${d.day}/${d.month}/${d.year}",
    // List l = box.read("tickets") ?? [];
    // l.forEach((element) {
    //   //
    //   List x = element;
    //   x.forEach((j) {
    //     print("jojo: $j");
    //     historiques.add(j);
    //   });
    // });
    //print(l[0]);
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Text(
          "Reservation",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: <Widget>[
          Card(
            elevation: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    CupertinoIcons.tickets,
                    size: 30,
                    color: Colors.black,
                  ),
                  Text(" Tickets")
                ],
              ),
            ),
          ),
          controller.obx(
            (state) {
              List historiques = state!;
              return Expanded(
                child: ListView(
                  children: List.generate(historiques.length, (index) {
                    //
                    Map e = historiques[index];
                    //
                    return Container(
                      height: 255,
                      //color: Colors.grey.shade300,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Card(
                                //color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () {
                                    //
                                    Get.to(TicketDetails2(e));
                                    //
                                  },
                                  child: SizedBox(
                                    //color: index.isOdd ? Colors.white : Colors.black12,
                                    height: 270.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  " ${e['itinerance']}",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Date ${e['dateDepart']} ",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey.shade300,
                                          height: 1,
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Réf",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${e['reference']}",
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey.shade300,
                                          height: 1,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              bottom: 5,
                                            ),
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Heure de départ ${e['heureDepart']}",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                // Row(
                                                //   children: [
                                                //     const Text(
                                                //       "Info trajet ",
                                                //       style: TextStyle(
                                                //         fontWeight: FontWeight.w500,
                                                //       ),
                                                //     ),
                                                //     Icon(
                                                //       Icons.arrow_forward_ios,
                                                //       size: 13,
                                                //       color: Colors.grey.shade800,
                                                //     )
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          color: Colors.grey.shade300,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                  top: 13,
                                                ),
                                                alignment: Alignment.topCenter,
                                                //color: Colors.blue,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    const Text(
                                                      " Place N° ",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    Text(
                                                      " ${e['emplacement']} ",
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  //childCount: historiques.length,
                ),
              );
            },
            onError: (error) {
              return Container();
            },
            onEmpty: Container(),
            onLoading: Center(
              child: Container(
                height: 40,
                width: 40,
                child: const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
