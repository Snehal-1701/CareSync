import 'package:caresync/Snehal/appointment/book_appointment.dart';
import 'package:caresync/Snehal/dr_speciality/doctors.dart';
import 'package:caresync/Snehal/dr_speciality/specilisation.dart';
import 'package:caresync/landingpage.dart';
import 'Snehal/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BookAppointment(),
      // home: DoctorCategories(),
      home: LandingPage(),
    );
  }
}
