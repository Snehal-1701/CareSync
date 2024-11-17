import 'package:animate_do/animate_do.dart';
import 'package:caresync/Tejas/AdminSide/AdminHomescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminSignInPage extends StatefulWidget {
  const AdminSignInPage({super.key});

  @override
  State createState() => _AdminSignInPageState();
}

class _AdminSignInPageState extends State<AdminSignInPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  bool _nameErrorVisible = false;
  bool _emailErrorVisible = false;
  bool _passwordErrorVisible = false;

  @override
  void initState() {
    super.initState();
    _checkLoginState();
  }


  Future<void> _checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // Navigate directly to the admin home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  Future<void> _signInAdmin() async {
    if (_formKey.currentState?.validate() != true) return;

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final adminDoc = await _firestore.collection('Caresync').doc('admin').get();

      if (adminDoc.exists) {
        // Admin account already exists, validate credentials
        final adminData = adminDoc.data();
        if (adminData?['email'] == email && adminData?['password'] == password) {
          // Correct credentials, save login state
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);

          // Correct credentials, log in the admin
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          // Credentials do not match
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Admin account already exists. Please use the correct credentials to log in.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // No admin account exists, create one
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
        await _firestore.collection('CareSync').doc('admin').set({
          'name': name,
          'email': email,
          'password': password,
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Admin account created successfully. You are now logged in.'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email to reset your password.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent to $email'),
          backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
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
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeInUp(
                    child: Text(
                      'Admin Sign In',
                      style: TextStyle(
                        fontSize: fontSizeTitle,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  FadeInUp(
                    child: TextFormField(
                      controller: _nameController,
                      onChanged: (value) {
                        setState(() {
                          _nameErrorVisible = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your name',
                        prefixIcon: Icon(Icons.person_outline, size: iconSize),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorText:
                            _nameErrorVisible ? 'Please enter your name' : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  FadeInUp(
                    child: TextFormField(
                      controller: _emailController,
                      onChanged: (value) {
                        setState(() {
                          _emailErrorVisible = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        prefixIcon: Icon(Icons.email_outlined, size: iconSize),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorText: _emailErrorVisible
                            ? 'Please enter a valid email'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  FadeInUp(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      onChanged: (value) {
                        setState(() {
                          _passwordErrorVisible = value.isEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        prefixIcon: Icon(Icons.lock_outline, size: iconSize),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorText: _passwordErrorVisible
                            ? 'Password must be at least 6 characters long'
                            : null,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: _resetPassword,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Color.fromRGBO(14, 190, 127, 1)),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  FadeInUp(
                    child: ElevatedButton(
                      onPressed: _signInAdmin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015),
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
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
