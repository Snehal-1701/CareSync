// import 'package:caresync/Komal/ChatApp/Messages.dart';
// import 'package:caresync/Komal/Notification.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'Drawer.dart';

// class DoctorHomeScreen extends StatefulWidget {
//   const DoctorHomeScreen({super.key});

//   @override
//   _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
// }

// class _DoctorHomeScreenState extends State{
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final int _selectedIndex = 0;
//   bool isDarkMode = false;

//   final List<String> imageList = [
//     'assets/jpg/DoctorSide/appint.jpg',
//     'assets/jpg/DoctorSide/history.jpg',
//     'assets/jpg/DoctorSide/pateint.jpg',
//     'assets/jpg/DoctorSide/earning.jpg',
//   ];

//   void _toggleTheme() {
//     setState(() {
//       isDarkMode = !isDarkMode;
//     });
//   }

//   ThemeData _getTheme() {
//     return isDarkMode
//         ? ThemeData.dark().copyWith(
//             primaryColor: Colors.teal,
//             scaffoldBackgroundColor: Colors.grey[900],
//           )
//         : ThemeData.light().copyWith(
//             primaryColor: Colors.blue,
//             scaffoldBackgroundColor: Colors.white,
//           );
//   }

//   String _doctorName = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadDoctorData();
//   }

//   Future<void> _loadDoctorData() async {
//     try {
//       User? user = _auth.currentUser; 
//       if (user != null) {
//         // Fetch patient data from Firestore
//         DocumentSnapshot snapshot = await _firestore.collection('CareSync').doc('doctors').collection('accounts').doc(user.uid).get();

//         if (snapshot.exists) {
//           Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

//           setState(() {
//             _doctorName = data['name'] ;
//           });
          
//         }
//       }
//     } catch (e) {
//       print('Error fetching doctor data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: _getTheme(),
//       home: Scaffold(
//         drawer: AppDrawer(
//           isDarkMode: isDarkMode,
//           toggleTheme: _toggleTheme,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   stops: [0.0, 0.3, 0.7, 1.0],
//                   colors: [
//                     Color.fromRGBO(97, 206, 255, 220),
//                     Colors.white,
//                     Colors.white,
//                     Color.fromRGBO(14, 190, 126, 220),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(16.0, height * 0.06, 16, 0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     _buildAppBar(width),
//                     Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.black12.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           _buildWelcomeSection(width, height),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white10.withOpacity(0.5),
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(40),
//                                 topRight: Radius.circular(40),
//                               ),
//                             ),

//                               padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 16),
//                             height: height * 0.7,
//                             child: GridView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 mainAxisSpacing: 20,
//                                 crossAxisSpacing: 30,
//                               ),
//                               itemCount: imageList.length,
//                               itemBuilder: (context, index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => _gridPages[index],
//                                     //   ),
//                                     // );
//                                   },
//                                   child: _buildGridItem(index, imageList[index]),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAppBar(double width) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Builder(
//           builder: (context) {
//             return IconButton(
//               icon: const Icon(Icons.menu, size: 32,color: Colors.black87,),
//               onPressed: () => Scaffold.of(context).openDrawer(),
//             );
//           },
//         ),
//         const SizedBox(width: 60),
//         Text(
//           'Dashboard',
//           style: GoogleFonts.lato(fontSize: width * 0.07, fontWeight: FontWeight.bold),
//         ),
//         const Spacer(),
//         IconButton(
//           icon: const Icon(Icons.notification_add_outlined, size: 32, color: Colors.black87,),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => const NotificationApp(),
//               ),
//             );
//           },
//         ),
//         IconButton(
//           icon: const Icon(Icons.chat_outlined, size: 32, color: Colors.black87,),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => const MessageScreen(),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildWelcomeSection(double width, double height) {
//     return Padding(
//       padding: EdgeInsets.all(width * 0.04),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 4),
//               Text(
//                 'Welcome',
//                 style: GoogleFonts.lato(fontSize: width * 0.07,fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Text(_doctorName,
//               style: GoogleFonts.lato(fontSize: width*0.06,color: Colors.black),
//               ),
//             ],
//           ),
//           Image.asset(
//             'assets/png/DoctorSide/logo.png',
//             width: width * 0.39,
//             height: height * 0.18,
//             fit: BoxFit.fill,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildGridItem(int index, String imagePath) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//       decoration: BoxDecoration(
//         boxShadow: [
//                     BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.white,
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Image.asset(
//           imagePath,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }


import 'package:animate_do/animate_do.dart';
import 'package:caresync/Komal/ChatApp/Messages.dart';
import 'package:caresync/Komal/Notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Drawer.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isDarkMode = false;
  String _patientName = '';
  late AnimationController _controller;

  final List<String> imageList = [
    'assets/jpg/DoctorSide/appint.jpg',
    'assets/jpg/DoctorSide/history.jpg',
    'assets/jpg/DoctorSide/pateint.jpg',
    'assets/jpg/DoctorSide/earning.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _loadDoctorData();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadDoctorData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot =
            await _firestore.collection('CareSync').doc('doctors').collection('accounts').doc(user.uid).get();
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          setState(() {
            _patientName = data['name'];
          });
        }
      }
    } catch (e) {
      print('Error fetching doctor data: $e');
    }
  }

  ThemeData _getTheme() {
    return isDarkMode
        ? ThemeData.dark().copyWith(
            primaryColor: const Color.fromRGBO(14, 190, 127, 1),
            scaffoldBackgroundColor: Colors.grey[900],
          )
        : ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          );
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _getTheme(),
      home: Scaffold(
        drawer: AppDrawer(
          isDarkMode: isDarkMode,
          toggleTheme: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
        ),
        body: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.lerp(
                            const Color.fromRGBO(97, 206, 255, 220),
                            const Color.fromRGBO(14, 190, 126, 220),
                            _controller.value)!,
                        Colors.white,
                        Colors.white,
                        Color.lerp(
                            const Color.fromRGBO(97, 206, 255, 220),
                            const Color.fromRGBO(14, 190, 126, 220),
                            1 - _controller.value)!,
                      ],
                    ),
                  ),
                );
              },
            ),
            SpinPerfect(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, height * 0.06, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildAppBar(width),
                      const SizedBox(height: 15,),
                      Column(
                        children: [
                          _buildWelcomeSection(width, height),
                          Container(
                            decoration: const BoxDecoration(
                              //color: Colors.white10.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
                            height: height * 0.7,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 30,
                              ),
                              itemCount: imageList.length,
                              itemBuilder: (context, index) {
                                return _buildGridItem(index, imageList[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildAppBar(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 32,
                color: Colors.black87,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        const SizedBox(width: 90,),
        Text(
          'CareSync',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            size: 32,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationApp()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.chat_outlined, size: 32, color: Colors.black87,),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MessageScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildWelcomeSection(double width, double height) {
    return Container(
      width: width * 0.9,
      height: height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Dr. $_patientName !',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                ' How can we assist you today?',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/png/DoctorSide/logo.png',
            width: width * 0.36,
            height: height * 0.23,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(int index, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1.5,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

