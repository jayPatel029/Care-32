
import 'package:dental_minor/CalendarEventTask/CalPages/eventsEditing.dart';
import 'package:dental_minor/router/constraints.dart';
import 'package:dental_minor/pages/LoginOrRegister.dart';
import 'package:flutter/material.dart';
import 'package:dental_minor/pages/pages.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings)
  {
    switch (settings.name)
    {

      case homePageRoute:
        return MaterialPageRoute(builder: (context) => HomePage());

      case profileRoute:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case loginOrRegisterRoute:
        return MaterialPageRoute(builder: (context) => LoginOrRegister());

      case calendarRoute:
        return MaterialPageRoute(builder: (context) => CalPage());

      case eventsEditingRoute:
        return MaterialPageRoute(builder: (context) => EventEditingPage());

      case homeStreakRoute:
        return MaterialPageRoute(builder: (context) => StreakHomePage());

      case denLocationRoute:
        return MaterialPageRoute(builder: (context) => DentistLocPage());

      case faqRoute:
        return MaterialPageRoute(builder: (context) => FaqsPage());
      // case scannerRoute:
      //   return MaterialPageRoute(builder: (context) => ScanPage());
      default:

    }
    return MaterialPageRoute(builder: (context) =>
        Scaffold(
          body: Text('No Routes Defined'),
        ),
    );
  }

}
