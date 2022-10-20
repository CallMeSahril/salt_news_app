import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salt_news_app/common/styles.dart';
import 'package:salt_news_app/data/api/api_service.dart';
import 'package:salt_news_app/data/model/newsresult_model.dart';
import 'package:salt_news_app/page/detail_page.dart';
import 'package:salt_news_app/page/home_page.dart';
import 'package:salt_news_app/provider/news_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (context) => NewsProvider(apiService: ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: primaryColor,
                onPrimary: Colors.black,
                secondary: secondaryColor,
              ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          textTheme: myTextTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          DetailPage.routeName: (context) => DetailPage(
                article: ModalRoute.of(context)?.settings.arguments as Article,
              )
        },
      ),
    );
  }
}
