
# News App

Projek ini dibuat mengunakan state managament Provider dan Http. Dengan tampilan UI mengunakan Theme dan Animation bawaan Widget Hero. Unit test untuk API dengan metode sederhana 
## Documentation

[Provider](https://pub.dev/packages/provider)

[Http](https://pub.dev/packages/http)

[Theme](https://material.io/design/material-studies/fortnightly.html)
![Screenshot 2022-10-20 164938](https://user-images.githubusercontent.com/103849124/196918934-be9529e5-ff3b-4100-99bd-404eaf1c50d5.png)
![Screenshot 2022-10-20 165007](https://user-images.githubusercontent.com/103849124/196918947-b7415ca1-eb3e-4c8a-8113-8604c8fd8d0f.png)

## API Reference

#### Get all items

```http
 https://newsapi.org/
```

## Installation

dapatkan Key API Pada link newsapi dengan cara registar

```bash
  Flutter pub get
```
    
## Usage/Examples

```javascript
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salt_news_app/data/model/newsresult_model.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'edit_your_code';
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

```


## 🛠 Skills
Flutter, Dart

