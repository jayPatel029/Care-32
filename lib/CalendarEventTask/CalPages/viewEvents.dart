import 'package:dental_minor/CalendarEventTask/CalModel/event.dart';
import 'package:dental_minor/CalendarEventTask/CalPages/eventsEditing.dart';
import 'package:dental_minor/CalendarEventTask/CalModel/event_provider.dart';
import 'package:dental_minor/CalendarEventTask/CalModel/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey[300],
    appBar: AppBar(
      leading: CloseButton(),
      actions: buildViewingActions(context, event),
    ),
    body: ListView(
      padding: EdgeInsets.all(32),
      children: <Widget>[
        buildDateTime(event),
        SizedBox(height: 32),
        Text(
          event.title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black, fontSize: 24),
        ),
        const SizedBox(height: 24),
        Text(
          event.description,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
        ),
      ],
    ),
  );

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to),
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    final styleTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    final styleDate = TextStyle(fontSize: 18);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(title, style: styleTitle)),
          Text(Utils.toDateTime(date), style: styleDate),
        ],
      ),
    );
  }

  List<Widget> buildViewingActions(BuildContext context, Event event) => [
    IconButton(
      icon: Icon(Icons.edit),
      onPressed: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => EventEditingPage(event: event),
        ),
      ),
    ),
    IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.deleteEvent(event);
        Navigator.of(context).pop();
      },
    ),
  ];
}
