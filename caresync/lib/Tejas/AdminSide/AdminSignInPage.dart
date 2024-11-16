// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:caresync/Tejas/PatientSide.dart/PatientHomeScreen.dart';

// class AdminSignInPage extends StatefulWidget {
//   const AdminSignInPage({super.key});

//   @override
//   State createState() => _AdminSignInPageState();
// }

// class _AdminSignInPageState extends State<AdminSignInPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _otpController = TextEditingController();
//   bool _isOTPRequested = false;
//   String? _verificationId;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Function to show Snackbars for any errors or notifications
//   void _showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Request OTP to the given phone number
//   Future<void> _requestOTP() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         // Verifying phone number using Firebase authentication
//         await _auth.verifyPhoneNumber(
//           phoneNumber: '+91' + _phoneController.text.trim(),  // Make sure to add +91 for Indian phone numbers
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             // Auto-sign-in when the verification is complete
//             await _auth.signInWithCredential(credential);
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => const PatientHomeScreen()),
//             );
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             _showSnackbar('Verification failed: ${e.message}');
//           },
//           codeSent: (String verificationId, int? resendToken) {
//             setState(() {
//               _verificationId = verificationId;
//               _isOTPRequested = true;
//             });
//             _showSnackbar('OTP sent to your phone');
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             _verificationId = verificationId;
//           },
//         );
//       } catch (e) {
//         _showSnackbar('Failed to request OTP: $e');
//       }
//     }
//   }

//   // Verify the OTP received
//   Future<void> _verifyOTP() async {
//     if (_verificationId != null && _otpController.text.isNotEmpty) {
//       try {
//         PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: _verificationId!,
//           smsCode: _otpController.text.trim(),
//         );

//         await _auth.signInWithCredential(credential);
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const PatientHomeScreen()),
//         );
//       } catch (e) {
//         _showSnackbar('Invalid OTP. Try again.');
//       }
//     } else {
//       _showSnackbar('Please enter the OTP');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     double paddingHorizontal = screenWidth * 0.05;
//     double paddingVertical = screenHeight * 0.2;
//     double fontSizeTitle = screenWidth * 0.08;
//     double fontSizeButton = screenWidth * 0.04;
//     double iconSize = screenWidth * 0.07;

//     return Scaffold(
//       body: Container(
//         height: screenHeight,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color.fromRGBO(97, 206, 255, 220),
//               Colors.white,
//               Colors.white,
//               Color.fromRGBO(14, 190, 126, 220),
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(
//               paddingHorizontal,
//               paddingVertical,
//               paddingHorizontal,
//               paddingHorizontal,
//             ),
//             child: Form(
//               key: _formKey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Text(
//                     'Admin Sign In with Phone',
//                     style: TextStyle(
//                       fontSize: fontSizeTitle,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   TextFormField(
//                     controller: _phoneController,
//                     decoration: InputDecoration(
//                       labelText: 'Enter your phone number',
//                       prefixIcon: Icon(Icons.phone, size: iconSize),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       // Add additional phone number validation logic if required
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: screenHeight * 0.025),
//                   if (_isOTPRequested)
//                     TextFormField(
//                       controller: _otpController,
//                       decoration: InputDecoration(
//                         labelText: 'Enter OTP',
//                         prefixIcon: Icon(Icons.lock, size: iconSize),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter OTP';
//                         }
//                         return null;
//                       },
//                     ),
//                   SizedBox(height: screenHeight * 0.025),
//                   ElevatedButton(
//                     onPressed: _isOTPRequested ? _verifyOTP : _requestOTP,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
//                       padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     child: Text(
//                       _isOTPRequested ? 'Verify OTP' : 'Request OTP',
//                       style: TextStyle(
//                         fontSize: fontSizeButton,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:caresync/Tejas/AdminSide/AdminHomescreen.dart';
import 'package:flutter/material.dart';

class AdminSignInPage extends StatefulWidget {
  const AdminSignInPage({super.key});

  @override
  State createState() => _AdminSignInPageState();
}

class _AdminSignInPageState extends State<AdminSignInPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _goToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double paddingHorizontal = screenWidth * 0.05;
    double paddingVertical = screenHeight * 0.2;
    double fontSizeTitle = screenWidth * 0.08;
    double fontSizeButton = screenWidth * 0.04;
    double iconSize = screenWidth * 0.07;

    return Scaffold(
      body: Container(
        height: screenHeight,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              paddingHorizontal,
              paddingVertical,
              paddingHorizontal,
              paddingHorizontal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Admin Sign In',
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    prefixIcon: Icon(Icons.person_outline, size: iconSize),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.phone, size: iconSize),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 10) {
                      return 'Phone number must be 10 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.05),
                ElevatedButton(
                  onPressed: _goToHomeScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: fontSizeButton,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
