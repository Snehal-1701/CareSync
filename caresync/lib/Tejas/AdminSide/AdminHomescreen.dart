import 'package:caresync/Snehal/landingpage.dart';
import 'package:caresync/Tejas/AdminSide/AddAmbulance.dart';
import 'package:caresync/Tejas/AdminSide/AdimiJson.dart';
import 'package:caresync/Tejas/AdminSide/AmbulancesList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MedicalStoresList.dart';
import 'AddMedicalStores.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool isDrawerOpen = false;

  String _adminName = '';

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Fetch patient data from Firestore
        DocumentSnapshot documentSnapshot =
          await _firestore.collection('CareSync').doc('admin').get();

        if (documentSnapshot.exists) {
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

          setState(() {
           _adminName = data['name'] ?? 'Admin';
          });
        }
      }
    } catch (e) {
      print('Error fetching admin data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.3, 0.7, 1.0],
                colors: [
                  Color.fromRGBO(97, 206, 255, 220),
                  Colors.white,
                  Colors.white,
                  Color.fromRGBO(14, 190, 126, 220),
                ],
              ),
            ),
          ),

          Column(
            children: [
              // Custom AppBar
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDrawerOpen = !isDrawerOpen;
                        });
                      },
                      child: const Icon(Icons.menu,
                          size: 30, color: Colors.black45),
                    ),
                    Text(
                      "Admin Dashboard",
                      style: TextStyle(
                        color: Colors.teal[700],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.s,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminJsonManager()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(20),
                        height: 120,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.teal[200],
                          gradient: LinearGradient(
                            colors: [Colors.teal[300]!, Colors.teal[100]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.local_hospital,
                                size: 40, color: Colors.white),
                            Text(
                              "Medical Stores",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AmbulancesList()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(20),
                        height: 120,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.teal[200],
                          gradient: LinearGradient(
                            colors: [Colors.teal[300]!, Colors.teal[100]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.local_shipping,
                                size: 40, color: Colors.white),
                            Text(
                              "Ambulances",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Custom Drawer Overlay
          if (isDrawerOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  isDrawerOpen = false;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.7),
              ),
            ),

          // Custom Drawer Content
          if (isDrawerOpen)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 250,
                color: const Color.fromRGBO(14, 190, 126, 220),
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.admin_panel_settings,
                              size: 60, color: Colors.white),
                          const SizedBox(height: 10),
                          Text(
                            _adminName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddMedicalStorePage()),
                        );
                        setState(() => isDrawerOpen = false); // Close drawer
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Icon(Icons.local_hospital, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Add Medical Store",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAmbulancePage()),
                        );
                        setState(() => isDrawerOpen = false); // Close drawer
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Icon(Icons.local_shipping, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Add Ambulance",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          await prefs.clear(); // Clears all saved data, including 'isLoggedIn'

                        // Navigate back to the login screen
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LandingPage()),
                          (route) => false, // Removes all routes
                        );
                        setState(() => isDrawerOpen = false); // Close drawer
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Logout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
