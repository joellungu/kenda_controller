import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenda_agent/pages/vendeur/reservations/paiement/paiement_controller.dart';
import 'package:kenda_agent/utils/requetes.dart';
import 'package:kenda_agent/widgets/infos_supplementaire.dart';
import 'package:kenda_agent/widgets/modal.dart';

class TicketDetails2 extends StatelessWidget {
  Map e;
  //
  PaiementController paiementController = Get.find();
  TicketDetails2(this.e) {
    print(e);
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
                height: Get.size.height / 7,
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
                                  "${e['itinerance']}".split("à")[0],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${e['itinerance']}"
                                      .split("à")[1]
                                      .replaceAll(" ", ""),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.qrcode_viewfinder,
                          size: 100,
                        ),
                      ),
                    )
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
                          "Départ : ${getDate(e['dateDepart'])}",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 22,
                            bottom: 5,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Heure: ${e['heureDepart']}",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          // color: Colors.green,
                        )
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
                          "Réf : ${e['unique_code']}",
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        //
                        showSimpleModal(
                            InfoSupplementaireLoad(
                              id: "${e['idBoutique']}",
                              arrive: "${e['itinerance']}"
                                  .split("à")[1]
                                  .replaceAll(" ", ""),
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
                        //showSimpleModal(Emplacement(), context);
                      },
                      leading: Icon(Icons.airline_seat_recline_extra_rounded),
                      title: const Text("Emplacement dans le bus"),
                      subtitle: Text("Place N° ${e['emplacement']}"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Nom"),
                      subtitle: Text("${e['infoPersonnel']['nom']}"),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text("Téléphone"),
                      subtitle: Text("${e['infoPersonnel']['telephone']}"),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text("Adresse"),
                      subtitle: Text("${e['infoPersonnel']['adresse']}"),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Sexe"),
                      subtitle: Text("${e['infoPersonnel']['sexe']}"),
                    ),
                    // const Divider(
                    //   color: Colors.grey,
                    // ),
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
                    child: getDetails("${e['idBoutique']}"),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () {
                      //
                      print("Click...");
                      showSimpleModal(TicketQrCode(e), context);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      color: Colors.green.shade800,
                      alignment: Alignment.center,
                      child: const Text(
                        "Scaner",
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

  //
  Widget getDetails(String idPartenaire) {
    print(idPartenaire);
    return FutureBuilder(
        future: paiementController.getCompanie(idPartenaire),
        builder: (c, t) {
          if (t.hasData) {
            Map d = t.data as Map;
            return RichText(
              text: TextSpan(
                text: "Tajet effectué avec\n",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "${d['nom']}",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else if (t.hasError) {
            return Container();
          }
          return Container();
        });
  }

  //
  String getDate(String dateDepart) {
    //
    List date = dateDepart.split("-");
    //
    List semaine = [
      "",
      "Lun",
      "Mar",
      "Mer",
      "Jeu",
      "Ven",
      "Sam",
      "Dim",
    ];
    //
    List mois = [
      "",
      "Jen",
      "Fev",
      "Mar",
      "Avr",
      "Mai",
      "Juin",
      "Juil",
      "Aout",
      "Sep",
      "Oct",
      "Nom",
      "Dec",
    ];
    //
    DateTime d = DateTime(
      int.parse(date[2]),
      int.parse(date[1]),
      int.parse(date[0]),
    );
    //
    String jour = semaine[d.weekday];
    String moi = mois[d.month];
    //DateUtils.getDaysInMonth(widget.annee, widget.mois);
    //
    return "$jour. ${d.day} $moi";
  }
}

class TicketQrCode extends StatelessWidget {
  Map e;
  Map ticket = {};
  TicketQrCode(this.e) {
    ticket = {
      "idBoutique": e["idBoutique"],
      "unique_code": e["unique_code"],
    };
  }
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
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
                const SizedBox(
                  width: 15,
                ),
                RichText(
                  text: TextSpan(
                    text: "Votre Qrcode",
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
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
          Container(
            height: 50,
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        //
                        //Get.back();
                        //
                      },
                      icon: const Icon(
                        CupertinoIcons.bus,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                //Text("LOGO")
                (e['logo'] != null)
                    ? Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "${Requete.urlSt}/companie/profil.png?id=${e['idPartenaire']}"),
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                        ),
                      )
              ],
            ),
          ),
          Container(
            height: Get.size.height / 1.5,
            width: Get.size.width / 1.2,
            alignment: Alignment.center,
            // child: BarcodeWidget(
            //   barcode: Barcode.qrCode(
            //     errorCorrectLevel: BarcodeQRCorrectionLevel.high,
            //   ),
            //   data: '${e['unique_code']}',
            //   width: 300,
            //   height: 300,
            // ),
          )
        ],
      ),
    );
  }
}
