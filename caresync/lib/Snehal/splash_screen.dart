import 'package:caresync/Snehal/landingpage.dart';
import 'package:caresync/Tejas/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appointment/book_appointment.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  LandingPage()));
    }
    );
  }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  // }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose(); // Always call super.dispose() at the end of this method
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
            Image.asset("assets/png/images/logo.png"),
            Text(
              "CareSync",
              style: GoogleFonts.rubik(
                fontSize: 45,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(14, 190, 126, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
