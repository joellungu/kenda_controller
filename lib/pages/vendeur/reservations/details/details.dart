import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenda_agent/pages/vendeur/reservations/infos_supp/infos_supplementaire.dart';
import 'package:kenda_agent/pages/vendeur/reservations/reservation.dart';
import 'package:kenda_agent/utils/requetes.dart';
import 'package:kenda_agent/widgets/modal.dart';
// import 'package:kenda/pages/recherche/infos.dart';
// import 'package:kenda/pages/reservations/emplacement.dart';
// import 'package:kenda/pages/reservations/formulaire/formulaire.dart';
// import 'package:kenda/pages/reservations/infos_supp/infos_supplementaire.dart';
// import 'package:kenda/pages/reservations/paiement/paiement.dart';
// import 'package:kenda/pages/reservations/reservation.dart';
// import 'package:kenda/utils/requetes.dart';
// import 'package:kenda/widgets/carte_bus.dart';
// import 'package:kenda/widgets/modal.dart';

import 'arretDetails.dart';

class Details extends StatelessWidget {
  Map e;
  String depart;
  String arrive;
  Details(
    this.e,
    this.depart,
    this.arrive,
  ) {
    Map p = e;
    //p['bus'] = "";
    //p['chauffeur'] = "";
    //p['receveur'] = "";
    //p['bus'] = "";

    print(p);
  }
  @override
  Widget build(BuildContext context) {
    int prix = int.parse("${e['prix']}".split(".")[0]);

    return Container(
      color: Colors.indigo.shade900,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text(
              "Détails du billet",
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
          body: ListView(
            children: [
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
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Trajet éffectué en bus"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "$depart -> $arrive ", //** (${e['troncons']})
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                //child: Text(
                                //  "${e['provinceArrive']}, ${e['lieuArrive']}"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.size.height / 6,
                //color: Colors.blue,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 22,
                        bottom: 5,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Départ : ${[
                            "",
                            "Lundi",
                            "Mardi",
                            "Mercredi",
                            "Jeudi",
                            "Vendredi",
                            "Samedi",
                            "Dimanche"
                          ][e['jourDepart']]}",
                          //"Départ : dim. 4 déc",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${e['heureDepart']}"
                                  .split(" ")[1]
                                  .substring(0, 5),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            // color: Colors.green,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 13,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            //color: Colors.green,
                            child: Text(
                              "${e['heureArrive']}"
                                  .split(" ")[1]
                                  .substring(0, 5),
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.grey.shade900,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                              padding: const EdgeInsets.only(
                                right: 20,
                              ),
                              alignment: Alignment.centerRight,
                              child: Image.network(
                                "${Requete.url}/companie/profil.png?id=${e['idPartenaire']}",
                                height: 50,
                                width: 50,
                                loadingBuilder: (context, child,
                                        loadingProgress) =>
                                    (loadingProgress == null)
                                        ? child
                                        : CircularProgressIndicator(),
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                              )

                              // (e['logo'] != null)
                              //     ? Container(
                              //         height: 50,
                              //         width: 50,
                              //         decoration: BoxDecoration(
                              //           image: DecorationImage(
                              //             image: NetworkImage(
                              //                 "${Requete.urlSt}/companie/profil.png?id=${e['idPartenaire']}"),
                              //           ),
                              //           borderRadius: BorderRadius.circular(25),
                              //         ),
                              //       )
                              //     : Container(
                              //         height: 50,
                              //         width: 50,
                              //         alignment: Alignment.center,
                              //         decoration: BoxDecoration(
                              //           //color: Colors.red,
                              //           borderRadius: BorderRadius.circular(25),
                              //         ),
                              //         child: const Icon(
                              //           Icons.photo_camera,
                              //           color: Colors.white,
                              //         ),
                              //       ),

                              //Text("Logo"),
                              //color: Colors.blue,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 22,
                        bottom: 5,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Durée : ${getDuree('${e['heureDepart']}', '${e['heureArrive']}', e['nombreJours'])}",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        //
                        showSimpleModal(
                            InfoSupplementaire(
                              details: e,
                            ),
                            context);
                      },
                      leading: const Icon(CupertinoIcons.gauge),
                      title: const Text("Informations supplémentaire"),
                      subtitle: const Text("Détails"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ArretsDetails(
                            e['troncons'], "${e['idPartenaire']}"));
                      },
                      leading: Icon(Icons.location_on_outlined),
                      title: Text("Voir les arrets"),
                      //subtitle: Text("$arrs arrets"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
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
                        text: "Prix d'une places\n",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "$prix Fc",
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
                    onTap: () {
                      //
                      //showSimpleModal(Emplacement(), context);
                      //
                      // Get.dialog(
                      //   Center(
                      //     child: SizedBox(
                      //       height: 250,
                      //       width: Get.size.width / 1.2,
                      //       child: Column(
                      //         children: [
                      //           Container(
                      //             color: Colors.blue.shade900,
                      //             alignment: Alignment.center,
                      //             child: Text(
                      //               "Réservation",
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 20,
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // );

                      Get.to(Reservation(e));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      color: Colors.green.shade800,
                      alignment: Alignment.center,
                      child: const Text(
                        "Reserver",
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
        ),
      ),
    );
  }

  String getDuree(String heureDepart, String heureArrive, int nombreJours) {
    //
    DateTime d1 = DateTime(0, 1, 1, int.parse(heureDepart.split(":")[0]),
        int.parse(heureDepart.split(":")[1]));
    DateTime d2 = DateTime(0, 1, 1, int.parse(heureArrive.split(":")[0]),
        int.parse(heureArrive.split(":")[1]));
    //
    Duration heure = d2.difference(d1);
    //DateUtils.getDaysInMonth(widget.annee, widget.mois);
    //
    return "${nombreJours == 1 ? heure.inHours : '$nombreJours J et ${heure.inHours}'} h";
  }
}
