import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/news/model/news_model.dart';

class NewsAllDetailScreen extends StatefulWidget {
  const NewsAllDetailScreen({required this.newsArticle, super.key});

  final Articles newsArticle;

  @override
  State<NewsAllDetailScreen> createState() => _NewsAllDetailScreenState();
}

class _NewsAllDetailScreenState extends State<NewsAllDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 14, right: 14),
        child: SingleChildScrollView(
          child: Card(
            elevation: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      widget.newsArticle.urlToImage ?? '',
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Column(
                      children: [
                        Text('|',
                            style: TextStyle(fontSize: 48, color: Colors.orange)),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.newsArticle.title ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.newsArticle.description!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.newsArticle.content!,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedTime = DateFormat('MMM dd, yyyy').format(dateTime);
    return formattedTime;
  }
}
