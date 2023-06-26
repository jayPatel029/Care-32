
import 'package:flutter/material.dart';
import 'package:dental_minor/widgets/widgets.dart';


class DentistLocPage extends StatelessWidget {
  const DentistLocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: CustomAppbar(title: "Dentists",),
        body: Text("Location PAge")
      ),

    );
  }
}
