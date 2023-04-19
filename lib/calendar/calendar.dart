import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:laumedicalcenter/calendar/time_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  Map<DateTime, List<Map<String, String>>> events = {};
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }


  void _addEvent() async {
    final Map<String, String> eventData = {
      'name': '',
      'details': '',
      'time': ''
    }; // add time field to eventData
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Event'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
                onChanged: (text) {
                  eventData['name'] = text;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Event Details',
                ),
                onChanged: (text) {
                  eventData['details'] = text;
                },
              ),
              DropdownButtonFormField<ReservationTime>(
                decoration: const InputDecoration(
                  labelText: 'Time',
                ),
                value: eventData['time'] == ''
                    ? null
                    : ReservationTime(eventData['time']!),
                onChanged: (value) {
                  setState(() {
                    eventData['time'] = value!.time;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: ReservationTime('11:00'),
                    child: const Text('11:00 AM'),
                  ),
                  DropdownMenuItem(
                    value: ReservationTime('2:00'),
                    child: const Text('2:00 PM'),
                  ),
                  DropdownMenuItem(
                    value: ReservationTime('4:00'),
                    child: const Text('4:00 PM'),
                  ),
                  DropdownMenuItem(
                    value: ReservationTime('6:00'),
                    child: const Text('6:00 PM'),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                final eventList = events[today] ?? [];
                eventList.add(eventData);
                events[today] = eventList;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
//-------------------------------------------------------------
 
//------------------------------------------------------------
// void _addEvent() async {
//   final Map<String, String> eventData = {
//     'name': '',
//     'details': '',
//     'time': ''
//   };

//   await showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Add Event'),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Full Name',
//               ),
//               onChanged: (text) {
//                 eventData['name'] = text;
//               },
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Event Details',
//               ),
//               onChanged: (text) {
//                 eventData['details'] = text;
//               },
//             ),
//             DropdownButtonFormField<ReservationTime>(
//               decoration: const InputDecoration(
//                 labelText: 'Time',
//               ),
//               value: eventData['time'] == ''
//                   ? null
//                   : ReservationTime(eventData['time']!),
//               onChanged: (value) {
//                 setState(() {
//                   eventData['time'] = value!.time;
//                 });
//               },
//               items: [
//                 DropdownMenuItem(
//                   value: ReservationTime('11:00'),
//                   child: const Text('11:00 AM'),
//                 ),
//                 DropdownMenuItem(
//                   value: ReservationTime('2:00'),
//                   child: const Text('2:00 PM'),
//                 ),
//                 DropdownMenuItem(
//                   value: ReservationTime('4:00'),
//                   child: const Text('4:00 PM'),
//                 ),
//                 DropdownMenuItem(
//                   value: ReservationTime('6:00'),
//                   child: const Text('6:00 PM'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             final prefs = await SharedPreferences.getInstance();
//             final eventList = events[today] ?? [];
//             events[today] = eventList.cast<Map<String, String>>();

//             eventList.add(eventData);
//             events[today] = eventList;

//             final eventListAsStringList =
//                 eventList.map((e) => jsonEncode(e)).toList();
//             await prefs.setStringList(today as String, eventListAsStringList);

//             setState(() {});

//             Navigator.of(context).pop();
//           },
//           child: const Text('Save'),
//         ),
//       ],
//     ),
//   );
// }

  void _removeEvent(Map<String, String> event) {
    setState(() {
      final eventList = events[today] ?? [];
      eventList.remove(event);
      events[today] = eventList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents = events[today] ?? [];

    return Column(
      children: [
        TableCalendar(
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 15),
          lastDay: DateTime.utc(2030, 3, 15),
          rowHeight: 40,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          availableGestures: AvailableGestures.all,
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) => isSameDay(day, today),
        ),
        const SizedBox(height: 12),
        Text(
          'Selected Day = ${today.toString().split(' ')[0]}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton.icon(
            onPressed: _addEvent,
            icon: const Icon(Icons.add),
            label: const Text(
              'Add Reservation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF11574A)),
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (selectedEvents.isNotEmpty) ...[
          const Text('Events:', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          for (final event in selectedEvents)
            Card(
              color: const Color(0xFF11574A),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: ListTile(
                title: Text(
                  'Name: ${event['name']!}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Details: ${event['details']!}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Time: ${event['time']!}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                trailing: IconButton(
                  color: Colors.red,
                  icon: const Icon(Icons.delete),
                  onPressed: () => _removeEvent(event),
                ),
              ),
            ),
        ],
      ],
    );
  }
}
