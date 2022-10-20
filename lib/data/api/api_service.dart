import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salt_news_app/data/model/newsresult_model.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'ef5c13f04e6d43efa126ca8085636730';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<NewsResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return NewsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
