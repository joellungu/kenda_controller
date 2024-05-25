import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/vendeur/recherche/resultat_controller.dart';

class ArretsDetails extends StatefulWidget {
  //int index;
  String nom;
  String id;
  ArretsDetails(this.nom, this.id);
  @override
  State<StatefulWidget> createState() {
    return _ArretsDetails();
  }
}

class _ArretsDetails extends State<ArretsDetails> {
  RxList ll = [].obs; //
  ResultatController resultatController = Get.find();
  //
  List liste = []; //box.read("Itinerance") ?? [];
  getIts() async {
    ll.value = await resultatController.getTronconsRoute(widget.id, widget.nom);
    // liste.forEach((element) {
    //   itineranceController.listeResumer.add(element['nom']);
    // });
  }

  @override
  void initState() {
    //
    getIts();
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Arrets",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade900,
        bottom: PreferredSize(
          preferredSize: Size(100, 35),
          child: Container(
            height: 35,
            color: Colors.indigo.shade100,
            child: Row(
              children: [
                Container(
                  width: 6,
                  color: Colors.indigoAccent.shade400,
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Arrets"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Obx(
            () => Column(
              children: List.generate(
                ll.length,
                (index) {
                  Map e = ll[index];
                  var p = "${e['prix']}".split(".")[0];
                  TextEditingController text =
                      TextEditingController(text: "${e['prix']}");
                  return Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Départ: ${e['adLieu']}",
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Arrivé: ${e['aaLieu']}",
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              //controller: text,

                              enabled: false, //e['active']
                              keyboardType: TextInputType.number,
                              onChanged: (tt) {
                                //
                                setState(() {
                                  e['prix'] = tt;
                                  //text.text = "${e['prix']}";
                                });
                              },
                              decoration: InputDecoration(
                                suffix: const Text("CDF"),
                                hintText: "$p CDF",
                                label: Text("$p CDF"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Expanded(
          //       flex: 4,
          //       child: InkWell(
          //         onTap: () {
          //           Get.dialog(
          //             const Center(
          //               child: SizedBox(
          //                 height: 40,
          //                 width: 40,
          //                 child: CircularProgressIndicator(),
          //               ),
          //             ),
          //           );
          //           //
          //           var box = GetStorage();
          //           List l = [];
          //           Map r = {};
          //           ll.forEach((e) {
          //             if (e['active']) {
          //               l.add(e);
          //             }
          //           });
          //           r["titre"] = "${widget.e['titre']}";
          //           r["liste"] = l;
          //           List listeFinal = box.read("Itinerance") ?? [];
          //           listeFinal.removeAt(widget.index);
          //           listeFinal.add(r);
          //           box.write("Itinerance", listeFinal);
          //           Get.back();
          //           Get.back();
          //           Get.snackbar(
          //             "Effectué",
          //             "Enregistrement éffectué avec succès",
          //             colorText: Colors.white,
          //             snackStyle: SnackStyle.GROUNDED,
          //           );
          //           widget.state.setState(() {});
          //           //
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.only(
          //             top: 5,
          //             left: 0,
          //             right: 0,
          //             bottom: 2,
          //           ),
          //           child: Container(
          //             alignment: Alignment.center,
          //             height: 40,
          //             padding: const EdgeInsets.only(
          //               left: 20,
          //               right: 20,
          //               bottom: 2,
          //             ),
          //             decoration: BoxDecoration(
          //               color: Colors.green.shade900,
          //               borderRadius: BorderRadius.circular(10),
          //               // gradient: LinearGradient(
          //               //   begin: Alignment.centerLeft,
          //               //   end: Alignment.centerRight,
          //               //   colors: <Color>[Colors.yellow.shade700, Colors.black],
          //               // ),
          //             ),
          //             child: Text(
          //               "Modifier".tr,
          //               style: const TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.normal,
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //       flex: 4,
          //       child: InkWell(
          //         onTap: () {
          //           Get.dialog(
          //             const Center(
          //               child: SizedBox(
          //                 height: 40,
          //                 width: 40,
          //                 child: CircularProgressIndicator(),
          //               ),
          //             ),
          //           );
          //           //
          //           var box = GetStorage();
          //           List listeFinal = box.read("Itinerance") ?? [];
          //           listeFinal.removeAt(widget.index);
          //           //listeFinal.add(listeFinal);
          //           box.write("Itinerance", listeFinal);
          //           Get.back();
          //           Get.back();
          //           Get.snackbar(
          //             "Effectué",
          //             "Enregistrement éffectué avec succès",
          //             colorText: Colors.white,
          //             snackStyle: SnackStyle.GROUNDED,
          //           );
          //           widget.state.setState(() {});
          //           //
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.only(
          //             top: 5,
          //             left: 0,
          //             right: 0,
          //             bottom: 2,
          //           ),
          //           child: Container(
          //             alignment: Alignment.center,
          //             height: 40,
          //             padding: const EdgeInsets.only(
          //               left: 20,
          //               right: 20,
          //               bottom: 2,
          //             ),
          //             decoration: BoxDecoration(
          //               color: Colors.red.shade900,
          //               borderRadius: BorderRadius.circular(10),
          //               // gradient: LinearGradient(
          //               //   begin: Alignment.centerLeft,
          //               //   end: Alignment.centerRight,
          //               //   colors: <Color>[Colors.yellow.shade700, Colors.black],
          //               // ),
          //             ),
          //             child: Text(
          //               "Supprimer".tr,
          //               style: const TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.normal,
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
