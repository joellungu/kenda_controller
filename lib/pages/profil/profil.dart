import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/utils/app_controller.dart';

class Profil extends StatelessWidget {
  Map e;
  bool affiche;
  Profil(this.e, this.affiche) {
    print(e);
  }
  AppController appController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      //padding: const EdgeInsets.all(10),
      children: [
        ListTile(
          title: const Text("Nom"),
          subtitle: Text(e["nom"]),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              var nom = TextEditingController();
              //
              modifierInfo(e, context, nom, "nom");
            },
          ),
        ),
        ListTile(
          title: Text("Postnom"),
          subtitle: Text(e["postnom"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var postnom = TextEditingController();
              //
              modifierInfo(e, context, postnom, "postnom");
            },
          ),
        ),
        ListTile(
          title: Text("Prenom"),
          subtitle: Text(e["prenom"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var prenom = TextEditingController();
              //
              modifierInfo(e, context, prenom, "prenom");
            },
          ),
        ),
        ListTile(
          title: Text("Téléphone"),
          subtitle: Text("${e["numero"]}"),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var numero = TextEditingController();
              //
              modifierInfo(e, context, numero, "numero");
            },
          ),
        ),
        ListTile(
          title: Text("Email"),
          subtitle: Text(e["email"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var email = TextEditingController();
              //
              modifierInfo(e, context, email, "email");
            },
          ),
        ),
        ListTile(
          title: Text("Adresse"),
          subtitle: Text(e["adresse"]),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var adresse = TextEditingController();
              //
              modifierInfo(e, context, adresse, "adresse");
            },
          ),
        ),
        ListTile(
          title: Text("Role"),
          subtitle: Text(e["roletitre"]),
          // trailing: IconButton(
          //   icon: Icon(Icons.edit),
          //   onPressed: () {},
          // ),
        ),
        ListTile(
          title: Text("Mot de passe"),
          subtitle: Text("*************"), //e["password"]
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              var pwd = TextEditingController();
              //
              modifierInfo(e, context, pwd, "password");
            },
          ),
        ),
      ],
    );
  }

  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom];
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("${nom.capitalize}"),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //prefixIcon: const Icon(Icons.person),
                        hintText: 'nom'.tr,
                        labelText: 'nom'.tr,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'nom_message'.tr;
                        }

                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
                    ),
                    InkWell(
                      onTap: () {
                        e[nom] = text.text;
                        Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        appController.putDataAgent(e);
                        //Mise ) jour ici...
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 2,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 2,
                          ),
                          child: Text(
                            "Enregistrer".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
