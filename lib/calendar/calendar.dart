import 'package:flutter/material.dart';
import 'package:laumedicalcenter/calendar/complex_example.dart';
import 'package:table_calendar/table_calendar.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text(
                'Calendar',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TableComplexExample()),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}


// class StartPage extends StatefulWidget {
//    const StartPage({super.key});
// // DateTime today = DateTime.now();
//   @override
//   State<StartPage> createState() => _StartPageState();
  
// }

// class _StartPageState extends State<StartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           child: TableCalendar(
//               focusedDay: DateTime.now(), firstDay: DateTime.utc(2010, 10, 15), lastDay: DateTime.utc(2030, 3, 15)),
//         )
//       ],
//     );
//   }
// }
