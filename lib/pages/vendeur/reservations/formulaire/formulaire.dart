import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenda_agent/widgets/carte_bus.dart';

class Formulaire extends StatelessWidget {
  int nombre = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Reservation"),
            leading: IconButton(
              onPressed: () {
                //
                Get.back();
                //
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue.shade700,
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset(
                    "assets/e-commerce _ service, receipt, document, confirm, complete, checkmark, server, waiter@2x.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " Nombre de personne",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 50,
                  child: DropdownButton<int>(
                    value: nombre,
                    style: GoogleFonts.cutiveMono(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    items: List.generate(
                      100,
                      (index) => DropdownMenuItem<int>(
                        value: index,
                        child: Text("${index + 1}"),
                      ),
                    ),
                    isExpanded: true,
                    icon: Transform.rotate(
                      angle: pi / 2,
                      child: Icon(Icons.code),
                    ),
                    underline: Container(),
                    onChanged: (value) {
                      nombre = value as int;
                    },
                  ),
                  //width: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.size.height,
                width: Get.size.width,
                child: CarteBus(),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  //
                  //Get.to(Recherche());
                  //
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(1),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blue,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                //elevation: 1,
                child: SizedBox(
                  height: 50,
                  width: Get.size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Reserver",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
