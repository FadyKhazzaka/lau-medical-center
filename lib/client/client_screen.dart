import 'package:flutter/material.dart';
import 'package:laumedicalcenter/login/login_screen.dart';
import '../calendar/schedule.dart';
import '../doctor/doctors_profile_list.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  ClientScreenState createState() => ClientScreenState();
}

class ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF11574A),
        title: const Center(child: Text('LAU-Client')),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions:  <Widget>[ IconButton(
            icon:const  Icon(Icons.email),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
         
                    return Appointments(
                      removeEvent: (Map<String, dynamic> event) {},
                      selectedEvents: const [],
                    );
                  },
                ),
              );
            },
          ),],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: const Color(0xFF11574A),
              child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF11574A),
                ),
                accountName: Text('John Doe'),
                accountEmail: Text('john.doe@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/138205019/photo/happy-healthcare-practitioner.webp?s=612x612&w=is&k=20&c=kY5CQ44NJ7szjh72pAKHqPdJxM-hoh2Hue8tq_vuJ7A='),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile option here
              },
            ),
           
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const DoctorProfileList(),
    );
  }
}
