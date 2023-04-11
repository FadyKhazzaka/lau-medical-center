import 'package:flutter/material.dart';
import '../full-screen/full_screen.dart';
import '../models/doctor_model_list.dart';

class DoctorProfileList extends StatefulWidget {
  const DoctorProfileList({super.key});

  @override
  State<DoctorProfileList> createState() => _DoctorProfileListState();
}

class _DoctorProfileListState extends State<DoctorProfileList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) {
          final doctor = doctors[index];

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                    height: 16.0), // Add spacing between each doctor's profile
                ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreen(imageUrl: doctor.profilePhotoUrl,),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(doctor.profilePhotoUrl),
                    ),
                  ),
                  title: Text(doctor.name),
                  subtitle: Text(doctor.subtitle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to the doctor's profile page
                  },
                ),
                const Divider(
                    height:
                        1.0), // Add a horizontal divider between each doctor's profile
              ],
            ),
          );
        },
      ),
    );
  }
}
