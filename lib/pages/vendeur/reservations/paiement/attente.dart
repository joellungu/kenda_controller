import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'paiement_controller.dart';

class Attente extends StatefulWidget {
  //
  Map paiement;
  //
  Map ticket;
  //
  Attente(this.paiement, this.ticket);
  //
  @override
  State<StatefulWidget> createState() {
    return _Attente();
  }
}

class _Attente extends State<Attente> {
  //
  PaiementController paiementController = Get.find();
  //

  //
  init() async {
    ///paiementController.paiement(e);
  }
  //
  @override
  void initState() {
    //
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
