import 'package:dental_minor/StreakTracker/StrModel/monthly_summ.dart';
import 'package:dental_minor/StreakTracker/data/task_database.dart';
import 'package:dental_minor/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../StrWidgets/DailyTile.dart';
import '../StrWidgets/myAlertBox.dart';
import '../StrWidgets/myFab.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StreakHomePage extends StatefulWidget {
  const StreakHomePage({Key? key}) : super(key: key);

  @override
  State<StreakHomePage> createState() => _StreakHomePageState();
}

class _StreakHomePageState extends State<StreakHomePage> {
  final _newTaskNameController = TextEditingController();

  TaskDataBase db = TaskDataBase();
  final _myBox = Hive.box("taskDatabase");

  @override
  void initState() {
    // if there is no current data i.e user is first time using the app
    // then create default data
    if (_myBox.get("CURRENT_TASK_LIST") == null) {
      db.createDefaultData();
    }
    // there already exists data, this is not th first time
    else {
      db.loadData();
    }

    // update database

    db.updateDatabase();

    super.initState();
  }

  //bool to control task Completed
  bool taskCompleted = true;

  //checkbox was tapped
  void checkBoxTapped(bool? value, index) {
    setState(() {
      db.todayTaskList[index][1] = value;
    });
    db.updateDatabase();
  }

  // Create New Task
  void createNewTask() {
    // show alert dialog box to add new task
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newTaskNameController,
            onSave: saveNewTask,
            onCancel: cancelDialogBox,
            hintText: 'Add new task',
          );
        });
  }

  // save new task
  void saveNewTask() {
    // add new task in the list
    setState(() {
      db.todayTaskList.add([_newTaskNameController.text, false]);
    });
    // clear dialog box
    _newTaskNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();

    db.updateDatabase();
  }

  // cancel new task
  void cancelDialogBox() {
    //clear dialog box
    _newTaskNameController.clear();
    //pop d box
    Navigator.of(context).pop();
  }

  // open task settings to edit
  void openTaskSettings(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newTaskNameController,
            onSave: () => saveExistingTask(index),
            onCancel: cancelDialogBox,
            hintText: db.todayTaskList[index][0],
          );
        });
  }

  // save existing/changed task
  void saveExistingTask(int index) {
    setState(() {
      db.todayTaskList[index][0] = _newTaskNameController.text;
    });
    _newTaskNameController.clear();
    Navigator.pop(context);

    db.updateDatabase();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.todayTaskList.removeAt(index);
    });

    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: () => createNewTask(),
      ),
      appBar: CustomAppbar(
        title: 'Daily Tasks',
      ),
      body: ListView(
        children: [
          // monthly summary heatmap
          MonthlySummary(
            dataset: db.heatMapDataSet,
            startDate: myBox.get("START_DATE"),
          ),

          // list of tasks

          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: db.todayTaskList.length,
              itemBuilder: (context, index) {
                return DailyTile(
                  taskName: db.todayTaskList[index][0],
                  taskCompleted: db.todayTaskList[index][1],
                  onChanged: (value) => checkBoxTapped(value, index),
                  settingsTapped: (context) => openTaskSettings(index),
                  deleteTapped: (context) => deleteTask(index),
                );
              }),
        ],
      ),
    );
  }
}
