// import 'package:animate_do/animate_do.dart';
// import 'package:caresync/Komal/Ayurveda/Ayurveda.dart';
// import 'package:caresync/Komal/ChatApp/Messages.dart';
// import 'package:caresync/Komal/Notification.dart';
// import 'package:caresync/Snehal/dr_speciality/specilisation.dart';
// import 'package:caresync/Tejas/Ambulance/AmbulanceHome.dart';
// import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
// import 'package:caresync/Tejas/PatientSide.dart/MedicalStore.dart';
// import 'package:caresync/Tejas/PatientSide.dart/Orders.dart';
// import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'Drawer.dart';

// class PatientHomeScreen extends StatefulWidget {
//   const PatientHomeScreen({super.key});

//   @override
//   State createState() => _PatientHomeScreenState();
// }

// class _PatientHomeScreenState extends State<PatientHomeScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   int _selectedIndex = 0;
//   bool isDarkMode = false;

//   final List<Widget> _bottomNavPages = [
//     const PatientHomeScreen(),
//     const Wishlist(),
//     const Cart(),
//     const OrdersPage(),
//   ];

//   final List<Widget> _gridPages = [
//     const DoctorCategories(),
//     const MedicalStore(),
//     const AyurvedaGridScreen(),
//     const Page1(),
//     const AmbulanceBookingHome(),
//     const Page1(),
//   ];

//   final List<String> imageList = [
//     "assets/jpg/HomeScreen/Doctors.jpg",
//     "assets/jpg/HomeScreen/Pharmacy.jpg",
//     "assets/jpg/HomeScreen/Ayurveda.jpg",
//     "assets/jpg/HomeScreen/Diet.jpg",
//     "assets/jpg/HomeScreen/Ambulance.jpg",
//     "assets/png/Blood.png",
//   ];

//   void _toggleTheme() {
//     setState(() {
//       isDarkMode = !isDarkMode;
//     });
//   }

//   ThemeData _getTheme() {
//     return isDarkMode
//         ? ThemeData.dark().copyWith(
//             primaryColor: const Color.fromRGBO(14, 190, 127, 1),
//             scaffoldBackgroundColor: Colors.grey[900],
//           )
//         : ThemeData.light().copyWith(
//             primaryColor: Colors.blue,
//             scaffoldBackgroundColor: Colors.white,
//           );
//   }

//   void _onItemTapped(int index) {
//     if (index != 0) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => _bottomNavPages[index]),
//       );
//     }
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   String _patientName = '';

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
//             .collection('patients')
//             .doc(user.uid)
//             .get();

//         if (snapshot.exists) {
//           Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

//           setState(() {
//             _patientName = data['name'] ;
//           });

//         }
//       }
//     } catch (e) {
//       print('Error fetching patient data: $e');
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
//             SpinPerfect(
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(0, height * 0.06, 0, 0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _buildAppBar(width),
//                       Container(
//                         margin: const EdgeInsets.only(top: 20),
//                         decoration: BoxDecoration(
//                           color: Colors.black12.withOpacity(0.07),
//                           borderRadius: BorderRadius.circular(40),
//                         ),
//                         child: Column(
//                           children: [
//                             _buildWelcomeSection(width, height),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white10.withOpacity(0.5),
//                                 borderRadius: const BorderRadius.only(
//                                   topLeft: Radius.circular(40),
//                                   topRight: Radius.circular(40),
//                                 ),
//                               ),
//                               padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 16),
//                               height: height * 0.7,
//                               child: GridView.builder(
//                                 shrinkWrap: true,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2,
//                                   mainAxisSpacing: 20,
//                                   crossAxisSpacing: 30,
//                                 ),
//                                 itemCount: imageList.length,
//                                 itemBuilder: (context, index) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => _gridPages[index],
//                                         ),
//                                       );
//                                     },
//                                     child: _buildGridItem(index, imageList[index]),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const MedicalStore()),
//             );
//           },
//           tooltip: 'Pharmacy',
//           child: const Icon(Icons.local_pharmacy_outlined, color: Colors.white),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 8.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildBottomNavItem(
//                 icon: Icons.home_outlined,
//                 label: 'Home',
//                 index: 0,
//               ),
//               _buildBottomNavItem(
//                 icon: Icons.favorite_border,
//                 label: 'Wishlist',
//                 index: 1,
//               ),
//               const SizedBox(width: 40),
//               _buildBottomNavItem(
//                 icon: Icons.shopping_cart_outlined,
//                 label: 'Cart',
//                 index: 2,
//               ),
//               _buildBottomNavItem(
//                 icon: Icons.list,
//                 label: 'Orders',
//                 index: 3,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomNavItem({required IconData icon, required String label, required int index}) {
//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: _selectedIndex == index ? const Color.fromRGBO(14, 190, 127, 1) : Colors.black87,
//           ),
//           Text(
//             label,
//             style: TextStyle(
//               color: _selectedIndex == index ? const Color.fromRGBO(14, 190, 127, 1) : Colors.black87,
//               fontSize: 12,
//             ),
//           ),
//         ],
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
//               icon: const Icon(Icons.menu, size: 32, color: Colors.black87,),
//               onPressed: () => Scaffold.of(context).openDrawer(),
//             );
//           },
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
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Welcome',
//                 style: GoogleFonts.lato(fontSize: width * 0.07, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 _patientName,
//                 style: GoogleFonts.lato(fontSize: width * 0.06, color: Colors.black),
//               ),
//             ],
//           ),
//           Image.asset(
//             'assets/png/doctor.png',
//             width: width * 0.32,
//             height: height * 0.23,
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

// class Page1 extends StatelessWidget {
//   const Page1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Page 1')),
//       body: const Center(child: Text('Welcome to Page 1!')),
//     );
//   }
// }

import 'package:animate_do/animate_do.dart';
import 'package:caresync/Komal/Ayurveda/Ayurveda.dart';
import 'package:caresync/Komal/ChatApp/Messages.dart';
import 'package:caresync/Komal/Notification.dart';
import 'package:caresync/Snehal/dr_speciality/specilisation.dart';
import 'package:caresync/Tejas/Ambulance/AmbulanceHome.dart';
import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
import 'package:caresync/Tejas/PatientSide.dart/MedicalStore.dart';
import 'package:caresync/Tejas/PatientSide.dart/Orders.dart';
import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Drawer.dart';

class PatientHomeScreen extends StatefulWidget {
  const PatientHomeScreen({super.key});

  @override
  State createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen>
    with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 0;
  bool isDarkMode = false;
  String _patientName = '';
  late AnimationController _controller;

  final List<Widget> _bottomNavPages = [
    const PatientHomeScreen(),
    const Wishlist(),
    const Cart(),
    const OrdersPage(),
  ];

  final List<Widget> _gridPages = [
    const DoctorCategories(),
    const MedicalStore(),
    const AyurvedaGridScreen(),
    const Page1(),
    AmbulanceBookingHome(),
    const Page1(),
  ];

  final List<String> imageList = [
    "assets/jpg/HomeScreen/Doctors.jpg",
    "assets/jpg/HomeScreen/Pharmacy.jpg",
    "assets/jpg/HomeScreen/Ayurveda.jpg",
    "assets/jpg/HomeScreen/Diet.jpg",
    "assets/jpg/HomeScreen/Ambulance.jpg",
    "assets/png/Blood.png",
  ];

  @override
  void initState() {
    super.initState();
    _loadPatientData();
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

  Future<void> _loadPatientData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot =
            await _firestore.collection('CareSync').doc('patients').collection('accounts').doc(user.uid).get();
        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          setState(() {
            _patientName = data['name'];
          });
        }
      }
    } catch (e) {
      print('Error fetching patient data: $e');
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

  void _onItemTapped(int index) {
    if (index != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _bottomNavPages[index]),
      );
    }
    setState(() {
      _selectedIndex = index;
    });
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
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => _gridPages[index],
                                      ),
                                    );
                                  },
                                  child:
                                      _buildGridItem(index, imageList[index]),
                                );
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MedicalStore()),
            );
          },
          tooltip: 'Pharmacy',
          child: const Icon(Icons.local_pharmacy_outlined, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                index: 0,
              ),
              _buildBottomNavItem(
                icon: Icons.favorite_border,
                label: 'Wishlist',
                index: 1,
              ),
              const SizedBox(width: 40),
              _buildBottomNavItem(
                icon: Icons.shopping_cart_outlined,
                label: 'Cart',
                index: 2,
              ),
              _buildBottomNavItem(
                icon: Icons.list,
                label: 'Orders',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
      {required IconData icon, required String label, required int index}) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? const Color.fromRGBO(14, 190, 127, 1)
                : Colors.black87,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? const Color.fromRGBO(14, 190, 127, 1)
                  : Colors.black87,
              fontSize: 12,
            ),
          ),
        ],
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
                'Welcome, $_patientName!',
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
            'assets/png/doctor.png',
            width: width * 0.32,
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

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: const Center(child: Text('Welcome to Page 1!')),
    );
  }
}
