import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:andipramana_19552011008/pages/dashboard_page.dart';
import 'package:andipramana_19552011008/pages/date_page.dart';
import 'package:andipramana_19552011008/pages/time_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const [
            DashboardPage(),
            DatePage(),
            TimePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.dashboard),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent,
            title: const Text('DashBoard'),
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.date_range),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.redAccent,
            title: const Text('Date'),
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.timer),
            activeColor: Colors.green,
            inactiveColor: Colors.green,
            title: const Text('Time'),
          ),
        ],
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(_selectedIndex);
        },
      ),
    );
  }
}
