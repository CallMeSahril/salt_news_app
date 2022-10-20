import 'package:flutter/foundation.dart';
import 'package:salt_news_app/data/api/api_service.dart';
import 'package:salt_news_app/data/model/newsresult_model.dart';

enum ResultState { loading, noData, hasData, error }

class NewsProvider extends ChangeNotifier {
  final ApiService apiService;

  NewsProvider({required this.apiService}) {
    _fetchAllNews();
  }

  late NewsResult _newsResult;
  late ResultState _state;
  String _message = '';

  String get messege => _message;
  NewsResult get result => _newsResult;
  ResultState get state => _state;

  Future<dynamic> _fetchAllNews() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final news = await apiService.topHeadlines();
      if (news.articles.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _newsResult = news;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
