import 'package:flutter/material.dart';
import 'package:dental_minor/pages/pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    FaqsPage(),
    DentistLocPage(),
    CalPage(),
    StreakHomePage(),
  ];

  int currIndex = 0;

  void onTap(int index)
  {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[300],
        onTap: onTap,
        currentIndex: currIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedFontSize: 0.0,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              label: "FAQ's", icon: Icon(Icons.mark_unread_chat_alt)),
          BottomNavigationBarItem(
              label: "Dentist", icon: Icon(Icons.location_pin)),
          BottomNavigationBarItem(
              label: "Cal", icon: Icon(Icons.calendar_month)),
          BottomNavigationBarItem(label: "Task", icon: Icon(Icons.task)),
        ],
      ),
    );
  }
}
