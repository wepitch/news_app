import 'package:flutter/material.dart';
import 'package:news_app/news/ui/news_information_screen.dart';
import 'news/provider/news_provider.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  TabScreenState createState() => TabScreenState();
}

class TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  NewsProvider? newsProvider;
  int pageSize = 10;

  final List<Tab> topTabs = <Tab>[
    const Tab(text: 'Everything'),
    const Tab(text: 'Business'),
    const Tab(text: 'Entertainment'),
    const Tab(text: 'Health'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 7, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: Colors.white,
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(text: 'All News'),
            Tab(text: 'Business'),
            Tab(text: 'Entertainment'),
            Tab(text: 'Health'),
          ],
          labelColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          NewsInformationScreen(
          ),
          NewsInformationScreen(
          ),
          NewsInformationScreen(
          ),
          NewsInformationScreen(
          ),
        ],
      ),
    );
  }
}
