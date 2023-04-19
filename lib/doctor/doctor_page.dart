import 'package:flutter/material.dart';
import 'package:laumedicalcenter/calendar/calendar.dart';
import 'package:laumedicalcenter/login/login_screen.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  DoctorScreenState createState() => DoctorScreenState();
}

class DoctorScreenState extends State<DoctorScreen> {
  static List<Widget> screens = <Widget>[
    const CalendarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF11574A),
        title: const Center(child: Text('LAU')),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return LoginScreen();
                },
              ),
            );
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: CalendarPage(),
        ),
      ),
    );
  }
}
