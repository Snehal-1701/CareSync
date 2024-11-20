import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/Ayurvedic.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/BabyCare.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/Cough&Cold.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/PainRelief.dart';
import 'package:caresync/Tejas/PatientSide.dart/Categories/Vitamins.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCategories extends StatefulWidget {
  final List<String> categoryImages;
  final dynamic storeId;

  const ProductCategories(
      {super.key, required this.categoryImages, required this.storeId});

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories> {
  List<String> categoryName = [];

  Future<void> navigateToBabyCare(
      BuildContext context, String categoryName, dynamic storeId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final patientId = currentUser?.uid ?? '';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BabyCare(
          categoryName: categoryName,
          storeId: storeId,
          patientId: patientId,
        ),
      ),
    );
  }

  Future<void> fetchCategories() async {
    // Create a list to store category names

    // Fetch categories from Firestore
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Medical Stores/${widget.storeId}/categories')
        .get();

    // Iterate through the documents and extract the 'name' field
    for (var doc in querySnapshot.docs) {
      categoryName.add(doc['name']); // Add the 'name' field to the list
    }

    // Optionally, update the state if you need to use categoryName
    setState(() {
      // You can store the category names in a state variable here if needed
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  // void _goToCart() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => Cart(patientId: widget.patientId),
  //     ),
  //   );
  // }

  void navigateToCategory(BuildContext context, Widget categoryScreen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => categoryScreen,
      ),
    );
  }

  List<Map<String, dynamic>> carouselImages = [
    {
      'image': "assets/jpg/CategoryCaraiousal/C1.jpg",
      
    },
    {
      'image': "assets/jpg/CategoryCaraiousal/C2.jpg",
      
    },
    {
      'image': "assets/jpg/CategoryCaraiousal/C3.jpg",
      
    },
    {
      'image': "assets/jpg/CategoryCaraiousal/C4.jpg",
      
    },
    {
      'image': "assets/jpg/CategoryCaraiousal/C5.jpg",
      
    },
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
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Text(
                      'Medicine Categories',
                      style: GoogleFonts.poppins(
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
                  items: carouselImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          // onTap: () {
                          //   navigateToCategory(context, imagePath['route']);
                          // },
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
                  child: widget.categoryImages.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: widget.categoryImages.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                navigateToBabyCare(context, categoryName[index],
                                    widget.storeId);

                                // // You can add specific navigation logic here based on your requirements
                                // // Example: navigateToCategory(context, categoryScreen);
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => BabyCare(
                                //       categoryName: categoryName[index],
                                //       storeId: widget.storeId,
                                //       patientId: patientId,
                                //     ),
                                //   ),
                                // );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.network(
                                    widget.categoryImages[index],
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
