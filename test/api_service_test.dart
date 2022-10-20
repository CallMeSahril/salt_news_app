import 'package:flutter_test/flutter_test.dart';
import 'package:salt_news_app/data/api/api_service.dart';
import 'package:salt_news_app/data/model/newsresult_model.dart';

void main() {
  test("Fetch Api", () async {
    bool done = false;
    List<Article> fetch = (await ApiService().topHeadlines()).articles;

    if (fetch.isNotEmpty) {
      done = true;
    } else {}
    expect(done, true);
  });
}
