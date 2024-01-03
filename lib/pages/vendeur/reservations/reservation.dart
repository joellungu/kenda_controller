import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/widgets/horaire.dart';
// import 'package:kenda/widgets/carte_bus.dart';
// import 'package:kenda/widgets/horaire.dart';

class Reservation extends StatelessWidget {
  Map e;
  Reservation(this.e) {
    //
    DateTime dateTime = DateTime.now();
    print(e["jourDepart"]);
    //
    if (dateTime.weekday == 1) {
      //Lundi
      print("Lundi -- ${e["jourDepart"]}");
      getVraiDate(e["jourDepart"], 0, 1, 2, 3, 4, 5, 6);
    } else if (dateTime.weekday == 2) {
      //Mardi
      print("Mardi -- ${e["jourDepart"]}");
      getVraiDate(e["jourDepart"], 6, 7, 8, 9, 10, 11, 12);
    } else if (dateTime.weekday == 3) {
      //Mercredi
      print("Mercredi -- ${e["jourDepart"]}");
      getVraiDate(e["jourDepart"], 5, 6, 7, 8, 9, 10, 11);
    } else if (dateTime.weekday == 4) {
      //Jeudi
      print("Jeudi -- ${e["jourDepart"]}");
      getVraiDate(e["jourDepart"], 4, 5, 6, 7, 8, 9, 10);
    } else if (dateTime.weekday == 5) {
      //Vendredi
      print("Vendredi -- ${e["jourDepart"]}");
      getVraiDate(e["jourDepart"], 3, 4, 5, 6, 7, 8, 10);
    } else if (dateTime.weekday == 6) {
      //Samedi
      print("Samedi -- ${e["jourDepart"]}");
      getVraiDate(e["jourDepart"], 2, 3, 4, 5, 6, 7, 8);
    } else {
      //Dimanche
      print("Dimanche -- ${e["jourDepart"]}");
      getVraiDate(e["jourDepart"], 1, 2, 3, 4, 5, 6, 7);
    }
  }

  DateTime date = DateTime.now();
  DateTime d = DateTime.now();

  getVraiDate(
      int jour, int lu, int ma, int me, int je, int ve, int sa, int di) {
    if (jour == 1) {
      print("date: $jour -- $lu -- ${Duration(days: lu)}");
      d = date.add(Duration(days: lu));
    } else if (jour == 2) {
      d = date.add(Duration(days: ma));
    } else if (jour == 3) {
      d = date.add(Duration(days: me));
    } else if (jour == 4) {
      d = date.add(Duration(days: je));
    } else if (jour == 5) {
      d = date.add(Duration(days: ve));
    } else if (jour == 6) {
      d = date.add(Duration(days: sa));
    } else {
      d = date.add(Duration(days: di));
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    DateTime lelo = DateTime.now(); // Pour les départs d'aujourd'hui
    //
    DateTime d1 = d;
    //
    DateTime d2 = d1.add(const Duration(days: 7));
    //
    DateTime d3 = d2.add(const Duration(days: 7));
    //
    DateTime d4 = d3.add(const Duration(days: 7));
    //
    print(d);

    print("d1: $d1");
    print("d2: $d2");
    print("d3: $d3");
    print("d4: $d4");

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
              "Reservation",
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
            padding: const EdgeInsets.all(10),
            children: [
              //Horaire(e, lelo),
              Horaire(e, d1),
              Horaire(e, d2),
              Horaire(e, d3),
              Horaire(e, d4),
            ],
          ),
        ),
      ),
    );
  }
}
