import 'package:caresync/Snehal/appointment/book_appointment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final String clinicName;

  Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.clinicName,
  });
}

class DoctorListScreen extends StatefulWidget {
  final String drSpeciality;

  DoctorListScreen({required this.drSpeciality});

  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  // Original list of all doctors
  List<Doctor> allDoctors = [
    Doctor(
      name: "Dr. Daniel Rodriguez",
      specialty: "Cardiology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Jessica Ramirez",
      specialty: "Cardiology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Michael Chang",
      specialty: "Cardiology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Michael Davidson, M.D.",
      specialty: "Cardiology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    // Add other doctors here...
    Doctor(
      name: "Dr. Hannah Lewis, M.D.",
      specialty: "Dermatology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Jacob Lopez, M.D.",
      specialty: "Dermatology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Lucy Perez, Ph.D.",
      specialty: "Dermatology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Logan Williams, M.D.",
      specialty: "General Medicine",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Emma Hall, M.D.",
      specialty: "General Medicine",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. James Taylor, M.D.",
      specialty: "Gynecology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Madison Clark, Ph.D.",
      specialty: "Gynecology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Thomas Rivera, M.D.",
      specialty: "Gynecology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Ava Williams, M.D.",
      specialty: "Odontology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Chloe Green, M.D.",
      specialty: "Odontology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Daniel Lee, Ph.D.",
      specialty: "Oncology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
    Doctor(
      name: "Dr. Quinn Cooper, M.D.",
      specialty: "Oncology",
      imageUrl: "assets/jpg/images/profile1.jpg",
      clinicName: "Upasana Clinic",
    ),
  ];

  // Filtered list of doctors based on the selected specialty
  late List<Doctor> doctors;

  @override
  void initState() {
    super.initState();
    // Filter doctors based on the provided specialty
    doctors = allDoctors
        .where((doctor) => doctor.specialty == widget.drSpeciality)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Text(
                    widget.drSpeciality,
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.02),
                      padding: EdgeInsets.all(screenWidth * 0.03),
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: screenHeight * 0.13,
                                width: screenWidth * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                  doctor.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth * 0.03),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctor.name,
                                        style: GoogleFonts.rubik(
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        doctor.clinicName,
                                        style: GoogleFonts.rubik(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        doctor.specialty,
                                        style: GoogleFonts.rubik(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.favorite_border_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BookAppointment(
                                      doctorName: doctors[index].name,
                                      clinicName: doctors[index].clinicName,
                                      specialty: doctors[index].specialty,
                                      doctorImage: doctors[index].imageUrl,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(14, 190, 126, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.015),
                              ),
                              child: Text(
                                'Book Appointment',
                                style: GoogleFonts.rubik(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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
