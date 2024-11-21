import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:caresync/Komal/ChatApp/Messages.dart';
import 'package:caresync/Komal/Notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'Drawer.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State with SingleTickerProviderStateMixin {

  late Future<List<Map<String, String>>> patients;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isDarkMode = false;
  String _patientName = '';
  late AnimationController _controller;

  List<String> patientKey = [
    'Total Patients',
    'Accepted Patients',
    'Upcoming Patients',
    'Rejected Patients'
  ];
  int totalPatients = 0;
  int acceptedPatients = 0;
  int rejectedPatients = 0;
  int upcomingPatients = 0;
  List<Map<String, int>> patientCount = [
    {'Total Patients': 0},
    {'Accepted Patients': 0},
    {'Upcoming Patients': 0},
    {'Rejected Patients': 0},
  ];
  Map<String, double> patientCountMap = {
    'Total Patients': 0,
    'Accepted Patients': 0,
    'Upcoming Patients': 0,
    'Rejected Patients': 0,
  };

  @override
  void initState() {
    log("initstate");
    super.initState();
    patients = fetchAppointments();
    assignData();
    _loadDoctorData();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);
  }

  Future<List<Map<String, String>>> fetchAppointments() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final doctorId = currentUser?.uid;

    // Ensure currentUser is not null and doctorId is valid
    if (doctorId == null || doctorId.isEmpty) {
      print('Error: No logged-in user or invalid doctor ID.');
      return [];
    }

    List<Map<String, String>> appointmentList = [];

    try {
      // Fetch the appointments collection
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('CareSync')
          .doc('doctors')
          .collection('accounts')
          .doc(doctorId)
          .collection('appointments')
          .get();

      // Process each document in the snapshot
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Ensure 'status' field exists and is a String
        if (data.containsKey('status') && data['status'] is String) {
          String status = data['status'];
          appointmentList.add({'status': status});
        } else {
          print(
              'Document ${doc.id} is missing "status" or it is not a String.');
        }
      }
    } catch (e) {
      print('Error fetching appointments: $e');
    }
    setState(() {
      
    });
    return appointmentList;
  }

  void assignData() async {
    try {
      // Await the resolution of the Future
      List<Map<String, String>> patientData = await patients;

      // Iterate over the resolved list
      totalPatients = patientData.length;
      for (var patient in patientData) {
        log("--------------${patient['status']}");
        if (patient['status'] == 'pending') {
          upcomingPatients++;
        } else if (patient['status'] == 'Accepted') {
          acceptedPatients++;
        } else if (patient['status'] == 'Rejected') {
          rejectedPatients++;
        }
        setState(() {
          
        });
      }

      log("Accepted patient count _____${acceptedPatients}");
      log("Total patient count _____${totalPatients}");
      log("Rejected patient count _____${rejectedPatients}");
      log("Upcoming patient count _____${upcomingPatients}");
      patientCount[0]['Total Patients'] = totalPatients;
      patientCount[1]['Accepted Patients'] = acceptedPatients;
      patientCount[2]['Upcoming Patients'] = upcomingPatients;
      patientCount[3]['Rejected Patients'] = rejectedPatients;
      // Assign values to the map
      patientCountMap['Total Patients'] = totalPatients.toDouble();
      patientCountMap['Accepted Patients'] = acceptedPatients.toDouble();
      patientCountMap['Upcoming Patients'] = upcomingPatients.toDouble();
      patientCountMap['Rejected Patients'] = rejectedPatients.toDouble();

      log("Patient count map: $patientCountMap");

      setState(() {});
    } catch (e) {
      print('Error assigning data: $e');
    }
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
        DocumentSnapshot snapshot = await _firestore
            .collection('CareSync')
            .doc('doctors')
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
      print('Error fetching doctor data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final gradientList = <List<Color>>[
      [
        Color.fromRGBO(10, 201, 244,1), 
        Color.fromRGBO(255, 255, 255,0.6),
      ],
      [
        Color.fromRGBO(129, 182, 205, 1),
        Color.fromRGBO(91, 253, 199, 1),
      ],
      [
        Color.fromRGBO(104, 238, 190, 1), // Base color
        Color.fromRGBO(104, 238, 190,0.8),
      ]
    ];

    return Scaffold(
      drawer: AppDrawer(
        isDarkMode: isDarkMode,
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
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
              );
            },
          ),
          SpinPerfect(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, height * 0.06, 0, 0),
              child: Column(
                children: [
                  _buildAppBar(width),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildWelcomeSection(width, height),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            decoration: const BoxDecoration(
                              //color: Colors.white10.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                            height: height * 0.7,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 30,
                              ),
                              itemCount: patientCount.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 200,
                                  width: 200,
                                  // child:
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(
                                            104, 238, 190, 1), // Base color
                                        Color.fromRGBO(104, 238, 190,
                                            0.8), // Slightly transparent shade
                                        Color.fromRGBO(255, 255, 255,
                                            0.5), // Light highlight for shine
                                      ],
                                      begin: Alignment
                                          .topLeft, // Start of the gradient
                                      end: Alignment
                                          .bottomRight, // End of the gradient
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        15), // Rounded corners
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.teal
                                            .withOpacity(0.3), // Shadow color
                                        offset: Offset(5, 5), // Shadow position
                                        blurRadius: 10, // Shadow blur
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          patientKey[index],
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(height:10),
                                      Positioned(
                                        top: 100,
                                        left: 26,
                                        child: Container(
                                          padding: const EdgeInsets.all(25.0),
                                          height: 100,
                                          width: 100,
                                          // decoration: const BoxDecoration(
                                          //     shape: BoxShape.circle,
                                          //     color: Color.fromRGBO(
                                          //         10, 201, 244, 1)),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape
                                                .circle, // Makes the container circular
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(10, 201, 244,1), // Base color
                                                Color.fromRGBO(255, 255, 255,0.6), // Lighter color for shiny effect
                                              ],
                                              begin: Alignment
                                                  .topLeft, // Start of the gradient
                                              end: Alignment
                                                  .bottomRight, // End of the gradient
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    10,
                                                    201,
                                                    244,
                                                    0.5), // Add glow-like shadow
                                                blurRadius: 10,
                                                spreadRadius: 5,
                                                offset: Offset(
                                                    2, 2), // Shadow offset
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            "${patientCount[index][patientKey[index]]}",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: PieChart(
                              chartRadius: MediaQuery.of(context).size.width / 1.5,
                              dataMap: patientCountMap,
                              // chartType: ChartType.ring,
                              legendOptions: const LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.bottom,
                                showLegends: true,
                                // legendShape: _BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              baseChartColor: Colors.grey[300]!,
                              gradientList: gradientList,
                              emptyColorGradient: const [
                                Color(0xff6c5ce7),
                                Colors.blue,
                              ],
                            ),
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

  Widget _buildAppBar(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 32,
                color: Colors.black87,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        const SizedBox(
          width: 90,
        ),
        Text(
          'CareSync',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            size: 32,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationApp()),
            );
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.chat_outlined,
            size: 32,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MessageScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildWelcomeSection(double width, double height) {
    return Container(
      width: width * 0.9,
      height: height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Dr. $_patientName !',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: Text(
                  ' How can we assist you today?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: width * 0.39,
            height: height * 0.28,
            child: Image.asset(
              'assets/png/drHome.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(int index, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1.5,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
