import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  static String apiURL = "https://ik.gaziantepbilisim.com.tr/api";
  static int apiVersion = 2;
  static String? token;
  static int? ServiceVersion;

  static dynamic login(String email, String password) async {
    var client = http.Client();

    try {
      var response = await client.post(
        Uri.parse(apiURL + '/login' + '?v=' + Service.apiVersion.toString()),
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      dynamic jresponse = json.decode(response.body);

      return jresponse;
    } catch (e) {
      return null;
    } finally {
      client.close();
    }
  }
}
