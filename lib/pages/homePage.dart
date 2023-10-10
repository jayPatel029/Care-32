import 'package:dental_minor/router/constraints.dart';
import 'package:flutter/material.dart';
import 'package:dental_minor/widgets/widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  // finaWidget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppbar(
        title: "Homepage",
        Icons: Icons.person,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  CustomCard(
                    title: "Scan",
                    iAdd: "asset/monitor.png",
                    subtitle: "Scan your teeth",
                    rAdd: scannerRoute,
                  ),
                  CustomCard(
                    title: "Daily Tasks",
                    iAdd: "asset/task.png",
                    subtitle: "List down your daily tasks here",
                    rAdd: homeStreakRoute,
                  ),
                  CustomCard(
                    title: "Monthly Report",
                    iAdd: "asset/calendar.png",
                    subtitle: "Note down your monthly progress or set remainders here",
                    rAdd: calendarRoute,
                  ),
                  CustomCard(
                    title: "Dentists Near Me",
                    iAdd: "asset/placeholder.png",
                    subtitle: "Locate Top rated dentists nearby",
                    rAdd: denLocationRoute,
                  ),
                  CustomCard(
                    title: "FAQs",
                    iAdd: "asset/faq.png",
                    subtitle: "Some Important FAQs related to dental health",
                    rAdd: faqRoute,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // CustomBottomNavigationBar(
      //   items: items,
      //   onTap: (int index) {
      //     switch (index) {
      //       case 0:
      //       // Do nothing.
      //         break;
      //       case 1:
      //         Navigator.pushNamed(context, '/scan');
      //         break;
      //       case 2:
      //         Navigator.pushNamed(context, '/location');
      //         break;
      //       case 3:
      //         Navigator.pushNamed(context, '/calendar');
      //         break;
      //       case 4:
      //         Navigator.pushNamed(context, '/task');
      //         break;
      //     }
      //   },
      // ),
    );
  }
}
