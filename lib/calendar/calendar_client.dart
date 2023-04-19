import 'package:flutter/material.dart';
import 'package:laumedicalcenter/calendar/calendar.dart';

import '../doctor/doctors_profile_list.dart';


class CalendarClient extends StatefulWidget {
  const CalendarClient({super.key});

  @override
  State<CalendarClient> createState() => _CalendarClientState();
}

class _CalendarClientState extends State<CalendarClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color(0xFF11574A),
        title: const Center(child: Text('LAU-Client')),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const DoctorProfileList();
                },
              ),
            );
          },
        ),
      ),
      body: const CalendarPage(),);
  }
}