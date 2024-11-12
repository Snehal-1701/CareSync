import 'package:caresync/Tejas/Model%20Class/MedicalStoreModel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AmbulancesList extends StatefulWidget {
  const AmbulancesList({super.key});

  @override
  _AmbulancesList createState() => _AmbulancesList();
}

class _AmbulancesList extends State {
  List<MedicalStoresModel> listOfMedicals = [
    MedicalStoresModel(
      title: "MediCure Pharmacy",
      address: "Address: 778 Locust View Drive\nOakland, CA",
      phoneNo: "Contact No: 9730775888",
      image: "assets/svg/image1.svg",
    ),
    MedicalStoresModel(
      title: "HealthHub Pharmacy",
      address: "Address: 2244 Maple Avenue\nAustin, TX",
      phoneNo: "Contact No: 9820567766",
      image: "assets/svg/image2.svg",
    ),
  ];

  void _deleteMedicalStore(int index) {
    setState(() {
      listOfMedicals.removeAt(index);
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
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.teal[700],),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      "Ambulances",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.teal[700],
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), 
                ],
              ),
            ),

            // List of Medical Stores
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                itemCount: listOfMedicals.length,
                itemBuilder: (BuildContext context, int index) {
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
                                listOfMedicals[index].image,
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
                                    listOfMedicals[index].title,
                                    style: GoogleFonts.inter(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    listOfMedicals[index].address,
                                    style: GoogleFonts.inter(
                                      fontSize: screenWidth * 0.035,
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromRGBO(0, 0, 0, 0.7),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    listOfMedicals[index].phoneNo,
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
                                _deleteMedicalStore(index);
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
