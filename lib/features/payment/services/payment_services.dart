import 'dart:convert';
import 'package:deip/core/values/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentServices {
  //Make payments
  Future makePayments({
    serviceCode,
    reference,
    amount,
    transactionId,
    payer,
    payerContact,
  }) async {
    try {
      var url = Endpoints.payment;
      String basicAuth = 'Basic ${base64.encode(utf8.encode('user:password'))}';

      var results = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'X-RapidAPI-Key':
              'testApiKey',
          'authorization': basicAuth
        },
        body: jsonEncode({
          "serviceCode": "$serviceCode",
          "reference": '$reference',
          "amount": '$amount',
          'currency': "GHS",
          'transactionId': '$transactionId',
          'transactionDate': '${DateTime.now()}',
          'payer': '$payer',
          'payerContact': '$payerContact',
          'comment': "Testing payments",
          "paymentMode": "CASH"
        }),
      );

      debugPrint(results.body.toString());

      return jsonDecode(results.body);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
