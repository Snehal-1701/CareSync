import 'package:caresync/Komal/DoctorSide/DoctorHomeScreen.dart';
import 'package:caresync/Tejas/Login&Sigup/Doctor/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoctorSignInPage extends StatefulWidget {
  const DoctorSignInPage({super.key});

  @override
  State createState() => _DoctorSignInPageState();
}

class _DoctorSignInPageState extends State {
  final _doctorformKey = GlobalKey<FormState>();
  final TextEditingController _dphoneEmailController = TextEditingController();
  final TextEditingController _dpasswordController = TextEditingController();
  bool _isPasswordVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // Future<void> _signIn() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       final email = _dphoneEmailController.text.trim();
  //       final password = _dpasswordController.text.trim();

  //       await _auth.signInWithEmailAndPassword(
  //           email: email, password: password);

  //       if (context.mounted) {
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const DoctorHomeScreen()),
  //       );
  //     }
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'user-not-found') {
  //         _showSnackbar(
  //             "No account found. Please create a new account to get started.");
  //       } else {
  //         // Authentication issue (generic message for wrong-password or other issues)
  //         _showSnackbar(
  //             "Authentication failed. Please check your credentials and try again.");
  //       }
  //     }
  //   }
  // }

  Future<void> _signIn() async {
  if (_doctorformKey.currentState!.validate()) {
    try {
      final email = _dphoneEmailController.text.trim();
      final password = _dpasswordController.text.trim();

      // Firebase Authentication Sign-In
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User Signed In: ${userCredential.user?.email}');

      // Navigate to DoctorHomeScreen
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DoctorHomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase errors
      print('FirebaseAuthException: ${e.code}');
      if (e.code == 'user-not-found') {
        _showSnackbar(
          "No account found. Please create a new account to get started.",
        );
      } else if (e.code == 'wrong-password') {
        _showSnackbar("Incorrect password. Please try again.");
      } else {
        _showSnackbar("Authentication failed: ${e.message}");
      }
    } catch (e) {
      // Handle any other errors
      print('Exception: $e');
      _showSnackbar("An error occurred. Please try again.");
    }
  }
}


  Future<void> _sendPasswordResetEmail() async {
    final email = _dphoneEmailController.text.trim();
    if (email.isEmpty) {
      _showSnackbar('Please enter your email to reset password.');
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(email: email);
      _showSnackbar('Password reset email sent. Check your inbox.');
    } catch (e) {
      _showSnackbar('Failed to send reset email: ${e.toString()}');
    }
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
            padding: EdgeInsets.fromLTRB(paddingHorizontal, paddingVertical,
                paddingHorizontal, paddingHorizontal),
            child: Form(
              key: _doctorformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: fontSizeTitle, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  TextFormField(
                      controller: _dphoneEmailController,
                      decoration: InputDecoration(
                        labelText: 'Enter your phone/email',
                        prefixIcon: Icon(Icons.email, size: iconSize),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone or email';
                        }
                        return null;
                      },
                    ),
                  SizedBox(height: screenHeight * 0.025),
                  TextFormField(
                      controller: _dpasswordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock, size: iconSize),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: iconSize,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _sendPasswordResetEmail,
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(color: Color.fromRGBO(14, 190, 127, 1)),
                        ),
                      ),
                    ),
                  SizedBox(height: screenHeight * 0.025),
                  ElevatedButton(
                    onPressed: _signIn,
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
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const DoctorSignUpPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(14, 190, 127, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        child: const Text('OR'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        'Sign In with Google',
                        style: TextStyle(fontSize: fontSizeButton),
                      ),
                      icon: Image.asset("assets/png/GoogleIcon.png",
                          width: iconSize),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
