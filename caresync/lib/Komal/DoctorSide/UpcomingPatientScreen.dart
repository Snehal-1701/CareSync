import 'package:flutter/material.dart';

class Patient {
  final String name;
  final String symptoms;
  final String gender;
  final int age;
  final String contactNo;
  final String time;
  final String imagePath;
  final String date;

  Patient({
    required this.name,
    required this.symptoms,
    required this.gender,
    required this.age,
    required this.contactNo,
    required this.time,
    required this.imagePath,
    required this.date,
  });
}

class UpcomingPatientScreen extends StatefulWidget {
  const UpcomingPatientScreen({super.key, required patient});

  @override
  _UpcomingPatientScreenState createState() => _UpcomingPatientScreenState();
}

class _UpcomingPatientScreenState extends State<UpcomingPatientScreen> {
  final List<Patient> patients = [
    Patient(
      name: 'Tejas Bhor',
      symptoms: 'Fever, Cough',
      gender: 'Male',
      age: 34,
      contactNo: '1234567890',
      time: '10:00 AM',
      imagePath: 'assets/jpg/DoctorSide/p.jpg',
      date: '12-11-2024',
    ),
    Patient(
      name: 'Snehal Kangude',
      symptoms: 'Headache, Fatigue',
      gender: 'Female',
      age: 29,
      contactNo: '0987654321',
      time: '11:00 AM',
      imagePath: 'assets/jpg/DoctorSide/p.jpg',
      date: '4-12-2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  return Card(
                    elevation: 5,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    color: Colors.teal[50], // Soft teal background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24), // Rounded corners
                    ),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.015),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(patient.imagePath),
                                radius: width * 0.08,
                              ),
                              SizedBox(width: width * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      patient.name,
                                      style: TextStyle(
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal[800],
                                      ),
                                    ),
                                    _buildPatientInfo(Icons.healing, 'Symptoms: ${patient.symptoms}', Colors.teal, width),
                                    _buildPatientInfo(Icons.person, 'Gender: ${patient.gender}', Colors.blue, width),
                                    _buildPatientInfo(Icons.cake, 'Age: ${patient.age}', Colors.purple, width),
                                    _buildPatientInfo(Icons.call, 'Contact Number: ${patient.contactNo}', Colors.green, width),
                                    _buildPatientInfo(Icons.access_time, 'Time: ${patient.time}', Colors.orange, width),
                                    _buildPatientInfo(Icons.calendar_month, 'Date: ${patient.date}', Colors.blue, width),
                                    SizedBox(height: height * 0.015),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Confirm button action
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.015),
                                            textStyle: TextStyle(fontSize: width * 0.035),
                                          ),
                                          child: const Text('Confirm'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle Cancel button action
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.015),
                                            textStyle: TextStyle(fontSize: width * 0.035),
                                          ),
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: height * 0.06,
            left: width * 0.04,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.04),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: width*0.06,),
                Text(
                  'Upcoming Patient List',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPatientInfo(IconData icon, String info, Color color, double width) {
    return Row(
      children: [
        Icon(icon, color: color, size: width * 0.04),
        SizedBox(width: width * 0.02),
        Text(info, style: TextStyle(fontSize: width * 0.04)),
      ],
    );
  }
}
