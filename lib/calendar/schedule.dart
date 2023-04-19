

import 'package:flutter/material.dart';

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
      appBar: AppBar(),
      drawer: Drawer(),
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
