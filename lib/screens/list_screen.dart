import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_salt/screens/home_screen.dart';
import 'package:flutter_salt/screens/views/contact_view.dart';
import 'package:flutter_salt/screens/views/dashboard_view.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //Untuk List Screen
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = [
    DashboardView(),
    ContactView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (value) {
            pageController.jumpToPage(value);
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'List Contact',
            ),
          ]),
      body: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
