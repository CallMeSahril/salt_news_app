import 'package:flutter/material.dart';
import 'package:salt_news_app/data/model/newsresult_model.dart';
import 'package:salt_news_app/page/detail_page.dart';

class CardArticle extends StatelessWidget {
  const CardArticle({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName, arguments: news);
      },
      leading: Hero(
        tag: news.urlToImage!,
        child: Image.network(news.urlToImage!),
      ),
      title: Text(
        news.title,
        maxLines: 2,
      ),
      subtitle: Text(news.description!, maxLines: 1),
    );
  }
}
