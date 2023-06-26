import 'package:dental_minor/StreakTracker/datetime/date_time.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

// reference our box
final myBox = Hive.box("taskDatabase");

class TaskDataBase {
  List todayTaskList = [];
  Map<DateTime, int> heatMapDataSet = {};

  //create initial data
  void createDefaultData() {
    todayTaskList = [
      ["run", false],
      ["brush ", false],
    ];
    myBox.put("START_DATE", todaysDateFormatted());
  }

  // load data if already exists
  void loadData() {
    // if its a new day, get habit list from database
    if (myBox.get(todaysDateFormatted()) == null) {
      todayTaskList = myBox.get("CURRENT_TASK_LIST");
      //set all the habit to false since its a new day
      for (int i = 0; i < todayTaskList.length; i++) {
        todayTaskList[i][1] = false;
      }
    }

    // if tis not a new day load todays database
    else {
      todayTaskList = myBox.get(todaysDateFormatted());
    }
  }

  // update database
  void updateDatabase() {
    //update todays entry
    myBox.put(todaysDateFormatted(), todayTaskList);

    // update universal habit list  in case it changed (new habit, edit habit, delete habit)
    myBox.put("CURRENT_TASK_LIST", todayTaskList);

    // calculate % of task completed
    calTaskPercentage();

    // load heatmap

    loadHeatMap();
  }

  void calTaskPercentage() {
    int countComp = 0;

    for (int i = 0; i < todayTaskList.length; i++) {
      if (todayTaskList[i][1] == true) {
        countComp++;
      }
    }
    String percentage = todayTaskList.isEmpty
        ? '0.0'
        : (countComp / todayTaskList.length).toStringAsFixed(1);

    myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percentage);
  }


  void loadHeatMap()
   {
     DateTime startDate = createDateTimeObject(myBox.get("START_DATE"));

     // count the number of days to load
     int daysInBet = DateTime.now().difference(startDate).inDays;

     // go from start date to today and add each percentage to the dataset
     // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the database
     for (int i = 0; i < daysInBet + 1; i++) {
       String yyyymmdd = convertDateTimeToString(
         startDate.add(Duration(days: i)),
       );

       double strengthAsPercent = double.parse(
         myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
       );

       // split the datetime up like below so it doesn't worry about hours/mins/secs etc.

       // year
       int year = startDate
           .add(Duration(days: i))
           .year;

       // month
       int month = startDate
           .add(Duration(days: i))
           .month;

       // day
       int day = startDate
           .add(Duration(days: i))
           .day;

       final percentForEachDay = <DateTime, int>{
         DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
       };

       heatMapDataSet.addEntries(percentForEachDay.entries);
       print(heatMapDataSet);
     }
   }



}
