import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DailyTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const DailyTile(
      {Key? key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.settingsTapped,
      required this.deleteTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Colors.grey.shade700,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(9),
            ),
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.redAccent,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(9),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(

            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                // checkbox
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Text(
                  taskName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
