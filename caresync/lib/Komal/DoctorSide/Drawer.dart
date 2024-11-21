import 'package:caresync/Komal/DoctorSide/DoctorProfile.dart';
import 'package:caresync/Komal/DoctorSide/PatientScreen.dart';
import 'package:caresync/Snehal/landingpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UpcomingPatientScreen.dart';
import 'rejectedpatients.dart';

class AppDrawer extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const AppDrawer({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late bool _isDarkMode;
  late AnimationController _controller;

  String _doctorName = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // This class must extend TickerProviderStateMixin
      duration: const Duration(seconds: 1),
    )..forward();
    _loadDoctorData();
    _isDarkMode = widget.isDarkMode;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadDoctorData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Fetch patient data from Firestore
        DocumentSnapshot snapshot = await _firestore
            .collection('CareSync')
            .doc('doctors')
            .collection('accounts')
            .doc(user.uid)
            .get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

          setState(() {
            _doctorName = data['name'];
          });
        }
      }
    } catch (e) {
      print('Error fetching doctor data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            //color: const Color(0xFFE0F7FA),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(
                      const Color.fromRGBO(97, 206, 255, 220),
                      const Color.fromRGBO(14, 190, 126, 220),
                      _controller.value)!,
                  Colors.white,
                  Colors.white,
                  Color.lerp(
                      const Color.fromRGBO(97, 206, 255, 220),
                      const Color.fromRGBO(14, 190, 126, 220),
                      1 - _controller.value)!,
                ],
              ),
            ),
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
                              builder: (context) => const DoctorProfilePage(),
                            ),
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
                            _doctorName,
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
              
                 _buildDrawerItem(Icons.block, 'Rejected Patients', context, width),
                   const Divider(),
                // ListTile(
                //   leading: AnimatedContainer(
                //     duration: const Duration(milliseconds: 500),
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color:
                //           _isDarkMode ? Colors.grey[800] : Colors.yellow[700],
                //     ),
                //     padding: const EdgeInsets.all(8),
                //     child: Icon(
                //       _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                //       color: _isDarkMode ? Colors.white : Colors.black,
                //     ),
                //   ),
                //   title: Text('Dark Mode',
                //       style: GoogleFonts.lato(fontSize: width * 0.045)),
                //   trailing: Switch(
                //     value: _isDarkMode,
                //     onChanged: (value) {
                //       setState(() {
                //         _isDarkMode = value;
                //       });
                //       widget.toggleTheme();
                //     },
                //   ),
                // ),
                // const Divider(),
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
                              onPressed: () async {
                                Navigator.of(context).pop();
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.clear(); // Clear all saved data
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LandingPage()));
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
          );
        },
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
        } else if (title == 'Rejected Patients') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RejectedPatientListScreen()),
          );
        } else if (title == 'Upcoming Patients') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UpcomingPatientScreen(
                
              ),
            ),
          );
        } 
      },
    );
  }
}
