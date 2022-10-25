import 'dart:convert';
import 'package:newsapi_app/models/news_model.dart';
import 'package:flutter/services.dart';
import 'package:newsapi_app/services/news_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  LocalRepository(this._newsApi);
  final NewsApi _newsApi;
  List<NewsModel> topHeadlinesList = [];
  List<NewsModel> everythingList = [];

  // Получение информации о погоде
  Future<List<NewsModel>> getTopHeadlines() async {
    topHeadlinesList.clear();
    topHeadlinesList.add(await _newsApi.getTopHeadlines('top-headlines'));
    return topHeadlinesList;
  }

  Future<List<NewsModel>> getEverything() async {
    everythingList.clear();
    everythingList.add(await _newsApi.getTopHeadlines('everything'));
    return everythingList;
  }

// // Сохранение информации о городе в локальном хранилище
//   Future saveFavCity(Cities item) async {
//     final responce = cityInfoToJson(item);
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('favCity', responce);
//   }

//   // Кодирование информации в JSON для сохранения в локальое хранилище
//   String cityInfoToJson(Cities city) {
//     List<Cities> citiesList = [];
//     citiesList.add(city);
//     return jsonEncode(citiesList.map((e) => e.toJson()).toList());
//   }

//   List<Cities> listFromBody(List<dynamic> body) =>
//       body.map((e) => Cities.fromJson(e as Map<String, dynamic>)).toList();

//   // Чтение из локального хранилища
//   Future<List<Cities>> readFavCity() async {
//     final prefs = await SharedPreferences.getInstance();
//     final item = prefs.getString('favCity') ?? "[]";
//     final data = await json.decode(item);
//     cityFromPrefs = listFromBody(data);
//     return cityFromPrefs;
//   }

//   // Удаление информации из локального хранилища
//   Future<bool> deleteCity() async {
//     final prefs = await SharedPreferences.getInstance();
//     final success = await prefs.remove('favCity');
//     return success;
//   }
}
