// // import 'dart:math' as math;
// // import 'package:caresync/Snehal/appointment/book_appointment.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class LandingPage extends StatefulWidget {
// //   const LandingPage({super.key});

// //   @override
// //   State<LandingPage> createState() => _LandingPageState();
// // }

// // class _LandingPageState extends State<LandingPage>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       duration: Duration(seconds: 10),
// //       vsync: this,
// //     )..repeat();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double circleRadius = 150.0;

// //     return Scaffold(
// //       body: Container(
// //         width: double.infinity,
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //             stops: [0.0, 0.3, 0.7, 1.0],
// //             colors: [
// //               Color.fromRGBO(97, 206, 255, 220),
// //               Colors.white,
// //               Colors.white,
// //               Color.fromRGBO(14, 190, 126, 220),
// //             ],
// //           ),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             SizedBox(height:75),
// //             // Center logo with rotating images around it
// //             Stack(
// //               alignment: Alignment.center,
// //               children: [
// //                 // Center logo with label below
// //                 Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Center(
// //                       child: Image.asset(
// //                         "assets/images/logo.png", // CareSync logo
// //                         width: 100,
// //                         height: 100,
// //                       ),
// //                     ),
// //                     Text(
// //                       "CareSync",
// //                       style: GoogleFonts.rubik(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
                
// //                 // Rotating images around the logo
// //                 AnimatedBuilder(
// //                   animation: _controller,
// //                   builder: (context, child) {
// //                     return Transform.rotate(
// //                       angle: _controller.value * 2 * math.pi,
// //                       child: Stack(
// //                         children: [
// //                           _buildCircleImage(circleRadius, 0),
// //                           _buildCircleImage(circleRadius, 90),
// //                           _buildCircleImage(circleRadius, 180),
// //                           _buildCircleImage(circleRadius, 270),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),

// //             // Spacer for additional space between animation and texts
// //             SizedBox(height: 150),

// //             // Additional UI elements
// //             Column(
// //               children: [
// //                 Text(
// //                   "CareSync",
// //                   style: GoogleFonts.rubik(
// //                     fontSize: 30,
// //                     fontWeight: FontWeight.w400,
// //                     color: const Color.fromRGBO(14, 190, 126, 1),
// //                   ),
// //                 ),
// //                 Text(
// //                   "Stay healthy with us...",
// //                   style: GoogleFonts.rubik(
// //                     fontSize: 30,
// //                     fontWeight: FontWeight.w400,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 Text(
// //                   "You are a",
// //                   style: GoogleFonts.rubik(
// //                     fontSize: 30,
// //                     fontWeight: FontWeight.w400,
// //                     color: Colors.black,
// //                   ),
// //                 ),
// //                 SizedBox(height: 20), // Space between text and buttons

// //                 // Patient button
// //                 GestureDetector(
// //                   onTap: () {
// //                     // Navigator.of(context).pushReplacement(
// //                     //     MaterialPageRoute(builder: (context) => BookAppointment()));
// //                   },
// //                   child: Container(
// //                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(30),
// //                       color: const Color.fromRGBO(14, 190, 126, 1),
// //                     ),
// //                     child: Text(
// //                       "Patient",
// //                       style: GoogleFonts.rubik(
// //                         fontSize: 30,
// //                         fontWeight: FontWeight.w400,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),

// //                 // Spacer between buttons
// //                 SizedBox(height: 10),

// //                 // Doctor button
// //                 GestureDetector(
// //                   onTap: () {
// //                     // Navigator.of(context).pushReplacement(
// //                     //     MaterialPageRoute(builder: (context) => BookAppointment()));
// //                   },
// //                   child: Container(
// //                     margin: const EdgeInsets.all(10),
// //                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(30),
// //                       color: const Color.fromRGBO(14, 190, 126, 1),
// //                     ),
// //                     child: Text(
// //                       "Doctor",
// //                       style: GoogleFonts.rubik(
// //                         fontSize: 30,
// //                         fontWeight: FontWeight.w400,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // Method to position images around the circle
// //   Widget _buildCircleImage(double radius, double angle) {
// //     double radian = angle * (math.pi / 180);
// //     return Transform.translate(
// //       offset: Offset(
// //         radius * math.cos(radian),
// //         radius * math.sin(radian),
// //       ),
// //       child: CircleAvatar(
// //         radius: 30,
// //         backgroundImage: AssetImage('assets/images/baby.jpg'), // Use asset image
// //       ),
// //     );
// //   }
// // }
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 10),
//       vsync: this,
//     )..repeat();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double circleRadius = 150.0;

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [0.0, 0.3, 0.7, 1.0],
//             colors: [
//               Color.fromRGBO(97, 206, 255, 220),
//               Colors.white,
//               Colors.white,
//               Color.fromRGBO(14, 190, 126, 220),
//             ],
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 75),
//             // Center logo with rotating images around it
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 // Circle with lines behind the images
//                 CustomPaint(
//                   painter: CirclePainter(),
//                   size: Size(circleRadius * 2, circleRadius * 2),
//                 ),
                
//                 // Center logo
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Center(
//                       child: Image.asset(
//                         "assets/images/logo.png", // Central logo
//                         width: 100,
//                         height: 100,
//                       ),
//                     ),
//                     Text(
//                       "CareSync",
//                       style: GoogleFonts.rubik(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
                
//                 // Rotating images around the logo
//                 AnimatedBuilder(
//                   animation: _controller,
//                   builder: (context, child) {
//                     return Transform.rotate(
//                       angle: _controller.value * 2 * math.pi,
//                       child: Stack(
//                         children: [
//                           _buildCircleImage(circleRadius, 0),
//                           _buildCircleImage(circleRadius, 90),
//                           _buildCircleImage(circleRadius, 180),
//                           _buildCircleImage(circleRadius, 270),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),

//             // Spacer for additional space between animation and texts
//             SizedBox(height: 150),

//             // Additional UI elements
//             Column(
//               children: [
//                 Text(
//                   "CareSync",
//                   style: GoogleFonts.rubik(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w400,
//                     color: const Color.fromRGBO(14, 190, 126, 1),
//                   ),
//                 ),
//                 Text(
//                   "Stay healthy with us...",
//                   style: GoogleFonts.rubik(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "You are a",
//                   style: GoogleFonts.rubik(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 20), // Space between text and buttons

//                 // Patient button
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.of(context).pushReplacement(
//                     //     MaterialPageRoute(builder: (context) => BookAppointment()));
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: const Color.fromRGBO(14, 190, 126, 1),
//                     ),
//                     child: Text(
//                       "Patient",
//                       style: GoogleFonts.rubik(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Spacer between buttons
//                 SizedBox(height: 10),

//                 // Doctor button
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.of(context).pushReplacement(
//                     //     MaterialPageRoute(builder: (context) => BookAppointment()));
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.all(10),
//                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: const Color.fromRGBO(14, 190, 126, 1),
//                     ),
//                     child: Text(
//                       "Doctor",
//                       style: GoogleFonts.rubik(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Method to position images around the circle
//   Widget _buildCircleImage(double radius, double angle) {
//     double radian = angle * (math.pi / 180);
//     double scaleFactor = angle == 0 ? 1.5 : 1.0; // Scale image at top center

//     return Transform.translate(
//       offset: Offset(
//         radius * math.cos(radian),
//         radius * math.sin(radian),
//       ),
//       child: Transform.scale(
//         scale: scaleFactor,
//         child: CircleAvatar(
//           radius: 30,
//           backgroundImage: AssetImage('assets/images/baby.jpg'), // Image asset
//         ),
//       ),
//     );
//   }
// }

// // Custom painter to draw the circular line
// // class CirclePainter extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     Paint paint = Paint()
// //       ..color = Colors.grey.withOpacity(0.5)
// //       ..strokeWidth = 2
// //       ..style = PaintingStyle.stroke;

// //     canvas.drawArc(
// //       Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
// //       0,
// //       2 * math.pi,
// //       false,
// //       paint,
// //     );
// //   }

// //   @override
// //   bool shouldRepaint(CustomPainter oldDelegate) => false;
// // }

// class CirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.grey.withOpacity(0.5)
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;

//     // Parameters for the dashed circle
//     double radius = size.width / 2;
//     double dashLength = 100.0;  // Length of each dash
//     double gapLength = 10.0;   // Gap between dashes
//     double totalDashGap = dashLength + gapLength;
//     int numDashes = (2 * math.pi * radius / totalDashGap).floor();

//     // Draw dashes around the circle
//     for (int i = 0; i < numDashes; i++) {
//       double startAngle = i * totalDashGap / radius;
//       double endAngle = startAngle + dashLength / radius;

//       canvas.drawArc(
//         Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
//         startAngle,
//         endAngle - startAngle,
//         false,
//         paint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleRadius = 150.0;

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
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 75),
            Stack(
              alignment: Alignment.center,
              children: [
                // Center logo with label below
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/logo.png", // CareSync logo
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Text(
                      "CareSync",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Dashed circle
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: CustomPaint(
                        size: Size(circleRadius * 2, circleRadius * 2),
                        painter: CirclePainter(),
                      ),
                    );
                  },
                ),
                // Rotating images around the logo
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: Stack(
                        children: [
                          _buildCircleImage(circleRadius, 0),
                          _buildCircleImage(circleRadius, 90),
                          _buildCircleImage(circleRadius, 180),
                          _buildCircleImage(circleRadius, 270),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Text(
                  "CareSync",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(14, 190, 126, 1),
                  ),
                ),
                Text(
                  "Stay healthy with us...",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "You are a",
                  style: GoogleFonts.rubik(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigate to BookAppointment screen
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(14, 190, 126, 1),
                    ),
                    child: Text(
                      "Patient",
                      style: GoogleFonts.rubik(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Navigate to BookAppointment screen
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromRGBO(14, 190, 126, 1),
                    ),
                    child: Text(
                      "Doctor",
                      style: GoogleFonts.rubik(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleImage(double radius, double angle) {
    double radian = angle * (math.pi / 180);
    return Transform.translate(
      offset: Offset(
        radius * math.cos(radian),
        radius * math.sin(radian),
      ),
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assets/images/baby.jpg'),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double radius = size.width / 2;
    double dashLength = math.pi / 2; // Length of each dash (60 degrees)
    double gapLength = math.pi / 12;  // Gap between dashes (120 degrees)
    double startAngle = -math.pi / 3; // Start angle for the first dash

    for (int i = 0; i < 4; i++) {
      double angle = startAngle + i * (dashLength + gapLength);
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        angle,
        dashLength,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
