import 'package:newsapi_app/models/news_model.dart';
import 'package:newsapi_app/services/news_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SelectTab {
  topHeadlines('top-headlines'),
  everything('everything');

  final String endpoint;
  const SelectTab(this.endpoint);
}

class LocalRepository {
  LocalRepository(this._newsApi);
  final NewsApi _newsApi;
  List<Articles> topHeadlinesList = [];
  List<Articles> everythingList = [];

  Future<List<Articles>> getNews(int page, SelectTab tab) async {
    NewsModel newsModel = await _newsApi.getNews(page, tab.endpoint);
    final List<Articles> currentList;
    if (tab == SelectTab.topHeadlines) {
      currentList = topHeadlinesList;
    } else {
      currentList = everythingList;
    }
    if (page <= 1) {
      currentList.clear();
    }
    currentList.addAll(newsModel.articles);
    return currentList;
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
