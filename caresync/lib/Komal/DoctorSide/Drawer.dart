import 'package:caresync/Komal/DoctorSide/DoctorProfile.dart';
import 'package:caresync/Komal/DoctorSide/PatientScreen.dart';
import 'package:caresync/Snehal/landingpage.dart';
import 'package:caresync/Tejas/Login&Sigup/Doctor/SignIn.dart';
import 'package:caresync/Tejas/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UpcomingPatientScreen.dart';

class AppDrawer extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const AppDrawer({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Container(
        color: const Color(0xFFE0F7FA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.04, height * 0.1, width * 0.04, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoctorProfilePage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 30,
                      child: const Icon(Icons.person,
                          size: 40, color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Sachin',
                        style: GoogleFonts.lato(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            _buildDrawerItem(Icons.people, 'Patients', context, width),
            _buildDrawerItem(
                Icons.schedule, 'Upcoming Patients', context, width),
            const Divider(),
            ListTile(
              leading: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDarkMode ? Colors.grey[800] : Colors.yellow[700],
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: isDarkMode ? Colors.white : Colors.black),
              ),
              title: Text('Dark Mode',
                  style: GoogleFonts.lato(fontSize: width * 0.045)),
              trailing:
                  Switch(value: isDarkMode, onChanged: (_) => toggleTheme()),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout', style: GoogleFonts.lato(fontSize: 16)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Log Out',
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'Are you sure you want to logout?',
                        style: GoogleFonts.lato(fontSize: 16),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'Ok',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LandingPage()),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData icon, String title, BuildContext context, double width) {
    return ListTile(
      leading: Icon(icon, size: width * 0.06),
      title: Text(title, style: GoogleFonts.lato(fontSize: width * 0.045)),
      onTap: () {
        Navigator.pop(context);
        if (title == 'Patients') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PatientListScreen()),
          );
        } else if (title == 'Upcoming Patients') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UpcomingPatientScreen(
                patient: null,

                // patient: patients[0],
              ),
            ),
          );
        }
      },
    );
  }
}
