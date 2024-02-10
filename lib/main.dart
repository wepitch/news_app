import 'package:flutter/material.dart';
import 'package:news_app/bottom_tab%20_bar.dart';
import 'package:news_app/news/provider/news_provider.dart';
import 'package:news_app/news/service/news_service.dart';
import 'package:provider/provider.dart';

import 'news/nevigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                NewsProvider(newsApiService: NewsApiService())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
