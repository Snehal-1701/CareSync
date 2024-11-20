import 'package:caresync/Snehal/appointment/myappointments.dart';
import 'package:caresync/Snehal/landingpage.dart';
import 'package:caresync/Snehal/medical_records/medical_record_screen_1.dart';
import 'package:caresync/Tejas/Ambulance/MyBookings.dart';
import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
import 'package:caresync/Tejas/PatientSide.dart/Orders.dart';
import 'package:caresync/Tejas/PatientSide.dart/PatientProfile.dart';
import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const AppDrawer({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int selectedIndex = -1;
  late AnimationController _controller;

  void _onItemTapped(int index, BuildContext context, Widget page) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  String _patientName = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // This class must extend TickerProviderStateMixin
      duration: const Duration(seconds: 1),
    )..forward();
    _loadPatientData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadPatientData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Fetch patient data from Firestore
        DocumentSnapshot snapshot = await _firestore
            .collection('CareSync')
            .doc('patients')
            .collection('accounts')
            .doc(user.uid)
            .get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

          setState(() {
            _patientName = data['name'];
          });
        }
      }
    } catch (e) {
      print('Error fetching patient data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.fromLTRB(16.0, 70, 16, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PatientProfilePage()),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          radius: 30,
                          child: const Icon(Icons.person,
                              size: 40, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_patientName,
                              style: GoogleFonts.lato(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                _buildDrawerItem(Icons.calendar_today, 'My Appointments',
                    context, const Myappointments(), 0),
                _buildDrawerItem(
                    Icons.list, 'My Orders', context, const OrdersPage(), 1),
                _buildDrawerItem(
                    Icons.shopping_cart, 'My Cart', context, const Cart(), 2),
                _buildDrawerItem(
                    Icons.favorite, 'Wishlist', context, const Wishlist(), 3),
                _buildDrawerItem(Icons.medical_services, 'Medical Records',
                    context, const RecordScreen1(), 4),
                    _buildDrawerItem(Icons.collections_bookmark, 'My Bookings',
                    context, MyAmbulanceBookingsScreen(), 5),
                const Divider(),
                ListTile(
                  leading: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isDarkMode
                          ? Colors.grey[800]
                          : Colors.yellow[700],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                        widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: widget.isDarkMode ? Colors.amber : Colors.blue),
                  ),
                  title:
                      Text('Dark Mode', style: GoogleFonts.lato(fontSize: 16)),
                  trailing: Switch(
                    value: widget.isDarkMode,
                    onChanged: (_) => widget.toggleTheme(),
                  ),
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
                              onPressed: () async {
                                Navigator.of(context).pop();
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                //await prefs.clear(); // Clear all saved data
                                await prefs.setBool('isLoggedIn', false);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LandingPage()));
                              },
                              child: const Text(
                                'Ok',
                                style: TextStyle(color: Colors.green),
                              ),
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

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context,
      Widget page, int index) {
    return ListTile(
      leading: Icon(
        icon,
        color: selectedIndex == index
            ? const Color.fromRGBO(14, 190, 127, 1)
            : Colors.black,
      ),
      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: selectedIndex == index
              ? const Color.fromRGBO(14, 190, 127, 1)
              : Colors.black,
        ),
      ),
      onTap: () => _onItemTapped(index, context, page),
    );
  }
}
