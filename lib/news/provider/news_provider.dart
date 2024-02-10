import 'package:flutter/material.dart';
import 'package:news_app/news/service/news_service.dart';

class NewsProvider with ChangeNotifier {
  NewsApiService newsApiService;

  NewsProvider({
    required this.newsApiService,
  });
}

