import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/pages/vendeur/reservations/emplacement.dart';
import 'package:kenda_agent/pages/vendeur/reservations/reservation_controller.dart';
import 'package:kenda_agent/utils/requetes.dart';
// import 'package:kenda/pages/reservations/emplacement.dart';
// import 'package:kenda/pages/reservations/reservation_controller.dart';
// import 'package:kenda/utils/requetes.dart';

import 'modal.dart';

class Horaire extends StatelessWidget {
  Map e;
  DateTime date;
  Horaire(this.e, this.date);
  //
  ReservationController reservationController = Get.find();
  //idPartenaire
  //
  //
  @override
  Widget build(BuildContext context) {
    int prix = int.parse("${e['prix']}".split(".")[0]);
    return Card(
      child: SizedBox(
        //color: index.isOdd ? Colors.white : Colors.black12,
        //
        height: 130.0,
        child: FutureBuilder(
          future: reservationController.getHoraire(
              "${e['id']}",
              "${e['idPartenaire']}",
              "${date.day}-${date.month}-${date.year}",
              0),
          builder: (c, t) {
            if (t.hasData) {
              List l = t.data as List;
              //print("::: ${e}");
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        //
                        showSimpleModal(
                          Emplacement(
                            l: l,
                            e: e,
                            date: date,
                          ),
                          context,
                        );
                        //
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.people),
                                  Text(
                                    "${e['bus']['capacite'] - l.length} Places disponible",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
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
                                  //const Text("LOGO"),
                                  // Text(
                                  //   "$prix Fc ",
                                  //   style: TextStyle(
                                  //     fontSize: 20,
                                  //     fontWeight: FontWeight.w500,
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.grey.shade300,
                            height: 1,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.grey.shade700,
                                  ),
                                  Text(
                                    "Pour le ${[
                                      "Lundi",
                                      "Mardi",
                                      "Mercredi",
                                      "Jeudi",
                                      "Vendredi",
                                      "Samedi",
                                      "Dimanche"
                                    ][e['jourDepart'] - 1]}, ${date.day} / ${date.month} / ${date.year}",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Text("")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (t.hasError) {
              return Container();
            }
            return Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          },
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
