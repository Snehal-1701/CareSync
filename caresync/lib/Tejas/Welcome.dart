// import 'package:caresync/Tejas/AdminSide/AdminSignInPage.dart';
// import 'package:caresync/Tejas/Login&Sigup/Doctor/SignIn.dart';
// import 'package:caresync/Tejas/Login&Sigup/Patient/SignIn.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginSelectionScreen extends StatelessWidget {
//   const LoginSelectionScreen({super.key});

//   void _navigateToLogin(BuildContext context, String userType) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) {
//           switch (userType) {
//             case 'admin':
//               return const AdminSignInPage();
//             case 'patient':
//               return const PatientSignInPage();
//             case 'doctor':
//               return const DoctorSignInPage();
//             default:
//               return const LoginSelectionScreen();
//           }
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color.fromRGBO(97, 206, 255, 220),
//               Colors.white,
//               Color.fromRGBO(14, 190, 126, 220),
//             ],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Choose Login Type',
//                 style: GoogleFonts.poppins(
//                   fontSize: screenWidth * 0.06,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _buildLoginOption(
//                 context,
//                 'Admin Login',
//                 Icons.admin_panel_settings,
//                 Colors.orange,
//                 () => _navigateToLogin(context, 'admin'),
//               ),
//               const SizedBox(height: 20),
//               _buildLoginOption(
//                 context,
//                 'Patient Login',
//                 Icons.person,
//                 Colors.blue,
//                 () => _navigateToLogin(context, 'patient'),
//               ),
//               const SizedBox(height: 20),
//               _buildLoginOption(
//                 context,
//                 'Doctor Login',
//                 Icons.local_hospital,
//                 Colors.green,
//                 () => _navigateToLogin(context, 'doctor'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginOption(
//     BuildContext context,
//     String title,
//     IconData icon,
//     Color color,
//     VoidCallback onTap,
//   ) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: screenWidth * 0.7,
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: color.withOpacity(0.4),
//               blurRadius: 10,
//               offset: const Offset(0, 5),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 30),
//             const SizedBox(width: 10),
//             Text(
//               title,
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontSize: screenWidth * 0.05,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:caresync/Tejas/AdminSide/AdminSignInPage.dart';
import 'package:caresync/Tejas/Login&Sigup/Doctor/SignIn.dart';
import 'package:caresync/Tejas/Login&Sigup/Patient/SignIn.dart';
import 'package:flutter/material.dart';


class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Login Type")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientSignInPage()),
                );
              },
              child: const Text("Patient Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DoctorSignInPage()),
                );
              },
              child: const Text("Doctor Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminSignInPage()),
                );
              },
              child: const Text("Admin Login"),
            ),
          ],
        ),
      ),
    );
  }
}
