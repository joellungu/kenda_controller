import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kenda_agent/pages/vendeur/recherche/lieu_controller.dart';
import 'package:kenda_agent/utils/requetes.dart';
// import 'package:kenda/pages/recherche/lieu_controller.dart';
// import 'package:kenda/utils/requetes.dart';
import 'package:random_string/random_string.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Achat extends StatefulWidget {
  String parametres;
  Achat(this.parametres);
  //
  @override
  State<StatefulWidget> createState() {
    return _Achat();
  }
}

class _Achat extends State<Achat> {
  //
  String nom = randomAlphaNumeric(10);
  //
  LieuController lieuController = Get.find();
  //
  Timer? time;
  var channel;
  @override
  void initState() {
    //
    channel = WebSocketChannel.connect(
      Uri.parse('${Requete.ws}/paiement/${widget.parametres}'),
    );
    //
    super.initState();
    //
    time = Timer.periodic(const Duration(seconds: 5), (timer) {
      //
      channel.sink.add("${timer.tick}");
      //
    });
  }

  //
  @override
  void dispose() {
    //
    channel.sink.close();
    //
    time!.cancel();
    //
    super.dispose();
    //
  }

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(),
        StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.runtimeType);
              String r = snapshot.data as String;
              print(r);
              return Container();
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Erreur"),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                              "Un problème est survenu lors du paiement veuillez reessayer."),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              print(snapshot.error);
              return Center(
                child: Container(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            // return Text(
            //     snapshot.hasData ? '${snapshot.data}' : '');
          },
        ),
      ],
    );
  }
}
