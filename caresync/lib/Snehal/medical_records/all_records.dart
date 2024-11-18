import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllRecords extends StatefulWidget {
  const AllRecords({super.key});

  @override
  State<AllRecords> createState() => _AllRecordsState();
}

class _AllRecordsState extends State<AllRecords> {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      /// MEDICAL RECORD SCREEN
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
        )),
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.06,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            bottom: screenHeight * 0.00,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            size: 30,
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.grey,
                          )),
                    ),
                  SizedBox(width: screenWidth * 0.05),

                  /// TEXT
                  Text(
                    "All Records",
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              /// CARD LIST
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02, 
                            vertical: screenHeight * 0.013),
                      child: Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.01),
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        height: screenHeight * 0.13,
                        
                        decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87.withOpacity(0.6),
                                    offset: const Offset(0, 4),
                                    blurRadius: 6.0,
                                    spreadRadius: 0.1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// IMAGE CONTAINER
                            Container(
                              height: screenHeight * 0.1,
                              width: screenHeight * 0.1,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromRGBO(14, 190, 127, 1),
                              ),
                              child: Text(
                                "23 Feb",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      
                            /// COLUMN - TEXT
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: screenWidth * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Records added by you",
                                      style: GoogleFonts.rubik(
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Record for username",
                                      style: GoogleFonts.rubik(
                                        fontSize: screenWidth * 0.042,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            const Color.fromRGBO(14, 190, 127, 1),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "1 Prescription",
                                      style: GoogleFonts.rubik(
                                        fontSize: screenWidth * 0.040,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
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
      floatingActionButton: GestureDetector(
        onTap: () {
          showBottomSheet();
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(14, 190, 127, 1),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 5,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                  ),
                ),
                const Center(
                  child: Text(
                    "Add a record",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                       Icon(Icons.photo, size:25,color: Colors.grey[600]),
                       const SizedBox(width:14),
                       Text(
                        "Upload from gallery",
                        style: GoogleFonts.rubik(
                          fontSize: 17,
                        ),
                      ),
                    ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                       Icon(Icons.picture_as_pdf, size:25,color: Colors.grey[600]),
                       const SizedBox(width:14),
                       Text(
                        "Upload files",
                        style: GoogleFonts.rubik(
                          fontSize: 17,
                        ),
                      ),
                    ]
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: (){},  
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(const Color.fromRGBO(14, 190, 127, 1),)
                      ),
                      child: Text(
                        "Add",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
