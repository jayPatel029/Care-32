import 'package:flutter/material.dart';
import 'package:dental_minor/pages/pages.dart';

import '../CalendarEventTask/CalPages/calender.dart';
import '../StreakTracker/StrPages/HomeStreak.dart';

class CnavBar extends StatefulWidget {
  const CnavBar({Key? key}) : super(key: key);

  @override
  State<CnavBar> createState() => _CnavBarState();
}

class _CnavBarState extends State<CnavBar> {

  int currentIndex = 0;
  final List<Widget> screens = [
    HomePage(),
    // ScanPage(),
    DentistLocPage(),
    CalPage(),
    StreakHomePage(),
  ];
  final PageStorageBucket bucket  = PageStorageBucket();
  Widget currentScreen = HomePage();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),

      bottomNavigationBar:
      BottomAppBar(
        child: Container(
          color: Colors.grey[300],
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = HomePage();
                      currentIndex = 0;
                    });
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home,
                        color: currentIndex == 0 ? Colors.lightBlue : Colors.black,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: currentIndex == 0 ? Colors.blue : Colors.black,
                            fontFamily: 'Roboto_slab',
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = FaqsPage();
                      currentIndex = 1;
                    });
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.question_answer,
                        color: currentIndex == 1 ? Colors.lightBlue : Colors.black,
                      ),
                      Text(
                        'FAQs',
                        style: TextStyle(
                            color: currentIndex == 1 ? Colors.blue : Colors.black,
                            fontFamily: 'Roboto_slab',
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = DentistLocPage();
                      currentIndex = 2;
                    });
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,
                        color: currentIndex == 2 ? Colors.lightBlue : Colors.black,
                      ),
                      Text(
                        'Dentist',
                        style: TextStyle(
                            color: currentIndex == 2 ? Colors.blue : Colors.black,
                            fontFamily: 'Roboto_slab',
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = CalPage();
                      currentIndex = 3;
                    });
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month,
                        color: currentIndex == 3 ? Colors.lightBlue : Colors.black,
                      ),
                      Text(
                        'Cal',
                        style: TextStyle(
                            color: currentIndex == 3 ? Colors.blue : Colors.black,
                            fontFamily: 'Roboto_slab',
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = StreakHomePage();
                      currentIndex = 4;
                    });
                  },
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.task,
                        color: currentIndex == 2 ? Colors.lightBlue : Colors.black,
                      ),
                      Text(
                        'Tasks',
                        style: TextStyle(
                            color: currentIndex == 4 ? Colors.blue : Colors.black,
                            fontFamily: 'Roboto_slab',
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
