import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_app/constants/string.dart';
import 'package:news_api_app/models/newsinfo.dart';

class API_Manager {
  Future getNews() async {
    var client = http.Client();
    var newsModel = null;

    try {
      var response = await client.get(Uri.parse(Strings.newsurl));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = Welcome.fromJson(jsonMap);
        return newsModel;
      }
    } catch (e) {
      return newsModel;
    }

    return newsModel;
  }
}
