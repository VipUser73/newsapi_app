import 'dart:convert';
import 'package:newsapi_app/models/news_model.dart';
import 'package:http/http.dart' as https;

class NewsApi {
  Future<NewsModel> getNews(int page, String endpoint) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/$endpoint?q=Apple&pageSize=15&page=$page&apiKey=43a3c1dad96e43238ed194a673a36511");
    final response = await https.get(url);
    var body = jsonDecode(response.body);
    return NewsModel.fromJson(body);
  }
}
