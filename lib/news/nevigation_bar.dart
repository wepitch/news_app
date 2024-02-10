import 'package:flutter/material.dart';
import 'package:news_app/news/ui/news_information_screen.dart';

import '../bottom_tab _bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> list = [
    const TabScreen(),
    const TabScreen(),
    const TabScreen(),
    const TabScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        currentIndex: 0,
        onTap: (int tabIndex) {
          currentIndex = tabIndex;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.orange,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black54,
              size: 18,
            ),
            label: "PortFolio",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.save,
              color: Colors.black54,
              size: 18,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black54,
              size: 18,
            ),
            label: "PortFolio",
          ),
        ],
      ),
    );
  }
}
