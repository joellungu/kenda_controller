import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kenda_agent/pages/vendeur/reservations/reservation_controller.dart';
// import 'package:kenda/pages/reservations/infos_supp/infos_supplementaire.dart';
// import 'package:kenda/pages/reservations/reservation_controller.dart';
// import 'package:kenda/widgets/achat.dart';
import 'package:uuid/uuid.dart';
import 'paiement_controller.dart';

class Paiement extends StatefulWidget {
  //
  Map e;
  DateTime? date;
  Paiement(this.e, this.date) {
    Map x = e;
    x["chauffeur"] = "";
    x["embarqueur"] = "";
    x["bus"] = "";
    print(x);
  }
  //
  @override
  State<StatefulWidget> createState() {
    return _Paiement();
  }
}

class _Paiement extends State<Paiement> {
  //
  var box = GetStorage();
  //
  RxString choix = "CDF".obs;
  RxString CDF = "CDF".obs;
  RxString USD = "USD".obs;
  //
  ReservationController reservationController = Get.find();
  //
  PaiementController paiementController = Get.find();
  //
  TextEditingController numero = TextEditingController();
  //
  Timer? t;
  //
  @override
  void dispose() {
    //
    super.dispose();
    if (t != null) {
      t!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Achata du billet",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.indigo.shade900,
            leading: IconButton(
              onPressed: () {
                //
                Get.back();
                //
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          //backgroundColor: Colors.indigo.shade900,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(children: [
                  Container(
                    height: Get.size.height / 13,
                    color: Colors.indigo.shade100,
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          color: Colors.indigoAccent.shade400,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Payez avec tous les réseaux en RDC et en toute sécurité.",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          // child: TextField(
                          //   autofocus: true,
                          //   controller: numero,
                          //   keyboardType: TextInputType.number,
                          //   style: const TextStyle(
                          //     fontSize: 25,
                          //     color: Colors.white70,
                          //   ),
                          //   decoration: InputDecoration(
                          //     fillColor: Colors.indigo.shade900,
                          //     filled: true,
                          //     prefix: const Text(
                          //       "+243  ",
                          //       style: TextStyle(
                          //         color: Colors.white70,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 25,
                          //       ),
                          //     ),
                          //     suffixIcon: const Icon(
                          //       Icons.phone_android_outlined,
                          //       color: Colors.white70,
                          //     ),
                          //     border: const OutlineInputBorder(
                          //       borderSide: BorderSide(),
                          //     ),
                          //   ),
                          // ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 20,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children: [
                        //       Expanded(
                        //         flex: 5,
                        //         child: Obx(
                        //           () => RadioListTile(
                        //             activeColor: Colors.indigo,
                        //             title: Text(
                        //               CDF.value,
                        //               style: TextStyle(
                        //                 color: Colors.black,
                        //               ),
                        //             ),
                        //             value: "CDF",
                        //             groupValue: choix.value,
                        //             onChanged: (e) {
                        //               choix.value = e as String;
                        //             },
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         flex: 5,
                        //         child: Obx(
                        //           () => RadioListTile(
                        //             activeColor: Colors.indigo,
                        //             title: Text(
                        //               USD.value,
                        //               style: TextStyle(
                        //                 color: Colors.black,
                        //               ),
                        //             ),
                        //             value: "USD",
                        //             groupValue: choix.value,
                        //             onChanged: (e) {
                        //               choix.value = e as String;
                        //             },
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        getDetails("${widget.e['idPartenaire']}"),
                      ],
                    ),
                  ),
                ]),
              ),
              //////////
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        //color: Colors.grey,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: RichText(
                          text: TextSpan(
                            text: "Prix total\n",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "${widget.e['prix'] * reservationController.places.length} Fc",
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () async {
                          //
                          DateTime dateTime = DateTime.now();
                          String d =
                              "${dateTime.day}-${dateTime.month}-${dateTime.year}";
                          //
                          print("Salut comment ?");
                          /**
                             * 
                                 Long idPartenaire;
                                 Long idTronson;
                                //
                                 int nombrepDePlace;
                                //Arret Arriver//
                                 String itinerance;
                                 String datePaiement;

                                 String emplacement;
                                 Boolean consomer;
                                 double prix;
                                 String devise;
                                //
                                 String codePostal;
                                 String phone;
                                 int codeRecuperation;
                                 String dateDepart;
                                 String heureDepart;
                             */
                          //String parametres =
                          //  "12-12-2023,15:00,+243,815381693,80500,CDF,kinshasa,kilongo,2,12-13,12345,false";
                          //
                          if (true) {
                            //numero.text.length == 9
                            print("le numéro:" "243" + numero.text);
                            //
                            PaiementController paiementController = Get.find();
                            //
                            Get.dialog(
                              const Material(
                                color: Colors.transparent,
                                child: Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            );
                            var ref = getReference();
                            DateTime d = DateTime.now();
                            /***/
                            Map e = {
                              "merchant": "JOSBARK",
                              "status": 0,
                              "date": "${d.day}/${d.month}/${d.year}",
                              "phone": "243${numero.text}",
                              "amount": widget.e['prix'] *
                                  reservationController.places.length,
                              "currency": "CDF",
                              "reference": ref,
                              "callbackurl": "www.google.com",
                            };
                            //////////////Le ticket
                            /**
                             * Le contenu non pas le contenant...
                             */
                            List le = [];
                            for (int i = 0;
                                i < reservationController.places.length;
                                i++) {
                              //
                              Map agent = box.read("agent");
                              //
                              le.add({
                                "idCourse": "${widget.e['id']}",
                                "itinerance": "${widget.e['troncons']}",
                                //"idAgent": "",
                                "idAgentVendeur": agent['id'],
                                "datePaiement": "${d.day}-${d.month}-${d.year}",
                                "emplacement": reservationController.places[i]
                                    ["emplacement"],
                                "status": 0,
                                "prix": widget.e['prix'],
                                "devise": "CDF",
                                "phone": "243${numero.text}",
                                "reference": "${widget.e['reference']}",
                                "ref": ref,
                                "unique_code": getReference(),
                                "idBoutique": "${widget.e['idPartenaire']}",
                                "dateDepart":
                                    "${widget.date?.day}-${widget.date?.month}-${widget.date?.year}",
                                "heureDepart": "${widget.e['heureDepart']}",
                                "infoPersonnel":
                                    reservationController.places[i],
                              });
                            }
                            // reservationController.places.forEach((element) {

                            // });

                            //Je fais le test ici ...
                            print(le);
                            send(le);
                            //////////////
                            // print('element: $e');
                            // Map m = await paiementController.paiement(e);
                            // print("la reponse du serveur: $m");
                            // if (m['code'] != null) {
                            //   //La fonction bloucle...
                            //   //Get.back();

                            //   //widget.f(widget.requette);

                            //   Timer(Duration(seconds: 5), () async {
                            //     //

                            //     t = Timer.periodic(const Duration(seconds: 5),
                            //         (timer) async {
                            //       int w = 0;
                            //       print("Je suis run cool $w");
                            //       w++;
                            //       var rep = await paiementController
                            //           .verification(m['orderNumber']);
                            //       print("La vérification: $rep");
                            //       //
                            //       if (rep['status'] == null ||
                            //           rep['status'] == null) {
                            //         if (rep['code'] == 0 ||
                            //             rep['code'] == "0") {
                            //           //USSD bien envoyé
                            //           if (rep['transaction']['status'] == "1" ||
                            //               rep['transaction']['status'] == 1) {
                            //             //Paiement non éffectué
                            //             //
                            //             //widget.f(widget.requette);
                            //             //
                            //             //print(widget.requette);
                            //             //
                            //             t!.cancel();
                            //             Get.back();
                            //             Get.snackbar(
                            //               "Notification",
                            //               "Le paiement n'a pas reussi",
                            //               backgroundColor: Colors.blue,
                            //               colorText: Colors.white,
                            //             );
                            //             //
                            //             //widget.f(widget.requette);
                            //             //
                            //           } else if (rep['transaction']['status'] ==
                            //                   "2" ||
                            //               rep['transaction']['status'] == 2) {
                            //             print("Paiement en attente");
                            //           } else if (rep['transaction']['status'] ==
                            //                   "3" ||
                            //               rep['transaction']['status'] == 3) {
                            //             t!.cancel();
                            //             Get.back();
                            //             Get.snackbar(
                            //               "Notification",
                            //               "Pas de paiement effectué",
                            //               backgroundColor: Colors.blue,
                            //               colorText: Colors.white,
                            //             );
                            //           } else {
                            //             t!.cancel();
                            //             Get.back();
                            //             //var r = widget.requette;
                            //             //r["reference"] = rep['transaction']['reference'];
                            //             print(
                            //                 "--------------------------------------------");
                            //             print("$rep"); //${e['nom']}
                            //             send(le);
                            //           }
                            //         } else {
                            //           //USSD non envoyé
                            //           t!.cancel();
                            //           Get.back();
                            //           Get.back();
                            //           Get.snackbar(
                            //             "Notification",
                            //             rep['message'] ??
                            //                 "Erreur lors du paiement code d'erreur 1",
                            //             backgroundColor: Colors.blue,
                            //             colorText: Colors.white,
                            //           );
                            //         }
                            //       } else {
                            //         print("pass");
                            //       }
                            //     });
                            //   });
                            // } else {
                            //   //
                            //   Get.back();
                            //   Get.snackbar(
                            //     "Erreur",
                            //     m['message'] ?? "Vide",
                            //     backgroundColor: Colors.blue,
                            //     colorText: Colors.white,
                            //   );
                            //   //
                            // }

                            /*
              showDialog(
                  context: context,
                  builder: (c) {
                    return Material(
                      color: Colors.transparent,
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(),
                              ),
                              Text(
                                "Votre requette est en cours d'execution",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    );
                  });
                  */
                            /*
                    String nomecole = ecole.value;
                    String codeoption = "${listeOptions[option]}".split(",")[1];
                    String anneescolaire = annee.value;
                    //
                    print("1 = $nomecole");
                    print("2 = $codeoption");
                    print("3 = $anneescolaire");
                    Get.to(
                      ListPalmares(
                          nomecole: nomecole,
                          codeoption: codeoption,
                          anneescolaire: anneescolaire),
                    );
                  
                    */
                          } else {
                            Get.snackbar("Erreur", "Le numéro est incorrecte");
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          color: Colors.green.shade800,
                          alignment: Alignment.center,
                          child: const Text(
                            "Acheter",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDetails(String idPartenaire) {
    return FutureBuilder(
        future: paiementController.getCompanie(idPartenaire),
        builder: (c, t) {
          if (t.hasData) {
            Map d = t.data as Map;
            return Text.rich(
              TextSpan(
                text:
                    'Paiemant de ${reservationController.places.length} billets de la compagnie ',
                style: TextStyle(
                  fontSize: 25,
                ),
                children: [
                  TextSpan(
                    text: "${d['nom']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            );
          } else if (t.hasError) {
            return Container();
          }
          return Container();
        });
  }

  //
  send(List le) async {
    //
    paiementController.achatTicket(le);
  }

  //
  String getReference() {
    var uuid = Uuid();
    return "${uuid.v4()}";
  }
}
