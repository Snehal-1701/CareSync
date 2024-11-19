import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulancesList extends StatefulWidget {
  const AmbulancesList({super.key});

  @override
  _AmbulancesListState createState() => _AmbulancesListState();
}

class _AmbulancesListState extends State<AmbulancesList> {
  final DatabaseReference _ambulancesRef =
      FirebaseDatabase.instance.ref().child('CareSync/ambulances');
  List<Map<String, dynamic>> _ambulancesList = [];

  @override
  void initState() {
    super.initState();
    _fetchAmbulances(); // Fetch ambulances on initialization
  }

  // Fetch ambulances from Firebase
  void _fetchAmbulances() async {
    _ambulancesRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        List<Map<String, dynamic>> loadedAmbulances = [];
        Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;

        data?.forEach((ambulanceType, typeData) {
          Map<dynamic, dynamic>? ambulances = typeData as Map<dynamic, dynamic>?;
          ambulances?.forEach((key, value) {
            loadedAmbulances.add({
              'id': key,
              'type': ambulanceType,
              ...value as Map<dynamic, dynamic>,
            });
          });
        });

        setState(() {
          _ambulancesList = loadedAmbulances;
        });
      } else {
        setState(() {
          _ambulancesList = [];
        });
      }
    });
  }

  // Delete ambulance from Firebase
  void _deleteAmbulance(String type, String id) async {
    await _ambulancesRef.child(type).child(id).remove().then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ambulance deleted successfully!")),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete ambulance: $error")),
      );
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
            stops: [0.0, 0.3, 0.7, 1.0],
            colors: [
              Color.fromRGBO(97, 206, 255, 220),
              Colors.white,
              Colors.white,
              Color.fromRGBO(14, 190, 126, 220),
            ],
          ),
        ),
        child: Column(
          children: [
            // Custom AppBar
            Container(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                bottom: screenHeight * 0.02,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          )
                        ),
                    ),
                    
                    Text(
                      'Ambulances',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: screenWidth*0.09,),
                  ],
                ),
            ),

            // List of Ambulances
            Expanded(
              child: _ambulancesList.isEmpty
                  ? const Center(child: Text("No ambulances available"))
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      itemCount: _ambulancesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ambulance = _ambulancesList[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 3),
                                    blurRadius: 5,
                                    spreadRadius: 1.2,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(screenWidth * 0.05),
                                    margin: EdgeInsets.all(screenWidth * 0.03),
                                    width: screenWidth * 0.2,
                                    height: screenWidth * 0.2,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(217, 217, 217, 1),
                                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/svg/doctor.svg", // Placeholder for ambulance image
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15),
                                        Text(
                                          ambulance['name'] ?? "Unknown",
                                          style: GoogleFonts.inter(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(0, 0, 0, 1),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          ambulance['phone'] ?? "Unknown",
                                          style: GoogleFonts.inter(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(0, 0, 0, 1),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "Location: ${ambulance['location']}",
                                          style: GoogleFonts.inter(
                                            fontSize: screenWidth * 0.035,
                                            height: 1.5,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          "Charges: ${ambulance['charges']}",
                                          style: GoogleFonts.inter(
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      _deleteAmbulance(ambulance['type'], ambulance['id']);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
