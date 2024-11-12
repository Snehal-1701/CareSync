import 'package:caresync/Tejas/Model%20Class/MedicalStoreModel.dart';
import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'MedicineCategories.dart';
import 'Cart.dart';

class MedicalStore extends StatefulWidget {
  const MedicalStore({super.key});

  @override
  State createState() => _MedicalStore();
}

class _MedicalStore extends State<MedicalStore> {
  List<Product> cartItems = [];

  List<String> carouselImages = [
    "assets/jpg/MedicalStoreCaraoiusal/M1.jpg",
    "assets/jpg/MedicalStoreCaraoiusal/M2.jpg",
    "assets/jpg/MedicalStoreCaraoiusal/M3.jpg",
    "assets/jpg/MedicalStoreCaraoiusal/M4.jpg",
    "assets/jpg/MedicalStoreCaraoiusal/M5.jpg",
    "assets/jpg/MedicalStoreCaraoiusal/M6.jpg",
  ];

  void _goToCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Cart(),
      ),
    );
  }

  List<MedicalStoresModel> listOfMedicals = [
    MedicalStoresModel(
      title: "MediCure Pharmacy",
      address: "Address: 778 Locust View Drive Oakland, CA",
      phoneNo: "Contact No: 9730775888",
      image: "assets/png/MedicalStores/Store1.png",
    ),
    MedicalStoresModel(
      title: "MediCure Pharmacy",
      address: "Address: 778 Locust View Drive Oakland, CA",
      phoneNo: "Contact No: 9730775888",
      image: "assets/png/MedicalStores/Store2.png",
    ),
    MedicalStoresModel(
      title: "MediCure Pharmacy",
      address: "Address: 778 Locust View Drive Oakland, CA",
      phoneNo: "Contact No: 9730775888",
      image: "assets/png/MedicalStores/Store3.png",
    ),
    MedicalStoresModel(
      title: "MediCure Pharmacy",
      address: "Address: 778 Locust View Drive Oakland, CA",
      phoneNo: "Contact No: 9730775888",
      image: "assets/png/MedicalStores/Store4.png",
    ),
    MedicalStoresModel(
      title: "MediCure Pharmacy",
      address: "Address: 778 Locust View Drive Oakland, CA",
      phoneNo: "Contact No: 9730775888",
      image: "assets/png/MedicalStores/Store1.png",
    ),
    MedicalStoresModel(
      title: "MediCure Pharmacy",
      address: "Address: 778 Locust View Drive Oakland, CA",
      phoneNo: "Contact No: 9730775888",
      image: "assets/png/MedicalStores/Store2.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
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
          ),

          // Main content
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16, 0),
            child: Column(
              children: [
                // Custom AppBar content
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left, size: 42),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Medical Stores',
                      style: GoogleFonts.rubik(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: screenWidth*0.09,),
                    // IconButton(
                    //   icon: const Icon(Icons.shopping_cart),
                    //   onPressed: _goToCart,
                    // ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.015), 
                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03), 

                // Carousel slider
                CarouselSlider(
                  options: CarouselOptions(
                    height: screenHeight * 0.2,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: carouselImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: screenWidth * 0.9,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),

                // Medical List
                Expanded(
                  child: ListView.builder(
                    itemCount: listOfMedicals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02, 
                            vertical: screenHeight * 0.013), 
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductCategories(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // gradient: const LinearGradient(
                              //   colors: [
                              //     Color.fromRGBO(255, 255, 255, 0.9),
                              //     Color.fromRGBO(220, 220, 220, 0.6),
                              //   ],
                              //   begin: Alignment.topLeft,
                              //   end: Alignment.bottomRight,
                              // ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87.withOpacity(0.6),
                                  offset: const Offset(0, 4),
                                  blurRadius: 6.0,
                                  spreadRadius: 0.1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  //padding: EdgeInsets.all(screenWidth * 0.10),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04,
                                      vertical: screenHeight * 0.020), 
                                  width: screenWidth * 0.25,
                                  height: screenHeight * 0.12,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(194, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: const Offset(0, 2),
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    listOfMedicals[index].image,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10), 
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listOfMedicals[index].title,
                                        style: GoogleFonts.inter(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        listOfMedicals[index].address,
                                        style: GoogleFonts.inter(
                                          fontSize: screenWidth * 0.035,
                                          height: 1.5,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(0, 0, 0, 0.7),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        listOfMedicals[index].phoneNo,
                                        style: GoogleFonts.inter(
                                          fontSize: screenWidth * 0.035,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(0, 0, 0, 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
