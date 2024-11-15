import 'package:caresync/Snehal/appointment/book_appointment.dart';
import 'package:caresync/Tejas/PatientSide.dart/PatientHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:caresync/Snehal/medical_records/medical_record_screen_1.dart';

class SelectTime extends StatefulWidget {
  final String doctorName;
  final String clinicName;
  final String specialty;
  final String doctorImage;

  // Constructor to accept doctor data
  SelectTime({
    required this.doctorName,
    required this.clinicName,
    required this.specialty,
    required this.doctorImage,
  });
  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  @override
  Widget build(BuildContext context) {
    // Retrieve screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      ///BOOK APPOINTMENT UI
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
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.06,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            bottom: screenHeight * 0.00,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                  ///TEXT
                  Text(
                    "Select Time",
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              ///CARD
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                padding: EdgeInsets.all(screenWidth * 0.03),
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      blurRadius: 18,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///IMAGE
                    Container(
                      height: screenHeight * 0.12,
                      width: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        widget.doctorImage,
                      ),
                    ),

                    ///COLUMN - TEXT
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.doctorName,
                              style: GoogleFonts.rubik(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                widget.clinicName,
                                style: GoogleFonts.rubik(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Text(
                                widget.specialty,
                                style: GoogleFonts.rubik(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///LIKE ICON
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),

              ///TEXT
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.03),
                child: Center(
                  child: Text(
                    "Today, 23 Feb",
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              ///TEXT
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Text(
                  "Afternoon 7 slots",
                  style: GoogleFonts.rubik(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

              /// Add Time Slots with Wrap for Responsive Layout
              Wrap(
                spacing: screenWidth * 0.03,
                runSpacing: screenHeight * 0.015,
                children: [
                  _buildTimeSlot(context, "1:00 PM"),
                  _buildTimeSlot(context, "1:30 PM"),
                  _buildTimeSlot(context, "2:00 PM", selected: true),
                  _buildTimeSlot(context, "2:30 PM"),
                  _buildTimeSlot(context, "3:00 PM"),
                  _buildTimeSlot(context, "3:30 PM"),
                  _buildTimeSlot(context, "4:00 PM"),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: Text(
                  "Evening 5 slots",
                  style: GoogleFonts.rubik(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

              Wrap(
                spacing: screenWidth * 0.03,
                runSpacing: screenHeight * 0.015,
                children: [
                  _buildTimeSlot(context, "5:00 PM"),
                  _buildTimeSlot(context, "5:30 PM", selected: true),
                  _buildTimeSlot(context, "6:00 PM"),
                  _buildTimeSlot(context, "6:30 PM"),
                  _buildTimeSlot(context, "7:00 PM"),
                ],
              ),

              ///BUTTON NEXT
              Center(
                child: GestureDetector(
                  onTap: () {
                    dialogBuilder(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.02),
                    padding: EdgeInsets.all(screenHeight * 0.015),
                    alignment: Alignment.center,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(14, 190, 127, 1),
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    ),
                    child: Text(
                      "Confirm",
                      style: GoogleFonts.rubik(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Time Slot Builder Method
  Widget _buildTimeSlot(BuildContext context, String time,
      {bool selected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.015,
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: selected
            ? const Color.fromRGBO(14, 190, 127, 1)
            : const Color.fromRGBO(231, 246, 255, 1),
      ),
      child: Text(
        time,
        style: GoogleFonts.rubik(
          fontSize: MediaQuery.of(context).size.width * 0.045,
          fontWeight: FontWeight.w500,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(143, 208, 185, 0.416),
                      ),
                      child: const Icon(
                        size: 60,
                        Icons.thumb_up_alt_rounded,
                        color: Color.fromRGBO(14, 190, 127, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Thank You !",
                        style: GoogleFonts.rubik(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Your Appointment Successful",
                        style: GoogleFonts.rubik(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(103, 114, 148, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "You booked an appointment with ${widget.doctorName} on February 21, at 02:00 PM",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(103, 114, 148, 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const PatientHomeScreen()),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(14, 190, 127, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Confirm",
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>BookAppointment(doctorName: widget.doctorName, clinicName: widget.clinicName, specialty: widget.specialty, doctorImage: widget.doctorImage))
                          );
                        },
                        child: Text(
                          "Edit your appointment",
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
