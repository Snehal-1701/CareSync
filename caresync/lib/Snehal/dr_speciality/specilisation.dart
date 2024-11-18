
// import 'package:caresync/Snehal/appointment/book_appointment.dart';
// import 'package:caresync/Snehal/dr_speciality/doctors.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';



// class DoctorCategories extends StatefulWidget {
//   //final List<Product> cartItems = [];

//   DoctorCategories({super.key});

//   @override
//   State<DoctorCategories> createState() => _ProductCategoriesState();
// }

// class _ProductCategoriesState extends State<DoctorCategories> {

//   void navigateToCategory(BuildContext context, Widget categoryScreen) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => categoryScreen,
//       ),
//     );
//   }
//   List<String> drSpecializations = [
//   "Cardiology",
//   "Dermatology",
//   "General Medicine",
//   "Gynecology",
//   "Odontology",
//   "Oncology",
//   "Ophthalmology",
//   "Orthopedics",
// ];

//   List<Map<String, dynamic>> carouselImages = [
//     {'image': "assets/images/baby.jpg", 'route': DoctorListScreen(drSpeciality: drSpecializations[0])},
//     {'image': "assets/carousel_jpg/dermatology.jpg", 'route':  DoctorListScreen(drSpecializations[1])},
//     {'image': "assets/carousel_jpg/general_medicine.jpg", 'route': const DoctorListScreen(drSpecializations[2])},
//     {'image': "assets/carousel_jpg/gynecology.jpg", 'route': const DoctorListScreen(drSpecializations[3])},
//     {'image': "assets/carousel_jpg/odontology.jpg", 'route': const DoctorListScreen(drSpecializations[4])},
//     {'image': "assets/carousel_jpg/oncology.jpg", 'route': const DoctorListScreen(drSpecializations[5])},
//     {'image': "assets/carousel_jpg/ophatamology.jpg", 'route': const DoctorListScreen(drSpecializations[6])},
//     {'image': "assets/carousel_jpg/orthopedics.jpg", 'route': const DoctorListScreen(drSpecializations[7])},
//   ];

//    List<Map<String, dynamic>> drSpecialisation = [
//     {'image': "assets/svg/specialisation/Cardiology Specialties Button # 4.svg", 'route': const DoctorListScreen(drSpecializations[0])},
//     {'image': "assets/svg/specialisation/Dermatology Specialties Button # 3.svg", 'route': const DoctorListScreen(drSpecializations[1])},
//     {'image': "assets/svg/specialisation/Specialties Button # 1 (1).svg", 'route': const DoctorListScreen(drSpecializations[2])},
//     {'image': "assets/svg/specialisation/Gynecology Specialties Button # 10.svg", 'route': const DoctorListScreen(drSpecializations[3])},
//     {'image': "assets/svg/specialisation/Odontology Specialties Button # 12.svg", 'route': const DoctorListScreen(drSpecializations[4])},
//     {'image': "assets/svg/specialisation/Oncology Specialties Button # 11.svg", 'route': const DoctorListScreen(drSpecializations[5])},
//     {'image': "assets/svg/specialisation/Ophtamology Specialties Button # 2.svg", 'route': const DoctorListScreen(drSpecializations[6])},
//     {'image': "assets/svg/specialisation/Orthopedics Specialties Button # 13.svg", 'route': const DoctorListScreen(drSpecializations[7])},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double carouselHeight = screenWidth * 0.4; 
//     int crossAxisCount = screenWidth < 600 ? 2 : 3; 
//     double categoryImageSize = screenWidth * 0.6; 
    
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Color.fromRGBO(97, 206, 255, 220),
//                   Colors.white,
//                   Colors.white,
//                   Color.fromRGBO(14, 190, 126, 220),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16, 0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                           height: 45,
//                           width: 45,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(17),
//                             color: Colors.white,
//                           ),
//                           child: const Icon(
//                             size: 30,
//                             Icons.arrow_back_ios_new_rounded,
//                             color: Colors.grey,
//                           )),
//                     ),
//                     SizedBox(width: screenWidth*0.05,),
//                     Text(
//                       'Doctor Categories',
//                       style: GoogleFonts.rubik(
//                         fontSize: screenWidth * 0.07,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenWidth * 0.05),
//                 CarouselSlider(
//                   options: CarouselOptions(
//                     height: carouselHeight,
//                     autoPlay: true,
//                     enlargeCenterPage: true,
//                   ),
//                   items: carouselImages.map((imagePath) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return GestureDetector(
//                           onTap: () {
//                             navigateToCategory(context, imagePath['route']);
//                           },
//                           child: Container(
//                             width: screenWidth,
//                             margin: const EdgeInsets.symmetric(horizontal: 1.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   offset: Offset(0, 4),
//                                   blurRadius: 6.0,
//                                 ),
//                               ],
//                             ),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                 imagePath['image'],
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),

//                 SizedBox(height: screenWidth * 0.07),
                
//                 const Text(
//                   'Book By Category',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
                
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 0,
//                       childAspectRatio: 0.9,
//                     ),
//                     itemCount: drSpecialisation.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         // onTap: () {
//                         //   navigateToCategory(context, categories[index]["route"]);
//                         // },
//                         child: Container(
//                           // padding: const EdgeInsets.all(40),
                          
//                           child: Center(
//                             child: SvgPicture.asset(
//                               drSpecialisation[index]["image"],
//                               width: categoryImageSize,
//                               height: categoryImageSize,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:caresync/Snehal/appointment/book_appointment.dart';
import 'package:caresync/Snehal/dr_speciality/doctors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCategories extends StatefulWidget {
  DoctorCategories({super.key});

  @override
  State<DoctorCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<DoctorCategories> {
  void navigateToCategory(BuildContext context, Widget categoryScreen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => categoryScreen,
      ),
    );
  }

  List<String> drSpecializations = [
    "Cardiology",
    "Dermatology",
    "General Medicine",
    "Gynecology",
    "Odontology",
    "Oncology",
    "Ophthalmology",
    "Orthopedics",
  ];

  List<Map<String, dynamic>> carouselImages = [
    {'image': "assets/carousel_jpg/cardiology.jpg", 'route': DoctorListScreen(drSpeciality: "Cardiology")},
    {'image': "assets/carousel_jpg/dermatology.jpg", 'route': DoctorListScreen(drSpeciality: "Dermatology")},
    {'image': "assets/carousel_jpg/general_medicine.jpg", 'route': DoctorListScreen(drSpeciality: "General Medicine")},
    {'image': "assets/carousel_jpg/gynecology.jpg", 'route': DoctorListScreen(drSpeciality: "Gynecology")},
    {'image': "assets/carousel_jpg/odontology.jpg", 'route': DoctorListScreen(drSpeciality: "Odontology")},
    {'image': "assets/carousel_jpg/oncology.jpg", 'route': DoctorListScreen(drSpeciality: "Oncology")},
    {'image': "assets/carousel_jpg/ophatamology.jpg", 'route': DoctorListScreen(drSpeciality: "Ophthalmology")},
    {'image': "assets/carousel_jpg/orthopedics.jpg", 'route': DoctorListScreen(drSpeciality: "Orthopedics")},
  ];

  List<Map<String, dynamic>> drSpecialisation = [
    {'image': "assets/svg/specialisation/Cardiology Specialties Button # 4.svg", 'route': DoctorListScreen(drSpeciality: "Cardiology")},
    {'image': "assets/svg/specialisation/Dermatology Specialties Button # 3.svg", 'route': DoctorListScreen(drSpeciality: "Dermatology")},
    {'image': "assets/svg/specialisation/Specialties Button # 1 (1).svg", 'route': DoctorListScreen(drSpeciality: "General Medicine")},
    {'image': "assets/svg/specialisation/Gynecology Specialties Button # 10.svg", 'route': DoctorListScreen(drSpeciality: "Gynecology")},
    {'image': "assets/svg/specialisation/Odontology Specialties Button # 12.svg", 'route': DoctorListScreen(drSpeciality: "Odontology")},
    {'image': "assets/svg/specialisation/Oncology Specialties Button # 11.svg", 'route': DoctorListScreen(drSpeciality: "Oncology")},
    {'image': "assets/svg/specialisation/Ophtamology Specialties Button # 2.svg", 'route': DoctorListScreen(drSpeciality: "Ophthalmology")},
    {'image': "assets/svg/specialisation/Orthopedics Specialties Button # 13.svg", 'route': DoctorListScreen(drSpeciality: "Orthopedics")},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double carouselHeight = screenWidth * 0.4;
    int crossAxisCount = screenWidth < 600 ? 2 : 3;
    double categoryImageSize = screenWidth * 0.6;

    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    SizedBox(width: screenWidth * 0.05),
                    Text(
                      'Doctor Categories',
                      style: GoogleFonts.rubik(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.05),
                CarouselSlider(
                  options: CarouselOptions(
                    height: carouselHeight,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: carouselImages.map((imageData) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            navigateToCategory(context, imageData['route']);
                          },
                          child: Container(
                            width: screenWidth,
                            margin: const EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                imageData['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: screenWidth * 0.07),
                const Text(
                  'Book By Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: drSpecialisation.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToCategory(context, drSpecialisation[index]['route']);
                        },
                        child: Container(
                          child: Center(
                            child: SvgPicture.asset(
                              drSpecialisation[index]['image'],
                              width: categoryImageSize,
                              height: categoryImageSize,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
