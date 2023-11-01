// create F1 api service

import 'package:dio/dio.dart';
import 'package:f1_app/app/data/models/f1allseason_model.dart';
import 'package:f1_app/app/data/models/f1season_model.dart';

class F1Service {
  static var baseUrl = "https://f1scrapperapi.onrender.com/";
  static var seasonUrl = "${baseUrl}season/";
  static var allSeasonUrl = "https://f1scrapperapi.onrender.com/all-season";
  static var dio = Dio();

  static Future<List<F1AllSeason>?> getAllSeason() async {
    var res = await dio.get(allSeasonUrl);
    if (res.statusCode == 200) {
      var allSeasons = res.data as List;
      return allSeasons.map((e) => F1AllSeason.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  static Future<List<F1Season>?> getSeason(String season) async {
    var res = await dio.get(seasonUrl + season);
    if (res.statusCode == 200) {
      var season = res.data as List;
      return season.map((e) => F1Season.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
