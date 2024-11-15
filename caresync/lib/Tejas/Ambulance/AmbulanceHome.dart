import 'package:caresync/Tejas/Ambulance/AmbulanceList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulanceBookingHome extends StatelessWidget {
  const AmbulanceBookingHome({super.key});

  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double padding = screenWidth * 0.04;
    double carouselHeight = screenHeight * 0.25;
    double ambulanceTypeTextSize = screenWidth * 0.05;

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
                        Icons.arrow_back_ios_new_rounded,
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
                  SizedBox(width: screenWidth * 0.1),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                flex: 3,
                child: CarouselSlider(
                  items: [
                    carouselItem("assets/png/AmulanceCarasiousal/AmulanceCarasiousal1.png", screenWidth, screenHeight),
                    carouselItem("assets/png/AmulanceCarasiousal/AmulanceCarasiousal2.png", screenWidth, screenHeight),
                    carouselItem("assets/png/AmulanceCarasiousal/AmulanceCarasiousal3.png", screenWidth, screenHeight),
                  ],
                  options: CarouselOptions(
                    height: carouselHeight,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Text(
                        "Select Ambulance Type",
                        style: TextStyle(
                          fontSize: ambulanceTypeTextSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        children: [
                          AnimatedAmbulanceTypeCard(
                            context: context,
                            type: 'Basic Life Support Ambulance',
                            icon: Icons.local_hospital,
                          ),
                          AnimatedAmbulanceTypeCard(
                            context: context,
                            type: 'Advanced Life Support Ambulance',
                            icon: Icons.medical_services,
                          ),
                          AnimatedAmbulanceTypeCard(
                            context: context,
                            type: 'ICU Ambulance',
                            icon: Icons.health_and_safety,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget carouselItem(String imagePath, double screenWidth, double screenHeight) {
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
          height: screenHeight*0.001,
        ),
      ),
    );
  }
}

class AnimatedAmbulanceTypeCard extends StatefulWidget {
  final BuildContext context;
  final String type;
  final IconData icon;

  const AnimatedAmbulanceTypeCard({super.key, 
    required this.context,
    required this.type,
    required this.icon,
  });

  @override
  _AnimatedAmbulanceTypeCardState createState() =>
      _AnimatedAmbulanceTypeCardState();
}

class _AnimatedAmbulanceTypeCardState extends State<AnimatedAmbulanceTypeCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double iconSize = screenWidth * 0.1;
    double textSize = screenWidth * 0.04;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AmbulanceListScreen(type: widget.type),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: screenWidth * 0.2,
        margin: EdgeInsets.only(bottom: screenWidth * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? Colors.redAccent.withOpacity(0.3)
                  : Colors.grey.withOpacity(0.3),
              blurRadius: isHovered ? screenWidth * 0.03 : screenWidth * 0.015,
              offset: Offset(0, isHovered ? screenWidth * 0.03 : screenWidth * 0.015),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [
              Icon(widget.icon, size: iconSize, color: Colors.redAccent),
              SizedBox(width: screenWidth * 0.05),
              Expanded(
                child: Text(
                  widget.type,
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
