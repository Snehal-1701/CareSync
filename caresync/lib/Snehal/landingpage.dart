import 'package:caresync/Tejas/AdminSide/AdminSignInPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:caresync/Tejas/Login&Sigup/Doctor/SignIn.dart';
import 'package:caresync/Tejas/Login&Sigup/Patient/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<void> _saveUserType(String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userType', userType); // Save user type
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/png/images/logo.png", height: 200, width: 200),
            Text(
              "CareSync",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(14, 190, 126, 1),
              ),
            ),
            Text(
              "Stay healthy with us...",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            Text(
              "You are a",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () async {
                await _saveUserType('patient'); // Save as patient
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const PatientSignInPage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(14, 190, 126, 1),
                ),
                child: Text(
                  "Patient",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await _saveUserType('doctor'); // Save as doctor
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const DoctorSignInPage()));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(14, 190, 126, 1),
                ),
                child: Text(
                  "Doctor",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await _saveUserType('admin'); // save as admin
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AdminSignInPage()));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(14, 190, 126, 1),
                ),
                child: Text(
                  "Admin",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
