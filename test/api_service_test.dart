import 'package:flutter_test/flutter_test.dart';
import 'package:salt_news_app/data/api/api_service.dart';

void main() {
  test("Fetch Api", () async {
    bool done = false;
    var fetch = (await ApiService().topHeadlines()).articles;

    if (fetch != null) {
      done = true;
    } else {}
    expect(done, true);
  });
}
