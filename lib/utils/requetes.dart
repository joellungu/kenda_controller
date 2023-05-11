import 'package:get/get.dart';

class Requete extends GetConnect {
  static String url = "http://10.0.2.2:8080";
  static String ws = "ws://10.0.2.2:8080";
  Future<Response> getE(String path) async {
    return get("$url/$path");
  }

  Future<Response> postE(String path, var e) async {
    return post("$url/$path", e);
  }

  Future<Response> putE(String path, var e) async {
    return put("$url/$path", e);
  }

  Future<Response> deleteE(String path) async {
    return delete("$url/$path");
  }
}
