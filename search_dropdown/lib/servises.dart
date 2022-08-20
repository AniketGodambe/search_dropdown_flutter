import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'country_drop_down_model/country_drop_down_model.dart';

class Services {
  static var client = http.Client();

  static Future<List<CountryDropDownModel>> getCountyList() async {
    String url = 'https://mocki.io/v1/ffe37d41-3434-4b1f-8410-d8b96427cade';
    print(url);

    List<CountryDropDownModel> countryList = [];
    try {
      final response = await client.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final jsonRes = response.body;
        final jsonMap = json.decode(jsonRes);
        print('$jsonMap');
        if (response != null) {
          countryList = List<CountryDropDownModel>.from(jsonMap['data'].map(
            (x) => CountryDropDownModel.fromJson(x),
          ));
        }
      }
      return countryList;
    } catch (e) {
      debugPrint('api error $e');
      return countryList;
    }
  }
}
