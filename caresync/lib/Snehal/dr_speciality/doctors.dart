import 'package:caresync/Snehal/appointment/book_appointment.dart';
import 'package:caresync/Snehal/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorListScreen extends StatefulWidget {
  final String drSpeciality;

  const DoctorListScreen({super.key, required this.drSpeciality});

  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

Future<List<Doctor>> fetchDoctors() async {
  List<Doctor> doctorList = [];
  try {
    // Reference to the Firestore collection
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('CareSync')
        .doc('doctors')
        .collection('accounts')
        .get();

    // Extracting required fields from each document
    for (var doc in querySnapshot.docs) {
      String name = doc['name'];
      String clinicLocation = doc['cliniclocation'];
      String specialization = doc['specialization'];

      // Adding to the local list
      doctorList.add(Doctor(
        name: name,
        clinicName: clinicLocation,
        specialization: specialization,
      ));
    }
  } catch (e) {
    print('Error fetching doctors: $e');
  }
  return doctorList;
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  // Filtered list of doctors based on the selected specialty
  late List<Doctor> doctors;

  @override
  void initState() {
    super.initState();
    fetchAndFilterDoctors();
  }

  void fetchAndFilterDoctors() async {
    // Fetch the doctors asynchronously
    List<Doctor> allDoctors = await fetchDoctors();

    // Filter doctors based on the provided specialty
    List<Doctor> filteredDoctors = allDoctors
        .where((doctor) => doctor.specialization == widget.drSpeciality)
        .toList();

    // Update the state with the filtered doctors
    setState(() {
      doctors = filteredDoctors;
    });
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
                  SizedBox(
                    width: screenWidth * 0.17,
                  ),
                  Text(
                    widget.drSpeciality,
                    style: GoogleFonts.poppins(
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
                                  "assets/jpg/images/profile1.jpg",
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
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.05,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        doctor.clinicName,
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        doctor.specialization,
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
                                      specialty: doctors[index].specialization,
                                      doctorImage:
                                          "assets/jpg/images/profile1.jpg",
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
                                style: GoogleFonts.poppins(
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
