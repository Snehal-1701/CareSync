import 'package:caresync/Tejas/Ambulance/AmbulanceDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulanceListScreen extends StatelessWidget {
  final String type;

  const AmbulanceListScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double padding = screenWidth * 0.04;
    double margin = screenWidth * 0.04;
    double iconSize = screenWidth * 0.1;

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
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                        size: screenWidth * 0.06,
                      ),
                    ),
                  ),
                  Text(
                    'Book Ambulance',
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: padding),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Replace with actual data count
                  itemBuilder: (context, index) {
                    String ambulanceName = "$type Ambulance #$index";
                    String location = "Location $index";
                    String charges = "\$100";

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(vertical: margin * 0.5, horizontal: margin),
                      padding: EdgeInsets.all(padding),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AmbulanceDetailsScreen(ambulanceId: ambulanceName),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.local_hospital, size: iconSize, color: Colors.redAccent),
                            SizedBox(width: padding),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ambulanceName,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: padding * 0.5),
                                  Text(
                                    "Location: $location",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: padding * 0.5),
                                  Text(
                                    "Charges: $charges",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: padding * 0.5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Available for booking",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.035,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: screenWidth * 0.04,
                                        color: Colors.green,
                                      ),
                                    ],
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
