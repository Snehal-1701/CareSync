import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:caresync/Tejas/Ambulance/AmbulanceList.dart';

class AmbulanceBookingHome extends StatefulWidget {
  @override
  _AmbulanceBookingHomeState createState() => _AmbulanceBookingHomeState();
}

class _AmbulanceBookingHomeState extends State<AmbulanceBookingHome> {
  final DatabaseReference _ambulancesRef = FirebaseDatabase.instance.ref().child('CareSync/ambulances');
  List<String> _ambulanceTypes = [];

  @override
  void initState() {
    super.initState();

    // Fetch ambulance types (Basic Life Support, etc.) from Firebase
    _ambulancesRef.onChildAdded.listen((event) {
      setState(() {
        _ambulanceTypes.add(event.snapshot.key!);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double padding = screenWidth * 0.04;
    double carouselHeight = screenHeight * 0.25;
    double textSize = screenWidth * 0.05;

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
          padding: EdgeInsets.fromLTRB(padding, screenHeight * 0.06, padding, 0),
          child: Column(
            children: [
              // Back button and title
              Row(
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
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.grey,
                        size: screenWidth * 0.06,
                      ),
                    ),
                  ),
                  Text(
                    'Ambulance Booking',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1), // Spacer to align
                ],
              ),
              SizedBox(height: screenHeight * 0.04),

              // Carousel slider
              CarouselSlider(
                items: [
                  carouselItem("assets/png/AmulanceCarasiousal/AmulanceCarasiousal1.png", screenWidth),
                  carouselItem("assets/png/AmulanceCarasiousal/AmulanceCarasiousal2.png", screenWidth),
                  carouselItem("assets/png/AmulanceCarasiousal/AmulanceCarasiousal3.png", screenWidth),
                ],
                options: CarouselOptions(
                  height: carouselHeight,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),
              SizedBox(height: screenHeight * 0.06),

              // Title for ambulance types
              Text(
                'Select Ambulance Type',
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // List of ambulance types
              Expanded(
                child: ListView.builder(
                  itemCount: _ambulanceTypes.length,
                  itemBuilder: (context, index) {
                    String ambulanceType = _ambulanceTypes[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AmbulanceListScreen(type: ambulanceType),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(screenWidth * 0.04),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: Colors.redAccent,
                              size: screenWidth * 0.1,
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Expanded(
                              child: Text(
                                ambulanceType,
                                style: TextStyle(
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold,
                                ),
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

  Widget carouselItem(String imagePath, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
          width: screenWidth,
        ),
      ),
    );
  }
}
