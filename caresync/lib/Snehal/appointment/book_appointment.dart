// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'select_slot.dart';
// import 'package:intl/intl.dart';

// class BookAppointment extends StatefulWidget {
//   const BookAppointment({super.key});

//   @override
//   State<BookAppointment> createState() => _BookAppointmentState();
// }

// class _BookAppointmentState extends State<BookAppointment> {

//   TextEditingController dateController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       ///BOOK APPOINTMENT UI
//       body: Container(
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.0, 0.3, 0.7, 1.0],
//           colors: [
//             Color.fromRGBO(97, 206, 255, 220),
//             Colors.white,
//             Colors.white,
//             Color.fromRGBO(14, 190, 126, 220),
//           ],
//         )),
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 25.0, left: 15, right: 15, bottom: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   ///ICON - BACK
//                   GestureDetector(
//                     onTap: (){
//                       //Navigator.pop(context);
//                     },
//                     child: Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           size: 30,
//                           Icons.arrow_back_ios_new_rounded,
//                           color: Colors.grey,
//                         )),
//                   ),
//                   const SizedBox(width: 25),

//                   ///TEXT
//                   Text(
//                     "Appointment",
//                     style: GoogleFonts.rubik(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),

//               ///CARD
//               Container(
//                 margin: const EdgeInsets.only(top: 20),
//                 padding: const EdgeInsets.all(12),
//                 height: 120,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                         color: Color.fromRGBO(0, 0, 0, 0.2),
//                         blurRadius: 18,
//                         offset: Offset(0, 4)),
//                   ],
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ///IMAGE
//                     Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       clipBehavior: Clip.antiAlias,
//                       child: Image.asset(
//                         "assets/images/profile1.jpg",
//                       ),
//                     ),

//                     ///COLUMN - TEXT
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Dr.Komal Bhosale",
//                               style: GoogleFonts.rubik(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 "Upasana Dental Clinic, salt lake",
//                                 style: GoogleFonts.rubik(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ),

//                             ///ROW - STARS
//                             Row(
//                               children: [
//                                 const Icon(
//                                   size: 16,
//                                   Icons.star,
//                                   color: Color.fromARGB(255, 199, 199, 14),
//                                 ),
//                                 const Icon(
//                                   size: 16,
//                                   Icons.star,
//                                   color: Color.fromARGB(255, 199, 199, 14),
//                                 ),
//                                 const Icon(
//                                   size: 16,
//                                   Icons.star,
//                                   color: Color.fromARGB(255, 199, 199, 14),
//                                 ),
//                                 const Icon(
//                                   size: 16,
//                                   Icons.star,
//                                   color: Color.fromARGB(255, 199, 199, 14),
//                                 ),
//                                 const Icon(
//                                   size: 16,
//                                   Icons.star,
//                                   color: Color.fromARGB(255, 199, 199, 14),
//                                 ),
//                                 const Spacer(),
//                                 Text(
//                                   "₹ 500.00/hr",
//                                   style: GoogleFonts.rubik(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     ///LIKE ICON
//                     const Icon(
//                       Icons.favorite,
//                       color: Colors.red,
//                     ),
//                   ],
//                 ),
//               ),

//               ///TEXT
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Text(
//                   "Appointment For",
//                   style: GoogleFonts.rubik(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),

//               ///TEXTFIELD - NAME
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 4.0),
//                 child: TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     hintText: "Patient Name",
//                     hintStyle: GoogleFonts.rubik(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                   ),
//                 ),
//               ),

//               ///TEXTFIELD - CONTACT NUMBER
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: TextField(
//                   controller: numberController,
//                   decoration: InputDecoration(
//                     hintText: "Contact Number",
//                     hintStyle: GoogleFonts.rubik(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.grey,
//                     ),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide:
//                           // BorderSide(color: Color.fromARGB(103, 114, 148, 120)),
//                           BorderSide(color: Colors.grey),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                   ),
//                 ),
//               ),

//               ///DATEPICKER
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4.0),
//                   child: TextField(
//                     controller: dateController,
//                     readOnly: true,
//                     onTap: () async {
//                       DateTime? pickedDate = await showDatePicker(
//                         context: context,
//                         firstDate: DateTime(2024),
//                         lastDate: DateTime(2025),
//                       );
                  
//                       String formattedDate =
//                           DateFormat.yMMMd().format(pickedDate!);
                  
//                       setState(() {
//                         dateController.text = formattedDate;
//                       });
//                     },
//                     decoration: InputDecoration(
//                       suffixIcon: const Icon(
//                         Icons.calendar_month_outlined,
//                       ),
//                       hintText: "Date",
//                     hintStyle: GoogleFonts.rubik(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.grey),
//                       enabledBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     ),
//                   ),
//                 ),
//               ///TEXT
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Text(
//                   "Who is this patient?",
//                   style: GoogleFonts.rubik(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),

//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Column(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(right: 12),
//                           height: 140,
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             color: const Color.fromARGB(255, 172, 250, 223),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(
//                                 size: 40,
//                                 Icons.add,
//                                 color: Color.fromRGBO(14, 190, 127, 1),
//                               ),
//                               Text(
//                                 "Add",
//                                 style: GoogleFonts.rubik(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.w500,
//                                   color: const Color.fromRGBO(14, 190, 127, 1),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "Add More",
//                             style: GoogleFonts.rubik(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                             margin: const EdgeInsets.only(right: 12),
//                             height: 140,
//                             width: 100,
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: const Color.fromARGB(255, 172, 250, 223),
//                             ),
//                             child: Image.asset("assets/images/man.png",
//                                 fit: BoxFit.cover)),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "My self",
//                             style: GoogleFonts.rubik(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                             margin: const EdgeInsets.only(right: 12),
//                             height: 140,
//                             width: 100,
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: const Color.fromARGB(255, 172, 250, 223),
//                             ),
//                             child: Image.asset("assets/images/baby.png")),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "My child",
//                             style: GoogleFonts.rubik(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                             margin: const EdgeInsets.only(right: 12),
//                             height: 140,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: const Color.fromARGB(255, 172, 250, 223),
//                             ),
//                             child: Image.asset("assets/images/woman.png",
//                                 fit: BoxFit.cover)),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "My wife",
//                             style: GoogleFonts.rubik(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               ///BUTTON NEXT
//               Center(
//                 child: GestureDetector(
//                   onTap:() {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const SelectTime())
//                     );
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(top:5),
//                     padding: const EdgeInsets.all(10),
//                     alignment: Alignment.center,
//                     width: 300,
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(14, 190, 127, 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       "Next",
//                       style: GoogleFonts.rubik(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
      
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'select_slot.dart';
import 'package:intl/intl.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02, horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row with Back Icon and Appointment Text
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Icon(
                        size: isLargeScreen ? 40 : 30,
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.06),
                  Text(
                    "Appointment",
                    style: GoogleFonts.rubik(
                      fontSize: isLargeScreen ? 30 : 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              // Doctor Card
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.03),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Doctor Image
                    Container(
                      height: screenHeight * 0.13,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/images/profile1.jpg",
                      ),
                    ),
                    // Doctor Info
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr.Komal Bhosale",
                              style: GoogleFonts.rubik(
                                fontSize: isLargeScreen ? 22 : 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Upasana Dental Clinic, salt lake",
                                style: GoogleFonts.rubik(
                                  fontSize: isLargeScreen ? 16 : 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            // Ratings and Fee
                            Row(
                              children: List.generate(5, (index) {
                                return const Icon(
                                  size: 16,
                                  Icons.star,
                                  color: Color.fromARGB(255, 199, 199, 14),
                                );
                              })
                                ..add(
                                  const Spacer(),
                                )
                                ..add(
                                  Text(
                                    "₹ 500.00/hr",
                                    style: GoogleFonts.rubik(
                                      fontSize: isLargeScreen ? 18 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Like Icon
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),

              // Text Fields and Buttons
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Appointment For",
                style: GoogleFonts.rubik(
                  fontSize: isLargeScreen ? 24 : 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              _buildTextField("Patient Name", nameController),
              _buildTextField("Contact Number", numberController),
              _buildDateField(context, dateController),

              // Patient Selection Options
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Who is this patient?",
                style: GoogleFonts.rubik(
                  fontSize: isLargeScreen ? 24 : 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildPatientOptions(),
                ),
              ),

              // Next Button
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectTime(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.02),
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    alignment: Alignment.center,
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(14, 190, 127, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.rubik(
                        fontSize: isLargeScreen ? 20 : 18,
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
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025),
          );

          if (pickedDate != null) {
            String formattedDate = DateFormat.yMMMd().format(pickedDate);
            setState(() {
              controller.text = formattedDate;
            });
          }
        },
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.calendar_month_outlined),
          hintText: "Date",
          hintStyle: GoogleFonts.rubik(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPatientOptions() {
    return [
      _buildPatientOption("Add More", "assets/images/add.png"),
      _buildPatientOption("Myself", "assets/images/man.png"),
      _buildPatientOption("My Child", "assets/images/baby.png"),
      _buildPatientOption("My Parent", "assets/images/parents.png"),
      _buildPatientOption("My Relative", "assets/images/relatives.png"),
      _buildPatientOption("My Friend", "assets/images/friends.png"),
    ];
  }

  Widget _buildPatientOption(String label, String imagePath) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 50),
          Text(label),
        ],
      ),
    );
  }
}
