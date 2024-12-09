import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  // SINGLETON
  ApiHelper._instance();

  static ApiHelper apiHelper = ApiHelper._instance();

  // CALL API
  Future<String> callApi(String url) async {
    Uri uri = Uri.parse(url);
    try {
      Response response = await http.get(uri);
      if (response.statusCode == 200) {
        log("Got data...");
        return response.body;
      }
    } catch (e) {
      log("Api Call failed!! $e");
    }

    return "";
  }
}
