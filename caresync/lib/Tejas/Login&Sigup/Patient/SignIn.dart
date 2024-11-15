import 'package:caresync/Tejas/PatientSide.dart/PatientHomeScreen.dart';
import 'package:caresync/Tejas/Login&Sigup/Patient/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class PatientSignInPage extends StatefulWidget {
  const PatientSignInPage({super.key});

  @override
  State createState() => _PatientSignInPageState();
}

class _PatientSignInPageState extends State<PatientSignInPage> {
  final _patientformKey = GlobalKey<FormState>();
  final TextEditingController _phoneEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // Future<void> _signIn() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       final email = _phoneEmailController.text.trim();
  //       final password = _passwordController.text.trim();

  //       await _auth.signInWithEmailAndPassword(email: email, password: password);

  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const PatientHomeScreen()),
  //       );
  //     } catch (e) {
  //       _showSnackbar('Sign-in failed: ${e.toString()}');
  //     }
  //   }
  // }

  // Future<void> _signIn() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       final email = _phoneEmailController.text.trim();
  //       final password = _passwordController.text.trim();

  //       await _auth.signInWithEmailAndPassword(
  //           email: email, password: password);

  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const PatientHomeScreen()),
  //       );
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'user-not-found') {
  //         // Show a friendly message when the account does not exist
  //         _showSnackbar("Account not found. Please create a new account.");
  //       } else if (e.code == 'wrong-password') {
  //         _showSnackbar("Incorrect password. Please try again.");
  //       } else {
  //         _showSnackbar("Sign-in failed");
  //       }
  //     } catch (e) {
  //       _showSnackbar("Sign-in failed: ${e.toString()}");
  //     }
  //   }
  // }

  Future<void> _signIn() async {
  if (_patientformKey.currentState!.validate()) {
    try {
      final email = _phoneEmailController.text.trim();
      final password = _passwordController.text.trim();

      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PatientHomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showSnackbar("No account found. Please create a new account to get started.");
      } else {
        // Authentication issue (generic message for wrong-password or other issues)
        _showSnackbar("Authentication failed. Please check your credentials and try again.");
      }
    }
  }
}

  
  Future<void> _sendPasswordResetEmail() async {
    final email = _phoneEmailController.text.trim();
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
            padding: EdgeInsets.fromLTRB(
              paddingHorizontal,
              paddingVertical,
              paddingHorizontal,
              paddingHorizontal,
            ),
            child: Form(
              key: _patientformKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: fontSizeTitle,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  TextFormField(
                    controller: _phoneEmailController,
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
                    controller: _passwordController,
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
                              builder: (context) => const PatientSignUpPage(),
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