// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'select_slot.dart';
// import 'package:intl/intl.dart';

// class BookAppointment extends StatefulWidget {
//   final String doctorName;
//   final String clinicName;
//   final String specialty;
//   final String doctorImage;
//   final String doctorId;

//   // Constructor to accept doctor data
//   const BookAppointment({
//     super.key,
//     required this.doctorName,
//     required this.clinicName,
//     required this.specialty,
//     required this.doctorImage,
//     required this.doctorId,
//   });
//   @override
//   State<BookAppointment> createState() => _BookAppointmentState();
// }

// class _BookAppointmentState extends State<BookAppointment> {
//   TextEditingController dateController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     // double iconSize = screenWidth * 0.07;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
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
//           padding: EdgeInsets.only(
//             top: screenHeight * 0.06,
//             left: screenWidth * 0.04,
//             right: screenWidth * 0.04,
//             bottom: screenHeight * 0.00,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                         height: screenWidth * 0.1,
//                         width: screenWidth * 0.1,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(17),
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           size: 30,
//                           Icons.arrow_back_ios_new_rounded,
//                           color: Colors.grey,
//                         )),
//                   ),
//                   SizedBox(width: screenWidth * 0.14),
//                   Center(
//                     child: Text(
//                       "Appointment",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                         fontSize: screenWidth * 0.065,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 10,
//                       spreadRadius: 2,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 clipBehavior: Clip.antiAlias,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.asset(
//                     "assets/Book online doctor appointment.gif",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               Container(
//                 margin: EdgeInsets.only(top: screenHeight * 0.02),
//                 padding: EdgeInsets.all(screenWidth * 0.03),
//                 height: screenHeight * 0.15,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Color.fromRGBO(0, 0, 0, 0.2),
//                       blurRadius: 18,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: screenHeight * 0.13,
//                       width: screenWidth * 0.25,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       clipBehavior: Clip.antiAlias,
//                       child: Image.asset(
//                         widget.doctorImage,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.only(left: screenWidth * 0.02),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   widget.doctorName,
//                                   style: GoogleFonts.poppins(
//                                     fontSize: screenWidth * 0.05,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             // SizedBox(height: 2),
//                             Text(
//                               widget.clinicName,
//                               style: GoogleFonts.poppins(
//                                 fontSize: screenWidth * 0.04,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black,
//                               ),
//                             ),

//                             // SizedBox(height: 2),
//                             Text(
//                               widget.specialty,
//                               style: GoogleFonts.poppins(
//                                 fontSize: screenWidth * 0.04,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
//                 child: Text(
//                   "Appointment For",
//                   style: GoogleFonts.poppins(
//                     fontSize: screenWidth * 0.055,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
//               //   child: TextField(
//               //     controller: nameController,
//               //     decoration: InputDecoration(
//               //       labelText: 'Patient Name',
//               //       // prefixIcon: Icon(Icons.email, size: iconSize),
//               //       labelStyle: GoogleFonts.poppins(
//               //         fontSize: screenWidth * 0.045,
//               //         fontWeight: FontWeight.w400,
//               //         color: Colors.grey,
//               //       ),
//               //       enabledBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(color: Colors.grey),
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //       focusedBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(color: Colors.grey),
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //     ),
//               //   ),
//               // ),

//               // Padding(
//               //   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
//               //   child: TextFormField(
//               //     controller: numberController,
//               //     keyboardType: TextInputType.number,
//               //     validator: (value) {
//               //       if (value == null || value.isEmpty) {
//               //         return 'Please enter your mobile number';
//               //       } else if (!RegExp(r'^\d*$').hasMatch(value)) {
//               //         return 'Please enter numbers only';
//               //       } else if (value.length != 10) {
//               //         return 'Mobile number must be 10 digits';
//               //       }
//               //       return null; // Return null if no error
//               //     },
//               //     decoration: InputDecoration(
//               //       labelText: 'Contact Number',
//               //       labelStyle: GoogleFonts.poppins(
//               //         fontSize: screenWidth * 0.045,
//               //         fontWeight: FontWeight.w400,
//               //         color: Colors.grey,
//               //       ),
//               //       enabledBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(color: Colors.grey),
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //       focusedBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(color: Colors.grey),
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // Padding(
//               //   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
//               //   child: TextField(
//               //     controller: dateController,
//               //     readOnly: true,
//               //     onTap: () async {
//               //       DateTime? pickedDate = await showDatePicker(
//               //         context: context,
//               //         firstDate: DateTime(2024),
//               //         lastDate: DateTime(2025),
//               //       );
//               //       if (pickedDate != null) {
//               //         String formattedDate =
//               //             DateFormat.yMMMd().format(pickedDate);
//               //         setState(() {
//               //           dateController.text = formattedDate;
//               //         });
//               //       }
//               //     },
//               //     decoration: InputDecoration(
//               //       suffixIcon: const Icon(Icons.calendar_month_outlined),
//               //       labelText: 'Date',
//               //       // prefixIcon: Icon(Icons.email, size: iconSize),
//               //       labelStyle: GoogleFonts.poppins(
//               //         fontSize: screenWidth * 0.045,
//               //         fontWeight: FontWeight.w400,
//               //         color: Colors.grey,
//               //       ),
//               //       enabledBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(color: Colors.grey),
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //       focusedBorder: OutlineInputBorder(
//               //         borderSide: const BorderSide(color: Colors.grey),
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //     ),
//               //   ),
//               // ),

//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       // Patient Name Field
//                       // Padding(
//                       //   padding: EdgeInsets.symmetric(
//                       //       vertical: screenHeight * 0.005),
//                       //   child: TextFormField(
//                       //     controller: nameController,
//                       //     validator: (value) {
//                       //       if (value == null || value.isEmpty) {
//                       //         return 'Please enter your name';
//                       //       }
//                       //       return null; // Return null if no error
//                       //     },
//                       //     decoration: InputDecoration(
//                       //       labelText: 'Patient Name',
//                       //       labelStyle: GoogleFonts.poppins(
//                       //         fontSize: screenWidth * 0.045,
//                       //         fontWeight: FontWeight.w400,
//                       //         color: Colors.grey,
//                       //       ),
//                       //       enabledBorder: OutlineInputBorder(
//                       //         borderSide: const BorderSide(color: Colors.grey),
//                       //         borderRadius: BorderRadius.circular(10),
//                       //       ),
//                       //       focusedBorder: OutlineInputBorder(
//                       //         borderSide: const BorderSide(color: Colors.grey),
//                       //         borderRadius: BorderRadius.circular(10),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),

//                       // Contact Number Field
//                       // Padding(
//                       //   padding:
//                       //       EdgeInsets.symmetric(vertical: screenHeight * 0.01),
//                       //   child: TextFormField(
//                       //     controller: numberController,
//                       //     keyboardType: TextInputType.number,
//                       //     validator: (value) {
//                       //       if (value == null || value.isEmpty) {
//                       //         return 'Please enter your mobile number';
//                       //       } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//                       //         return 'Please enter a valid 10-digit mobile number';
//                       //       }
//                       //       return null; // Return null if no error
//                       //     },
//                       //     decoration: InputDecoration(
//                       //       labelText: 'Contact Number',
//                       //       labelStyle: GoogleFonts.poppins(
//                       //         fontSize: screenWidth * 0.045,
//                       //         fontWeight: FontWeight.w400,
//                       //         color: Colors.grey,
//                       //       ),
//                       //       enabledBorder: OutlineInputBorder(
//                       //         borderSide: const BorderSide(color: Colors.grey),
//                       //         borderRadius: BorderRadius.circular(10),
//                       //       ),
//                       //       focusedBorder: OutlineInputBorder(
//                       //         borderSide: const BorderSide(color: Colors.grey),
//                       //         borderRadius: BorderRadius.circular(10),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),

//                       Padding(
//   padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
//   child: Form(
//     key: _formKey,
//     child: Column(
//       children: [
//         // Patient Name Field
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
//           child: TextFormField(
//             controller: nameController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null; // Return null if no error
//             },
//             decoration: InputDecoration(
//               labelText: 'Patient Name',
//               labelStyle: GoogleFonts.poppins(
//                 fontSize: screenWidth * 0.045,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey,
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               // Add error style for better visibility
//               errorStyle: TextStyle(
//                 fontSize: screenWidth * 0.035,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ),

//         // Contact Number Field
//         Padding(
//           padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
//           child: TextFormField(
//             controller: numberController,
//             keyboardType: TextInputType.number,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your mobile number';
//               } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//                 return 'Please enter a valid 10-digit mobile number';
//               }
//               return null; // Return null if no error
//             },
//             decoration: InputDecoration(
//               labelText: 'Contact Number',
//               labelStyle: GoogleFonts.poppins(
//                 fontSize: screenWidth * 0.045,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey,
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               // Add error style for better visibility
//               errorStyle: TextStyle(
//                 fontSize: screenWidth * 0.035,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),

//                       // Date Field
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             vertical: screenHeight * 0.005),
//                         child: TextFormField(
//                           controller: dateController,
//                           readOnly: true,
//                           onTap: () async {
//                             DateTime? pickedDate = await showDatePicker(
//                               context: context,
//                               firstDate: DateTime(2024),
//                               lastDate: DateTime(2025),
//                             );
//                             if (pickedDate != null) {
//                               String formattedDate =
//                                   DateFormat.yMMMd().format(pickedDate);
//                               setState(() {
//                                 dateController.text = formattedDate;
//                               });
//                             }
//                           },
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please select a date';
//                             }
//                             return null; // Return null if no error
//                           },
//                           decoration: InputDecoration(
//                             suffixIcon:
//                                 const Icon(Icons.calendar_month_outlined),
//                             labelText: 'Date',
//                             labelStyle: GoogleFonts.poppins(
//                               fontSize: screenWidth * 0.045,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.grey,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       // If the form is valid, proceed with the form submission
//                       print("Form is valid");
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => SelectTime(
//                             patientName: nameController.text.trim(),
//                             number: numberController.text.trim(),
//                             selectedDate: dateController.text.trim(),
//                             doctorId: widget.doctorId,
//                             doctorName: widget.doctorName,
//                             specialty: widget.specialty,
//                             clinicName: widget.clinicName,
//                             doctorImage: widget.doctorImage,
//                           ),
//                         ),
//                       );
                    
//                       // Add your form submission logic here
//                     } else {
//                       print("Form is invalid");
//                     }
                    
//                       // If all fields are valid, navigate to the next screen
                      
//                   },
//                   child: Container(
//                     margin: EdgeInsets.only(top: screenHeight * 0.029),
//                     padding: EdgeInsets.all(screenWidth * 0.03),
//                     alignment: Alignment.center,
//                     width: screenWidth * 0.8,
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(14, 190, 127, 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       "Next",
//                       style: GoogleFonts.poppins(
//                         fontSize: screenWidth * 0.045,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showError(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _patientOption(String label, IconData? icon, String subtitle,
//       {String? asset}) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(right: screenWidth * 0.03),
//           height: screenHeight * 0.15,
//           width: screenWidth * 0.25,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: const Color.fromARGB(255, 172, 250, 223),
//           ),
//           child: Center(
//             child: icon != null
//                 ? Icon(icon,
//                     size: screenWidth * 0.08,
//                     color: const Color.fromRGBO(14, 190, 127, 1))
//                 : asset != null
//                     ? Image.asset(asset, fit: BoxFit.cover)
//                     : null,
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(screenWidth * 0.01),
//           child: Text(
//             subtitle,
//             style: GoogleFonts.poppins(
//               fontSize: screenWidth * 0.04,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'select_slot.dart';

class BookAppointment extends StatefulWidget {
  final String doctorName;
  final String clinicName;
  final String specialty;
  final String doctorImage;
  final String doctorId;

  const BookAppointment({
    Key? key,
    required this.doctorName,
    required this.clinicName,
    required this.specialty,
    required this.doctorImage,
    required this.doctorId,
  }) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Container(
          padding: EdgeInsets.only(
              right: screenWidth * 0.04,
              left: screenWidth * 0.04,
              top: screenHeight * 0.04,
              bottom: screenHeight * 0.01
            ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.14),
                  Center(
                    child: Text(
                      "Appointment",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.065,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top:15,left:10,right:10,bottom:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/Book online doctor appointment.gif",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Doctor Details
              _buildDoctorDetails(screenHeight, screenWidth),

              // Form Fields
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                child: Text(
                  "Appointment For",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField(
                            label: 'Patient Name',
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          _buildTextField(
                            label: 'Contact Number',
                            controller: numberController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile number';
                              } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                return 'Please enter a valid 10-digit mobile number';
                              }
                              return null;
                            },
                          ),
                          _buildDateField(screenWidth),
                        ],
                      ),
                    ),
                    // Next Button
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectTime(
                            patientName: nameController.text.trim(),
                            number: numberController.text.trim(),
                            selectedDate: dateController.text.trim(),
                            doctorId: widget.doctorId,
                            doctorName: widget.doctorName,
                            specialty: widget.specialty,
                            clinicName: widget.clinicName,
                            doctorImage: widget.doctorImage,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.019),
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    alignment: Alignment.center,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(14, 190, 127, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
                  ],
                ),
                           
               ),
              ),

              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorDetails(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.02),
      padding: EdgeInsets.all(screenWidth * 0.03),
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.13,
            width: screenWidth * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              widget.doctorImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.doctorName,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.clinicName,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.04,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.specialty,
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildDateField(double screenWidth) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: dateController,
      readOnly: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a date';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Date',
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (pickedDate != null) {
          dateController.text = DateFormat('MMMM dd, yyyy').format(pickedDate);
        }
      },
    ),
  );
}

}
