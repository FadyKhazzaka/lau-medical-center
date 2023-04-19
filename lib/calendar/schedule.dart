

import 'package:flutter/material.dart';
import 'package:laumedicalcenter/login/login_screen.dart';

class Appointments extends StatelessWidget {
  final List<Map<String, dynamic>> selectedEvents;
  final Function(Map<String, dynamic>) removeEvent;

  const Appointments({
    Key? key,
    required this.selectedEvents,
    required this.removeEvent,
  }) : super(key: key);

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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.turn_left),
            onPressed: () {
              // Navigator.of(context).pop(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return const DoctorProfileList();
              //     },
              //   ),
              // );
            },
          ),
        ],
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
              leading: const Icon(Icons.schedule),
              title: const Text('Schedule'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Appointments(
                        removeEvent: (Map<String, dynamic> event) {
                          // your remove event function logic here
                        },
                        selectedEvents: const [],
                      );
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return  LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          if (selectedEvents.isNotEmpty) ...[
            const Text('Appointments:', style: TextStyle(fontSize: 18)),
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
                    onPressed: () => removeEvent(event),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
