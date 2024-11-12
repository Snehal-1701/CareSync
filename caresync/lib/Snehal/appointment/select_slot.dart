import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:caresync/Snehal/medical_records/medical_record_screen_1.dart';
class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  @override
  Widget build(BuildContext context) {
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
        )),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25.0, left: 15, right: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ///ICON - BACK
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
                  const SizedBox(width: 25),

                  ///TEXT
                  Text(
                    "Select Time",
                    style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              ///CARD
              Container(
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
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///IMAGE
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/profile1.jpg",
                      ),
                    ),

                    ///COLUMN - TEXT
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr.Komal Bhosale",
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Upasana Dental Clinic, salt lake",
                                style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

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
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Text(
                    "Today, 23 Feb",
                    style: GoogleFonts.rubik(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              ///TEXT
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Afternoon 7 slots",
                  style: GoogleFonts.rubik(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

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
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

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
                ],
              ),

              ///BUTTON NEXT
              Center(
                child: GestureDetector(
                  onTap: () {
                    dialogBuilder(context);
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
              )
            ],
          ),
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
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 6),
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
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text(
                        "Thank You !",
                        style: GoogleFonts.rubik(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
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
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(103, 114, 148, 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => RecordScreen1()),
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
                        onPressed: () {},
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
