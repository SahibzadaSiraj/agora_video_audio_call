import 'dart:convert';

import 'package:agora_task/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TwillioController with ChangeNotifier {
  bool _loading = false;
  set loading(v) {
    _loading = v;
    notifyListeners();
  }

  bool get loading => _loading;

  Future<http.Response> twilioCallAPI(String number) async {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${AppConstants.accountId}:${AppConstants.twilioToken}'))}';
    http.Response response;
    try {
      loading = true;
      response =
          await http.post(Uri.parse(AppConstants.twilioVoiceCallApi), body: {
        'Url': 'http://demo.twilio.com/docs/voice.xml',
        'To': number,
        'From': '+447440488904'
      }, headers: <String, String>{
        'authorization': basicAuth
      });
      loading = false;
      return response;
    } catch (e) {
      loading = false;
      return http.Response("somthing went wrong $e", 400);
    }
  }
}
