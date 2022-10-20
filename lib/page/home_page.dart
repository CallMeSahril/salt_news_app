import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salt_news_app/provider/news_provider.dart';
import 'package:salt_news_app/widgets/card_article.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
        ),
        centerTitle: true,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, value, child) {
          switch (value.state) {
            case ResultState.loading:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            case ResultState.hasData:
              return ListView.builder(
                itemCount: value.result.articles.length,
                itemBuilder: (context, index) {
                  final news = value.result.articles[index];
                  return CardArticle(news: news);
                },
              );

            case ResultState.noData:
              return Center(child: Text(value.messege));

            case ResultState.error:
              return Center(
                child: Text(value.messege),
              );
            default:
              return const Center(
                child: Text(""),
              );
          }
        },
      ),
    );
  }
}
