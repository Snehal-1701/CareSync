import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_slot.dart';
import 'package:intl/intl.dart';

class BookAppointment extends StatefulWidget {
  final String doctorName;
  final String clinicName;
  final String specialty;
  final String doctorImage;

  // Constructor to accept doctor data
  const BookAppointment({super.key, 
    required this.doctorName,
    required this.clinicName,
    required this.specialty,
    required this.doctorImage,
  });
  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // double iconSize = screenWidth * 0.07;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        )),
                  ),
                  SizedBox(width: screenWidth * 0.14),
                  Center(
                    child: Text(
                      "Appointment",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                padding: EdgeInsets.all(screenWidth * 0.03),
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                  children: [
                    Container(
                      height: screenHeight * 0.13,
                      width: screenWidth * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        widget.doctorImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.doctorName,
                                  style: GoogleFonts.poppins(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 2),
                            Text(
                              widget.clinicName,
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
              
                            // SizedBox(height: 2),
                            Text(
                              widget.specialty,
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.04,
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                child: Text(
                  "Appointment For",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Patient Name',
                    // prefixIcon: Icon(Icons.email, size: iconSize),
                    labelStyle: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    // prefixIcon: Icon(Icons.email, size: iconSize),
                    labelStyle: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                child: TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2025),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat.yMMMd().format(pickedDate);
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    }
                  },
                  
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calendar_month_outlined),
                    labelText: 'Date',
                    // prefixIcon: Icon(Icons.email, size: iconSize),
                    labelStyle: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Text(
                  "Who is this patient?",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _patientOption("Add", Icons.add, "Add More"),
                    _patientOption("My self", null, "My self",
                        asset: "assets/png/images/man.png"),
                    _patientOption("My child", null, "My child",
                        asset: "assets/png/images/baby.png"),
                    _patientOption("My wife", null, "My wife",
                        asset: "assets/png/images/woman.png"),
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SelectTime(
                            doctorName: widget.doctorName,
                            specialty: widget.specialty,
                            clinicName: widget.clinicName,
                            doctorImage: widget.doctorImage,
                          )),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.029),
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    alignment: Alignment.center,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(14, 190, 127, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
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

  Widget _patientOption(String label, IconData? icon, String subtitle,
      {String? asset}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: screenWidth * 0.03),
          height: screenHeight * 0.15,
          width: screenWidth * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 172, 250, 223),
          ),
          child: Center(
            child: icon != null
                ? Icon(icon,
                    size: screenWidth * 0.08,
                    color: const Color.fromRGBO(14, 190, 127, 1))
                : asset != null
                    ? Image.asset(asset, fit: BoxFit.cover)
                    : null,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.01),
          child: Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
