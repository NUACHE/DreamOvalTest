import 'dart:convert';
import 'package:deip/core/values/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  //Fetch collections
  Future fetchCollections({username, password}) async {
    try {
      var url = Endpoints.collections;
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$username:$password'))}';

      var results = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'X-RapidAPI-Key':
              'e8befb4d9dmsh56261b21d48d499p10b9acjsn1f93f1d87bbe',
          'authorization': basicAuth
        },
        body: jsonEncode({"requestId": "1", "page": 0, "size": 10}),
      );
      debugPrint(results.body.toString());
      return jsonDecode(results.body);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
