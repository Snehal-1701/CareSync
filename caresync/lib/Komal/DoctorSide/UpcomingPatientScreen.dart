// import 'dart:developer';

// import 'package:caresync/Snehal/model/drappointment.dart';
// import 'package:caresync/Snehal/model/myappointment.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class UpcomingPatientScreen extends StatefulWidget {
//   const UpcomingPatientScreen({super.key, required patient});

//   @override
//   _UpcomingPatientScreenState createState() => _UpcomingPatientScreenState();
// }

// class _UpcomingPatientScreenState extends State<UpcomingPatientScreen> {

//   late Future<List<DrAppointment>> patients;
//   List<DrAppointment> patientList = [];

//   void convertList() async{
//     patientList = await patients;
//     for(int i=0; i<patientList.length; i++) {
//       log("-----------------name: ${patientList[i].name}");
//     }
//   }
//   @override
//   void initState() {
//     super.initState();
//     patients = fetchAppointments();
//     convertList();
//   }

//   Future<List<DrAppointment>> fetchAppointments() async {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     final docotrId = currentUser?.uid ?? '';
    
//     List<DrAppointment> appointmentList = [];

//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('CareSync')
//           .doc('doctors')
//           .collection('accounts')
//           .doc(docotrId)
//           .collection('appointments')
//           .get();

//       for (var doc in querySnapshot.docs) {
//         String doctorId = doc.id;
//         String doctorName = doc['doctorName'];
//         String name = doc['name'];
//         String date = doc['date'];
//         String phone = doc['phone'];
//         String time = doc['time'];
//         String status = doc['status'];

//         appointmentList.add(DrAppointment(
//           name: name,
//           date: date,
//           phone: phone,
//           time: time,
//           status: status,
//         ));
//       }
//     } catch (e) {
//       print('Error fetching appointments: $e');
//     }
//     return appointmentList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 stops: [0.0, 0.3, 0.7, 1.0],
//                 colors: [
//                   Color.fromRGBO(97, 206, 255, 220),
//                   Colors.white,
//                   Colors.white,
//                   Color.fromRGBO(14, 190, 126, 220),
//                 ],
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(top: height * 0.1),
//               child: ListView.builder(
//                 itemCount: patientList.length,
//                 itemBuilder: (context, index) {
//                   final patient = patientList[index];
//                   return Card(
//                     elevation: 5,
//                     shadowColor: Colors.grey.withOpacity(0.3),
//                     color: Colors.teal[50], // Soft teal background
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(24), // Rounded corners
//                     ),
//                     margin: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.015),
//                     child: Padding(
//                       padding: EdgeInsets.all(width * 0.03),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(width: width * 0.03),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       patient.name,
//                                       style: TextStyle(
//                                         fontSize: width * 0.055,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.teal[800],
//                                       ),
//                                     ),
                                  
//                                     _buildPatientInfo(Icons.call, 'Contact Number: ${patientList[index].phone}', Colors.green, width),
//                                     _buildPatientInfo(Icons.access_time, 'Time: ${patient.time}', Colors.orange, width),
//                                     _buildPatientInfo(Icons.calendar_month, 'Date: ${patient.date}', Colors.blue, width),
//                                     SizedBox(height: height * 0.015),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             // Handle Confirm button action
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.green,
//                                             padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.015),
//                                             textStyle: TextStyle(fontSize: width * 0.035),
//                                           ),
//                                           child: Text(
//                                             'Confirm',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 16,fontWeight:FontWeight.w600,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             // Handle Cancel button action
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: Colors.orange,
//                                             padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.015),
//                                             textStyle: TextStyle(fontSize: width * 0.035),
//                                           ),
//                                           child: Text('Cancel',style: GoogleFonts.poppins(
//                                               fontSize: 16,
//                                               fontWeight:FontWeight.w600,
//                                               color: Colors.white,
//                                             ),),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             top: height * 0.06,
//             left: width * 0.04,
//             child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                         height: screenWidth * 0.1,
//                         width: screenWidth * 0.1,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(17),
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           size: 30,
//                           Icons.arrow_back_ios_new_rounded,
//                           color: Colors.grey,
//                         )),
//                   ),
//                   SizedBox(width: screenWidth * 0.05),
//                   Center(
//                     child: Text(
//                       "Upcoming Patients",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                         fontSize: screenWidth * 0.065,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPatientInfo(IconData icon, String info, Color color, double width) {
//     return Row(
//       children: [
//         Icon(icon, color: color, size: width * 0.045),
//         SizedBox(width: width * 0.02),
//         Text(info, style: TextStyle(fontSize: width * 0.045)),
//       ],
//     );
//   }
// }

import 'dart:developer';

import 'package:caresync/Snehal/model/drappointment.dart';
import 'package:caresync/Snehal/model/myappointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingPatientScreen extends StatefulWidget {
  const UpcomingPatientScreen({super.key, required patient});

  @override
  _UpcomingPatientScreenState createState() => _UpcomingPatientScreenState();
}

class _UpcomingPatientScreenState extends State<UpcomingPatientScreen> {

  late Future<List<DrAppointment>> patients;

  @override
  void initState() {
    super.initState();
    patients = fetchAppointments();
  }

  Future<List<DrAppointment>> fetchAppointments() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final doctorId = currentUser?.uid ?? '';
    
    List<DrAppointment> appointmentList = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('CareSync')
          .doc('doctors')
          .collection('accounts')
          .doc(doctorId)
          .collection('appointments')
          .get();

      for (var doc in querySnapshot.docs) {
        String doctorName = doc['doctorName'];
        String name = doc['name'];
        String date = doc['date'];
        String phone = doc['phone'];
        String time = doc['time'];
        String status = doc['status'];

        appointmentList.add(DrAppointment(
          name: name,
          date: date,
          phone: phone,
          time: time,
          status: status,
        ));
      }
    } catch (e) {
      print('Error fetching appointments: $e');
    }
    return appointmentList;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder<List<DrAppointment>>(
        future: patients,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Upcoming Patients'));
          } else {
            List<DrAppointment> patientList = snapshot.data!;
            return Stack(
              children: [
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
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: ListView.builder(
                      itemCount: patientList.length,
                      itemBuilder: (context, index) {
                        final patient = patientList[index];
                        return Card(
                          elevation: 5,
                          shadowColor: Colors.grey.withOpacity(0.3),
                          color: Colors.teal[50], // Soft teal background
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24), // Rounded corners
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04, vertical: screenHeight * 0.015),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: screenWidth * 0.03),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            patient.name,
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.055,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.teal[800],
                                            ),
                                          ),
                                          _buildPatientInfo(
                                            Icons.call, 
                                            'Contact Number: ${patient.phone}', 
                                            Colors.green, 
                                            screenWidth
                                          ),
                                          _buildPatientInfo(
                                            Icons.access_time, 
                                            'Time: ${patient.time}', 
                                            Colors.orange, 
                                            screenWidth
                                          ),
                                          _buildPatientInfo(
                                            Icons.calendar_month, 
                                            'Date: ${patient.date}', 
                                            Colors.blue, 
                                            screenWidth
                                          ),
                                          SizedBox(height: screenHeight * 0.015),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Handle Confirm button action
                                                  
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.green,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth * 0.06, 
                                                      vertical: screenHeight * 0.015),
                                                  textStyle: TextStyle(fontSize: screenWidth * 0.035),
                                                ),
                                                child: Text(
                                                  'Confirm',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Handle Cancel button action
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.orange,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth * 0.06, 
                                                      vertical: screenHeight * 0.015),
                                                  textStyle: TextStyle(fontSize: screenWidth * 0.035),
                                                ),
                                                child: Text(
                                                  'Cancel',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.06,
                  left: screenWidth * 0.04,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            size: 30,
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Center(
                        child: Text(
                          "Upcoming Patients",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.065,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildPatientInfo(IconData icon, String info, Color color, double screenWidth) {
    return Row(
      children: [
        Icon(icon, color: color, size: screenWidth * 0.045),
        SizedBox(width: screenWidth * 0.02),
        Text(info, style: TextStyle(fontSize: screenWidth * 0.045)),
      ],
    );
  }
}
