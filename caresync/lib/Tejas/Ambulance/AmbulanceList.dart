import 'package:caresync/Tejas/Ambulance/AmbulanceDetails.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulanceListScreen extends StatefulWidget {
  final String type;

  const AmbulanceListScreen({super.key, required this.type});

  @override
  _AmbulanceListScreenState createState() => _AmbulanceListScreenState();
}

class _AmbulanceListScreenState extends State<AmbulanceListScreen> {
  final DatabaseReference _ambulancesRef = FirebaseDatabase.instance.ref().child('CareSync/ambulances');
  List<Map<String, String>> _ambulances = [];

  @override
  void initState() {
    super.initState();

    // Listen for changes in the ambulance type node
    _ambulancesRef.child(widget.type).onChildAdded.listen((event) {
      final ambulanceData = Map<String, dynamic>.from(event.snapshot.value as Map);
      setState(() {
        _ambulances.add({
          'id': event.snapshot.key ?? 'N/A', // Fetch the unique ID of the ambulance
          'name': ambulanceData['name'] ?? 'N/A',
          'phone': ambulanceData['phone'] ?? 'N/A',
          'location': ambulanceData['location'] ?? 'Unknown',
          'charges': ambulanceData['charges']?.toString() ?? 'N/A',
          'type': widget.type, // Pass the type of ambulance
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.white, Colors.redAccent],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenHeight * 0.06, screenWidth * 0.04, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                        size: screenWidth * 0.06,
                      ),
                    ),
                  ),
                  Text(
                    'Ambulance List',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: _ambulances.length,
                  itemBuilder: (context, index) {
                    Map<String, String> ambulance = _ambulances[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AmbulanceDetailsScreen(
                              ambulanceId: ambulance['id']!,
                              ambulanceType: ambulance['type']!,
                            ),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.02,
                          horizontal: screenWidth * 0.04,
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: screenWidth * 0.015,
                              offset: Offset(0, screenWidth * 0.01),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.local_hospital, size: screenWidth * 0.1, color: Colors.redAccent),
                            SizedBox(width: screenWidth * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ambulance['name']!,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.02),
                                  Text(
                                    "Phone No: ${ambulance['phone']}",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.02),
                                  Text(
                                    "Location: ${ambulance['location']}",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: screenWidth * 0.02),
                                  Text(
                                    "Charges: \$${ambulance['charges']}",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
