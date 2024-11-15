import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Ayurveda.dart';


class AyurvedaDetailScreen extends StatefulWidget {
  final AyurvedaItem item;

  const AyurvedaDetailScreen({super.key, required this.item});

  @override
  State<AyurvedaDetailScreen> createState() => _AyurvedaDetailScreenState();
}

class _AyurvedaDetailScreenState extends State<AyurvedaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
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
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom AppBar content
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
                        'Detail Info',
                        style: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: screenWidth*0.09,),
                    ],
                  ),
            
                  SizedBox(height: screenHeight*0.04,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        widget.item.imagePath,
                        width: double.infinity,
                        height: screenWidth * 0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.item.description,
                    style: const TextStyle(fontSize: 16),
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
