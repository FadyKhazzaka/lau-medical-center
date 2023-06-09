import 'package:flutter/material.dart';
import 'package:laumedicalcenter/calendar/time_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

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
//------------------------------------------------------------------
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
//------------------------------------------------------------------------

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
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF11574A), // set background color
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
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
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF11574A), // set background color to green
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _removeEvent(Map<String, String> event) {
    setState(
      () {
        final eventList = events[today] ?? [];
        eventList.remove(event);
        events[today] = eventList;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents = events[today] ?? [];

    return SingleChildScrollView(
      child: Column(
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
          const SizedBox(height: 20),
          SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton.icon(
              onPressed: _addEvent,
              icon: const Icon(Icons.add, size: 20),
              label: const Text(
                'Book your Appointment',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF11574A)),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 12.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          if (selectedEvents.isNotEmpty) ...[
            const Text('Appointments:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            for (final event in selectedEvents)
              Card(
                color: const Color(0xFFEDEDED),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                elevation: 4,
                shadowColor: Colors.grey,
                child: ListTile(
                  title: Text(
                    'Name: ${event['name']!}',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Details: ${event['details']!}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Time: ${event['time']!}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
