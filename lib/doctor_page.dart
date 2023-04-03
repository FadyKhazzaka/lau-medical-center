import 'package:flutter/material.dart';
import 'package:laumedicalcenter/calendar/calendar.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({
    super.key,
  });

  @override
  DoctorScreenState createState() => DoctorScreenState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DoctorScreenState extends State<DoctorScreen
>
 {
  int _selectedIndex = 0;
  static const List<IconData> _icons = 
  [
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.notifications_outlined,
    Icons.settings_outlined,
    Icons.person_outline,
  ];

  static List<Widget> screens = <Widget>[
     StartPage(),
    const Text(
      'Search Screen',
      style: TextStyle(fontSize: 33),
    ),
    const Text(
      'Notifications Screen',
      style: TextStyle(fontSize: 33),
    ),
    const Text(
      'Settings Screen',
      style: TextStyle(fontSize: 33),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Profile Screen',
          style: TextStyle(fontSize: 33),
        ),
        IconButton(
          onPressed: () {
            // Navigator.of(navigatorKey.currentContext!).pushReplacement(
            //   MaterialPageRoute(builder: (BuildContext context) {
            //     return LoginScreen();
            //   }),
            // );
          },
          icon: const Icon(
            Icons.logout,
            size: 66,
            color: Colors.red,
          ),
        )
      ],
    ),
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
        backgroundColor: Colors.green,
        title: const Center(child: Text('LAU')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: screens.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
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
