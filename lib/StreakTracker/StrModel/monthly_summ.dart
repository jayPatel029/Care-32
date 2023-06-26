import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:dental_minor/StreakTracker/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? dataset;
  final String startDate;

  const MonthlySummary(
      {Key? key, required this.dataset, required this.startDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: dataset,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[700],
        textColor: Colors.black,
        showText: false,
        scrollable: true,
        size: 30,
        colorsets: {
          1: Color.fromARGB(40, 180, 2, 8),
          2: Color.fromARGB(60, 180, 2, 8),
          3: Color.fromARGB(80, 180, 2, 8),
          4: Color.fromARGB(100, 180, 2, 8),
          5: Color.fromARGB(120, 180, 2, 8),
          6: Color.fromARGB(140, 180, 2, 8),
          7: Color.fromARGB(160, 180, 2, 8),
          8: Color.fromARGB(180, 180, 2, 8),
          9: Color.fromARGB(200, 180, 2, 8),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
