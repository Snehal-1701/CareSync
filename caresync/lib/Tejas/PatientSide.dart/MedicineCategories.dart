import 'package:caresync/Tejas/PatientSide.dart/Categories/Ayurvedic.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/BabyCare.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/Cough&Cold.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/FirstAid.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/Fitness.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/GeneralDiscomfort.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/Orthopaedics.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/PainRelief.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/SkinCare.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/Vitamins.dart';
import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Cart.dart';


class ProductCategories extends StatefulWidget {
  final List<Product> cartItems = [];

  ProductCategories({super.key});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  List<Product> cartItems = [];

  void _goToCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Cart(),
      ),
    );
  }

  void navigateToCategory(BuildContext context, Widget categoryScreen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => categoryScreen,
      ),
    );
  }

  List<Map<String, dynamic>> carouselImages = [
    {'image': "assets/jpg/CategoryCaraiousal/C1.jpg", 'route': const CoughCold()},
    {'image': "assets/jpg/CategoryCaraiousal/C2.jpg", 'route': const Fitness()},
    {'image': "assets/jpg/CategoryCaraiousal/C3.jpg", 'route': const Vitamins()},
    {'image': "assets/jpg/CategoryCaraiousal/C4.jpg", 'route': const PainRelief()},
    {'image': "assets/jpg/CategoryCaraiousal/C5.jpg", 'route': const FirstAid()},
    {'image': "assets/jpg/CategoryCaraiousal/C6.jpg", 'route': const GeneralDiscomfort()},
  ];

  List<Map<String, dynamic>> categories = [
    {"image": 'assets/png/Categories/Category1.png', "route": const CoughCold()},
    {"image": 'assets/png/Categories/Category2.png', "route": const Orthopaedics()},
    {"image": 'assets/jpg/Categories/Category3.jpg', "route": const PainRelief()},
    {"image": 'assets/png/Categories/Category4.png', "route": const SkinCare()},
    {"image": 'assets/png/Categories/Category5.png', "route": const Ayurvedic()},
    {"image": 'assets/jpg/Categories/Category6.jpg', "route": const Vitamins()},
    {"image": 'assets/png/Categories/Category7.png', "route": const BabyCare()},
    {"image": 'assets/png/Categories/Category8.png', "route": const Fitness()},
    {"image": 'assets/png/Categories/Category9.png', "route": const FirstAid()},
    {"image": 'assets/png/Categories/Category10.png', "route": const GeneralDiscomfort()},
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
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            size: 30,
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.grey,
                          )
                        ),
                    ),
                    SizedBox(width: screenWidth*0.05,),
                    Text(
                      'Medicine Categories',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //const Spacer(),
                    // IconButton(
                    //   icon: const Icon(Icons.shopping_cart),
                    //   onPressed: _goToCart,
                    // ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.05),
                CarouselSlider(
                  options: CarouselOptions(
                    height: carouselHeight,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: carouselImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            navigateToCategory(context, imagePath['route']);
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
                                imagePath['image'],
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
                  'Shop By Category',
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
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToCategory(context, categories[index]["route"]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              categories[index]["image"],
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
