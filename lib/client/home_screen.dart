import 'package:flutter/material.dart';

import '../calendar/schedule.dart';
import '../login/login_screen.dart';
import 'client_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF11574A),
          title: const Center(child: Text('LAU-Home-Screen')),
          automaticallyImplyLeading: false,
        ),
        body:

            //     Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Colors.grey.shade300,
            //         const Color(0xFF11574A),
            //       ],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //       const  Text('Rizk Hospital' , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black ,fontSize: 25),),
            //         ClipOval(
            //           child: Image.network(
            //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8xHaTpJt3xsa3pKVOz15jv1l4VwB0c7SPpbWjZjvwYY5A5Dm9yWKg2h7LfcHx-i9XRic&usqp=CAU',
            //             fit: BoxFit.fill,
            //             height: 200,
            //             width: 400,
            //           ),
            //         ),
            //         const SizedBox(height: 20),
            //       const  Text('St.John Hospital', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black ,fontSize: 25),),
            //         ClipOval(
            //           child: Image.network(
            //             'https://www.laumcrh.com/images/ShareLogo.jpg?v=20230419',
            //             fit: BoxFit.fitHeight,
            //             height: 200,
            //             width: 400,
            //           ),
            //         ),
            //         const SizedBox(height: 20),
            //         IconButton(
            //           icon: const Icon(Icons.email),
            //           onPressed: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (BuildContext context) {
            //                   return const ClientScreen();
            //                 },
            //               ),
            //             );
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
             
          
                Colors.grey.shade300,
           
                Colors.grey.shade300,
              
                Colors.grey.shade300,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Rizk Hospital',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF11574A),
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8xHaTpJt3xsa3pKVOz15jv1l4VwB0c7SPpbWjZjvwYY5A5Dm9yWKg2h7LfcHx-i9XRic&usqp=CAU',
                    fit: BoxFit.fill,
                    height: 120,
                    width: 400,
                  ),
                ),
                const SizedBox(height: 45),
                const Text(
                  'St. John Hospital',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF11574A),
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://www.laumcrh.com/images/ShareLogo.jpg?v=20230419',
                    fit: BoxFit.fill,
                    height: 120,
                    width: 400,
                  ),
                ),
                const SizedBox(height: 20),
                IconButton(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ClientScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
