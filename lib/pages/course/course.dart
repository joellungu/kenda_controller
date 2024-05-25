import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/activite/detail_ticket.dart';

import 'course_controller.dart';

class Course extends GetView<CourseController> {
  //
  Course() {
    controller.course();
  }

  //
  String motRecherche = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              // child: TextField(
              //   onChanged: (t) {
              //     motRecherche = t;
              //   },
              //   onSubmitted: (phone) async {
              //     var box = GetStorage();
              //     Map a = box.read("agent") ?? {};
              //     controller.recherche("37", "243$phone");
              //     //${a['idPartenaire']}
              //   },
              //   textInputAction: TextInputAction.search,
              //   decoration: InputDecoration(
              //     hintText: "Numéro téléphone",
              //     prefixText: "243 ",
              //     suffixIcon: const Icon(Icons.search),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(15),
              //       borderSide: const BorderSide(color: Colors.black, width: 1),
              //     ),
              //   ),
              // ),
            ),
            Expanded(
              flex: 1,
              child: controller.obx(
                (state) {
                  //
                  List liste = state!;
                  //
                  return ListView(
                    children: List.generate(liste.length, (index) {
                      Map e = liste[index];
                      //
                      if (e["status"] == 2) {
                        return Container();
                      } else {
                        return SizedBox(
                          height: 255,
                          //color: Colors.grey.shade300,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Card(
                                    //color: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                      onTap: () {
                                        //
                                        var box = GetStorage();
                                        Map a = box.read('agent') ?? {};
                                        //
                                        if (e["status"] == 1) {
                                          Get.to(
                                            TicketDetails(
                                              "${a["idPartenaire"]}",
                                              "${e['unique_code']}",
                                              2,
                                            ),
                                          );
                                        } else {
                                          Get.dialog(Material(
                                            color: Colors.transparent,
                                            child: Center(
                                              child: Container(
                                                height: 50,
                                                width: 250,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  "Ce ticket n'a pas encore été scanné !",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ));
                                        }

                                        //
                                      },
                                      child: SizedBox(
                                        //color: index.isOdd ? Colors.white : Colors.black12,
                                        height: 250.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      " ${e['itinerance']}",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "${e['reference']}",
                                                      style: TextStyle(
                                                        fontSize: 20,
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
                                              flex: 3,
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
                                                        color: Colors
                                                            .grey.shade800,
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
                                                    alignment:
                                                        Alignment.topCenter,
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
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        Text(
                                                          " ${e['emplacement']} ",
                                                          style:
                                                              const TextStyle(
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
                      }
                    }),
                  );
                },
                onEmpty: Center(
                  child: SizedBox(
                    child: Text(
                      "Voyagez tranquille",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                onLoading: const Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
          controller.course();
        },
        child: const Icon(Icons.recycling_outlined),
      ),
    );
  }
}
