// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PatientProfilePage extends StatefulWidget {
//   const PatientProfilePage({super.key});

//   @override
//   State<PatientProfilePage> createState() => _PatientProfilePageState();
// }

// class _PatientProfilePageState extends State<PatientProfilePage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Controllers for text fields
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();

//   bool _isEditable = false; // To track if the fields should be editable
//   bool _isLoading = false; // To track loading state for save button

//   @override
//   void initState() {
//     super.initState();
//     _loadPatientData();
//   }

//   Future<void> _loadPatientData() async {
//     try {
//       User? user = _auth.currentUser; 
//       if (user != null) {
//         // Fetch patient data from Firestore
//         DocumentSnapshot snapshot = await _firestore
//             .collection('patients') // Adjust this to your Firebase collection name
//             .doc(user.uid) // Assuming document ID is the user's UID
//             .get();

//         if (snapshot.exists) {
//           Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

//           // Update the controllers with the fetched data
//           _nameController.text = data['name'] ?? '';
//           _phoneController.text = data['phone'] ?? '';
//           _emailController.text = data['email'] ?? '';
//           _genderController.text = data['gender'] ?? '';
//           _dobController.text = data['dob'] ?? '';
//         }
//       }
//     } catch (e) {
//       print('Error fetching patient data: $e');
//     }
//   }

//   Future<void> _saveChanges() async {
//     setState(() {
//       _isLoading = true; 
//     });

//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         // Update Firestore with the new data
//         await _firestore.collection('patients').doc(user.uid).update({
//           'name': _nameController.text,
//           'dob': _dobController.text,
//         });

//         // Display a success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Changes saved successfully!")),
//         );
//       }
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Error saving changes")),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Container(
//         alignment: Alignment.topCenter,
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
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Custom AppBar
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(17),
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           size: 30,
//                           Icons.arrow_back_ios_new_rounded,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenWidth * 0.37),
//                     Expanded(
//                       child: Text(
//                         "Profile",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.teal[700],
//                           fontSize: screenWidth * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.1),
//                   ],
//                 ),

//                 // Profile picture with edit icon
//                 Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     Container(
//                       width: screenWidth * 0.2,
//                       height: screenWidth * 0.2,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Colors.green.shade400, Colors.green.shade200],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Center(
//                         child: Icon(
//                           Icons.person,
//                           size: screenWidth * 0.1,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 4,
//                       right: 4,
//                       child: GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _isEditable = !_isEditable;
//                           });
//                         },
//                         child: Container(
//                           width: screenWidth * 0.06,
//                           height: screenWidth * 0.06,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 2,
//                               ),
//                             ],
//                           ),
//                           child: Icon(
//                             Icons.edit,
//                             size: screenWidth * 0.04,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.02),

//                 // TextFields for user input
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                   child: TextField(
//                     controller: _nameController,
//                     enabled: _isEditable,
//                     decoration: InputDecoration(
//                       labelText: "Full Name",
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(23),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     style: TextStyle(fontSize: screenWidth * 0.04),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                   child: TextField(
//                     controller: _phoneController,
//                     enabled: false, // Phone number is not editable
//                     decoration: InputDecoration(
//                       labelText: "Phone Number",
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(23),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     style: TextStyle(fontSize: screenWidth * 0.04),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                   child: TextField(
//                     controller: _emailController,
//                     enabled: false, // Email is not editable
//                     decoration: InputDecoration(
//                       labelText: "Email",
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(23),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     style: TextStyle(fontSize: screenWidth * 0.04),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                   child: TextField(
//                     controller: _genderController,
//                     enabled: _isEditable,
//                     decoration: InputDecoration(
//                       labelText: "Gender",
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(23),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     style: TextStyle(fontSize: screenWidth * 0.04),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
//                   child: TextField(
//                     controller: _dobController,
//                     enabled: _isEditable,
//                     decoration: InputDecoration(
//                       labelText: "Date of Birth",
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(23),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     style: TextStyle(fontSize: screenWidth * 0.04),
//                   ),
//                 ),

//                 // Save Changes Button
//                 if (_isEditable)
//                   Padding(
//                     padding: EdgeInsets.only(top: screenHeight * 0.02),
//                     child: _isLoading
//                         ? CircularProgressIndicator()
//                         : ElevatedButton(
//                             onPressed: _saveChanges,
//                             child: Text('Save Changes'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: screenWidth * 0.2,
//                                 vertical: screenHeight * 0.015,
//                               ),
//                             ),
//                           ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientProfilePage extends StatefulWidget {
  const PatientProfilePage({super.key});

  @override
  State<PatientProfilePage> createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool _isEditable = false; // To track if the fields should be editable
  bool _isLoading = false; // To track loading state for save button

  @override
  void initState() {
    super.initState();
    _loadPatientData();
  }

  Future<void> _loadPatientData() async {
    try {
      User? user = _auth.currentUser; 
      if (user != null) {
        // Fetch patient data from Firestore
        DocumentSnapshot snapshot = await _firestore
            .collection('patients') 
            .doc(user.uid) 
            .get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

          // Update the controllers with the fetched data
          _nameController.text = data['name'] ?? '';
          _phoneController.text = data['phone'] ?? '';
          _emailController.text = data['email'] ?? '';
          _genderController.text = data['gender'] ?? '';
          _dobController.text = data['dob'] ?? '';
        }
      }
    } catch (e) {
      print('Error fetching patient data: $e');
    }
  }

  Future<void> _saveChanges() async {
    setState(() {
      _isLoading = true; 
    });

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Update Firestore with the new data
        await _firestore.collection('patients').doc(user.uid).update({
          'name': _nameController.text,
          'dob': _dobController.text,
        });

        // Display a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Changes saved successfully!")),
        );
      }
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error saving changes")),
      );
    } finally {
      setState(() {
        _isLoading = false;
        _isEditable = false; // Hide the save button after saving
      });
    }
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0]; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        alignment: Alignment.topCenter,
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
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Custom AppBar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          size: 30,
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.37),
                    Expanded(
                      child: Text(
                        "Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.teal[700],
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.1),
                  ],
                ),

                // Profile picture with edit icon
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: screenWidth * 0.2,
                      height: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green.shade400, Colors.green.shade200],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: screenWidth * 0.1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isEditable = !_isEditable;
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.edit,
                            size: screenWidth * 0.04,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),

                // TextFields for user input
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: TextField(
                    controller: _nameController,
                    enabled: _isEditable,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        //borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: TextField(
                    controller: _phoneController,
                    enabled: false, 
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        //borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: TextField(
                    controller: _emailController,
                    enabled: false, // Email is not editable
                    decoration: InputDecoration(
                      labelText: "Email",
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        //borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: TextField(
                    controller: _genderController,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: "Gender",
                      filled: true,
                      fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        //borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child: GestureDetector(
                    onTap: () => _selectDate(context), 
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _dobController,
                        enabled: _isEditable,
                        decoration: InputDecoration(
                          labelText: "Date of Birth",
                          filled: true,
                          fillColor: Colors.black12,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(23),
                            //borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Save button
                if (_isEditable && !_isLoading)
                  ElevatedButton(
                    onPressed: _saveChanges,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.3, vertical: screenHeight * 0.02),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        
                      ),
                      backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                    ),
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                if (_isLoading) CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
