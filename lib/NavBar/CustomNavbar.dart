import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.items,
    required this.onTap,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black,),
      label: 'Home',
      backgroundColor: Colors.grey[300],
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.camera, color: Colors.black,),
      label: 'Scan',
      backgroundColor: Colors.grey[300],

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_on , color: Colors.black,),
      label: 'Location',
      backgroundColor: Colors.grey[300],

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today, color: Colors.black,),
      label: 'Calendar',
      backgroundColor: Colors.grey[300],

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.task, color: Colors.black,),
      label: 'Task',
      backgroundColor: Colors.grey[300],

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      items: widget.items,
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTap(index);
      },
    );
  }
}
