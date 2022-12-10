import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class PawspaceAuthServices {
  //Generate a primeID for new user after successful response
  Future<dynamic> GetApis(String url, String body) async {
    var responseJson;
    try {
      final http.Response response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Content-Type": "application/json",
            // 'Authorization': 'Bearer ${token}',
            // 'Accept': '*/*',
          },
          body: body);
      print("token");
      // print('Bearer $token');
      // headers: <String, String>{"Content-Type": "application/json"},;

      responseJson = json.decode(response.body);
      print(responseJson);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> DeleteApis(String url, String body, String token) async {
    var responseJson;
    try {
      final http.Response response = await http.delete(Uri.parse(url),
          headers: <String, String>{
            "Content-Type": "application/json",
            'Authorization': 'Bearer ${token}',
            'Accept': '*/*',
          },
          body: body);
      print("token");
      print('Bearer $token');
      // headers: <String, String>{"Content-Type": "application/json"},;

      responseJson = json.decode(response.body);
      print(responseJson);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> PatchApis(String url, String body, String token) async {
    var responseJson;
    try {
      final http.Response response = await http.patch(Uri.parse(url),
          headers: <String, String>{
            "Content-Type": "application/json",
            'Authorization': 'Bearer ${token}',
            'Accept': '*/*',
          },
          body: body);
      print("token");
      print('Bearer $token');
      // headers: <String, String>{"Content-Type": "application/json"},;

      responseJson = json.decode(response.body);
      print(responseJson);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }

  Future<dynamic> GetRequest(String url, {String token = ''}) async {
    var responseJson;
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        // headers: <String, String>{"Content-Type": "application/json"},
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
          'Accept': '*/*',
        },
      );
      // headers: <String, String>{"Content-Type": "application/json"},;

      responseJson = json.decode(response.body);
      print(responseJson);
    } catch (e) {
      print(e);
    }
    return responseJson;
  }
}
