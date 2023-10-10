import 'package:dental_minor/theme.dart';
import 'package:dental_minor/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:dental_minor/router/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {

  // initialize hive
  await Hive.initFlutter();
  // open a box
  await Hive.openBox("taskDatabase");

  runApp(const minor());
}

class minor extends StatelessWidget {
  const minor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme(),
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        home: MainPage(),
    );
  }
}
