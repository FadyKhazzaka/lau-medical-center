import 'package:flutter/material.dart';
import 'package:laumedicalcenter/login/login_screen.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF11574A),
        title: const Center(child: Text('LAU-Client')),
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
      body: const DoctorProfileList(),
    );
  }
}
