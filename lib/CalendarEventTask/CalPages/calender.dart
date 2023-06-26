import 'package:dental_minor/CalendarEventTask/CalModel/event_provider.dart';
import 'package:dental_minor/theme.dart';
import 'package:dental_minor/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'eventsEditing.dart';


class CalPage extends StatelessWidget {
  static final String title = 'Calendar Events App';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => EventProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: theme(),
      home: MainPage(),
    ),
  );
}

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey[300],
    appBar: CustomAppbar(title: 'Calendar',),
    body: CalendarWidget(),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: Colors.grey[600],
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EventEditingPage()),
      ),
    ),
  );
}
