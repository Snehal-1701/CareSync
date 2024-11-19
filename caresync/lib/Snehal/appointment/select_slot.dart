<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:caresync/Snehal/medical_records/medical_record_screen_1.dart';
class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

=======
import 'package:caresync/Snehal/appointment/book_appointment.dart';
import 'package:caresync/Tejas/PatientSide.dart/PatientHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectTime extends StatefulWidget {
  final String doctorName;
  final String clinicName;
  final String specialty;
  final String doctorImage;

  // Constructor to accept doctor data
  const SelectTime({super.key, 
    required this.doctorName,
    required this.clinicName,
    required this.specialty,
    required this.doctorImage,
  });
>>>>>>> snehal
  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    // Retrieve screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

>>>>>>> snehal
    return Scaffold(
      ///BOOK APPOINTMENT UI
      body: Container(
        decoration: const BoxDecoration(
<<<<<<< HEAD
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
          padding:
              const EdgeInsets.only(top: 25.0, left: 15, right: 15, bottom: 15),
=======
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
>>>>>>> snehal
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
<<<<<<< HEAD
                  ///ICON - BACK
=======
>>>>>>> snehal
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
<<<<<<< HEAD
                        height: 45,
                        width: 45,
=======
                        height: screenWidth * 0.1, 
                        width: screenWidth * 0.1,
>>>>>>> snehal
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
<<<<<<< HEAD
                  const SizedBox(width: 25),
=======
                  SizedBox(width: screenWidth * 0.18),
>>>>>>> snehal

                  ///TEXT
                  Text(
                    "Select Time",
<<<<<<< HEAD
                    style: GoogleFonts.rubik(
                      fontSize: 25,
=======
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.065,
>>>>>>> snehal
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              ///CARD
              Container(
<<<<<<< HEAD
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(12),
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 18,
                        offset: Offset(0, 4)),
=======
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
>>>>>>> snehal
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///IMAGE
                    Container(
<<<<<<< HEAD
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/profile1.jpg",
=======
                      height: screenHeight * 0.12,
                      width: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        widget.doctorImage,
>>>>>>> snehal
                      ),
                    ),

                    ///COLUMN - TEXT
                    Expanded(
                      child: Padding(
<<<<<<< HEAD
                        padding: const EdgeInsets.only(left: 8.0),
=======
                        padding: EdgeInsets.only(left: screenWidth * 0.03),
>>>>>>> snehal
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
<<<<<<< HEAD
                              "Dr.Komal Bhosale",
                              style: GoogleFonts.rubik(
                                fontSize: 20,
=======
                              widget.doctorName,
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.05,
>>>>>>> snehal
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Text(
<<<<<<< HEAD
                                "Upasana Dental Clinic, salt lake",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
=======
                                widget.clinicName,
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.045,
>>>>>>> snehal
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

<<<<<<< HEAD
                            ///ROW - STARS
                            const Row(
                              children: [
                                Icon(
                                  size: 20,
                                  Icons.star,
                                  color: Color.fromARGB(255, 199, 199, 14),
                                ),
                                Icon(
                                  size: 20,
                                  Icons.star,
                                  color: Color.fromARGB(255, 199, 199, 14),
                                ),
                                Icon(
                                  size: 20,
                                  Icons.star,
                                  color: Color.fromARGB(255, 199, 199, 14),
                                ),
                                Icon(
                                  size: 20,
                                  Icons.star,
                                  color: Color.fromARGB(255, 199, 199, 14),
                                ),
                                Icon(
                                  size: 20,
                                  Icons.star,
                                  color: Color.fromARGB(255, 199, 199, 14),
                                ),
                              ],
=======
                            Expanded(
                              child: Text(
                                widget.specialty,
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
>>>>>>> snehal
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
<<<<<<< HEAD
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Text(
                    "Today, 23 Feb",
                    style: GoogleFonts.rubik(
                      fontSize: 25,
=======
                padding: EdgeInsets.only(top: screenHeight * 0.03),
                child: Center(
                  child: Text(
                    "Today, 23 Feb",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.06,
>>>>>>> snehal
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              ///TEXT
              Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Afternoon 7 slots",
                  style: GoogleFonts.rubik(
                    fontSize: 25,
=======
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Text(
                  "Afternoon 7 slots",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.06,
>>>>>>> snehal
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

<<<<<<< HEAD
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 220),
                          ),
                          child: Text(
                            "1:00 PM",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(14, 190, 127, 1),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 220),
                          ),
                          child: Text(
                            "1:30 PM",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(14, 190, 127, 1),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 1),
                          ),
                          child: Text(
                            "2:00 PM",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 220),
                          ),
                          child: Text(
                            "2:30 PM",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(14, 190, 127, 1),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(14, 190, 127, 220),
                            ),
                            child: Text(
                              "3:00 PM",
                              style: GoogleFonts.rubik(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(14, 190, 127, 1),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(14, 190, 127, 220),
                            ),
                            child: Text(
                              "3:30 PM",
                              style: GoogleFonts.rubik(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(14, 190, 127, 1),
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(14, 190, 127, 220),
                            ),
                            child: Text(
                              "4:00 PM",
                              style: GoogleFonts.rubik(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(14, 190, 127, 1),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),

              ///TEXT
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Evening 5 slots",
                  style: GoogleFonts.rubik(
                    fontSize: 25,
=======
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
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.06,
>>>>>>> snehal
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

<<<<<<< HEAD
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 220),
                          ),
                          child: Text(
                            "5:00 PM",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(14, 190, 127, 1),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 1),
                          ),
                          child: Text(
                            "5:30 PM",
                            style: GoogleFonts.rubik(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 220),
                          ),
                          child: Text(
                            "6:00 PM",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(14, 190, 127, 1),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(14, 190, 127, 220),
                          ),
                          child: Text(
                            "6:30 PM",
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(14, 190, 127, 1),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromRGBO(14, 190, 127, 220),
                            ),
                            child: Text(
                              "7:00 PM",
                              style: GoogleFonts.rubik(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(14, 190, 127, 1),
                              ),
                            )),
                      ],
                    ),
                  ),
=======
              Wrap(
                spacing: screenWidth * 0.03,
                runSpacing: screenHeight * 0.015,
                children: [
                  _buildTimeSlot(context, "5:00 PM"),
                  _buildTimeSlot(context, "5:30 PM", selected: true),
                  _buildTimeSlot(context, "6:00 PM"),
                  _buildTimeSlot(context, "6:30 PM"),
                  _buildTimeSlot(context, "7:00 PM"),
>>>>>>> snehal
                ],
              ),

              ///BUTTON NEXT
              Center(
                child: GestureDetector(
                  onTap: () {
                    dialogBuilder(context);
                  },
                  child: Container(
<<<<<<< HEAD
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
=======
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
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05,
>>>>>>> snehal
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
<<<<<<< HEAD
              )
=======
              ),
>>>>>>> snehal
            ],
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
=======
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
        style: GoogleFonts.poppins(
          fontSize: MediaQuery.of(context).size.width * 0.045,
          fontWeight: FontWeight.w500,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
>>>>>>> snehal
  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Center(
              child: Padding(
<<<<<<< HEAD
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 6),
=======
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 6),
>>>>>>> snehal
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
<<<<<<< HEAD
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(
                        "Thank You !",
                        style: GoogleFonts.rubik(
=======
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Thank You !",
                        style: GoogleFonts.poppins(
>>>>>>> snehal
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
<<<<<<< HEAD
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(
                        "Your Appointment Successful",
                        style: GoogleFonts.rubik(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(103, 114, 148, 1),
                      ),
                    ),),
                    const SizedBox(height:15),
                    Text(
                      "You booked an appointment with Dr.Pediatrician Purpieson on February 21, at 02:00 PM",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
=======
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Your Appointment Successful",
                        style: GoogleFonts.poppins(
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
                      style: GoogleFonts.poppins(
>>>>>>> snehal
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(103, 114, 148, 1)),
                    ),
                    Padding(
<<<<<<< HEAD
                      padding: const EdgeInsets.only(top:8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => RecordScreen1()),
=======
                      padding: const EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const PatientHomeScreen()),
>>>>>>> snehal
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
<<<<<<< HEAD
                            style: GoogleFonts.rubik(
=======
                            style: GoogleFonts.poppins(
>>>>>>> snehal
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
<<<<<<< HEAD
                        onPressed: () {},
                        child: Text(
                          "Edit your appointment",
                          style: GoogleFonts.rubik(
=======
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>BookAppointment(doctorName: widget.doctorName, clinicName: widget.clinicName, specialty: widget.specialty, doctorImage: widget.doctorImage))
                          );
                        },
                        child: Text(
                          "Edit your appointment",
                          style: GoogleFonts.poppins(
>>>>>>> snehal
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
<<<<<<< HEAD

  
=======
>>>>>>> snehal
}
