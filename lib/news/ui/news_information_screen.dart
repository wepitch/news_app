import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/news/model/news_model.dart';
import 'package:news_app/news/provider/news_provider.dart';
import 'package:news_app/news/ui/news_all_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsInformationScreen extends StatefulWidget {
  const NewsInformationScreen({super.key});

  @override
  _NewsScreen createState() => _NewsScreen();
}

class _NewsScreen extends State<NewsInformationScreen> {
  late NewsProvider newsProvider;

  @override
  void initState() {
    newsProvider = Provider.of<NewsProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Articles>>(
        future: newsProvider.newsApiService.fetchCollegeNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Articles>? articles = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 160.0,
                          viewportFraction: 0.7,
                          enlargeCenterPage: true,
                        ),
                        items: articles?.map((article) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      article.urlToImage ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              );
                            }).toList() ??
                            [],
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          'Latest News',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: articles?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsAllDetailScreen(
                                      newsArticle: articles![index],
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Container(
                                  height: 120, // Set your desired height
                                  width: 100, // Set your desired width
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      articles?[index].urlToImage ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  articles?[index].title ?? '',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  String formatTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedTime = DateFormat('MMM dd, yyyy').format(dateTime);
    return formattedTime;
  }
}
