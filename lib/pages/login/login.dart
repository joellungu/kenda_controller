import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kenda_agent/utils/app_controller.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final numero = TextEditingController();
  final mdp = TextEditingController();

  AppController appController = Get.find();
  //
  RxBool masquer = true.obs;
  //
  RxString choix = "admin".obs;
  RxString agent = "Agent".obs;
  RxString admin = "Admin".obs;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Get.size.height / 3,
          width: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.indigo.shade900,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: numero,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: (e) {
                      if (e!.isEmpty) {
                        return "Veuilliez inserer votre nom d'utilisateur ou votre numéro";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.indigo.shade900,
                            width: 1,
                          )),
                      prefix: const Text("243 "),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.indigo.shade900,
                      ),
                      hintText: "Téléphone",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: mdp,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: masquer.value,
                      validator: (e) {
                        if (e!.isEmpty) {
                          return "Veuilliez inserer votre mot de passe";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.indigo.shade900,
                          ),
                          onPressed: () {
                            //
                            masquer.value = !masquer.value;
                          },
                        ),
                        hintText: "Mot de passe",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //Get.off(Accueil());

                        Get.dialog(
                          Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                        );

                        appController.loagingAgent(
                            "243${numero.text}", mdp.text);
                        // Timer(Duration(seconds: 3), () {
                        //   Get.back();
                        //   Get.off(Accueil());
                        // });
                        //loginController.login(numero.text, mdp.text);
                        //loginController.deja.value = true;
                      }
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        const Size(
                          double.maxFinite,
                          45,
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green.shade900),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      //backgroundColor:
                      //  MaterialStateProperty.all(Colors.red.shade900),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      child: const Text(
                        "S'authentifier",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
