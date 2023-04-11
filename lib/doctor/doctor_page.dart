import 'package:flutter/material.dart';
import 'package:laumedicalcenter/calendar/calendar.dart';

import 'doctors_profile_list.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  DoctorScreenState createState() => DoctorScreenState();
}

class DoctorScreenState extends State<DoctorScreen> {
  int _selectedIndex = 0;
  static const List<IconData> _icons = [
    Icons.people,
    Icons.home_outlined,
  ];

  static List<Widget> screens = <Widget>[
    const DoctorProfileList(),
    const CalendarPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF11574A),
        title: const Center(child: Text('LAU')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: screens.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF11574A),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          _icons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(
              _icons[index],
              color: _selectedIndex == index ? Colors.white : Colors.black,
              size: 30,
            ),
            label: '',
          ),
        ),
      ),
    );
  }
}
