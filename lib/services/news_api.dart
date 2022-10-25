import 'dart:convert';
import 'package:newsapi_app/models/news_model.dart';
import 'package:http/http.dart' as https;

class NewsApi {
  Future<NewsModel> getTopHeadlines(String tab) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/$tab?q=Apple&pageSize=15&apiKey=c6ce458c07914379a7e590cebab4bcb0");
    final response = await https.get(url);
    var body = jsonDecode(response.body);
    return NewsModel.fromJson(body);
  }
}
