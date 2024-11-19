import 'dart:developer';

import 'package:caresync/Tejas/Model%20Class/productdetails.dart';
import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BabyCare extends StatefulWidget {
  // const BabyCare({super.key});
  final String categoryName;
  final dynamic storeId;

  const BabyCare({super.key, required this.categoryName, required this.storeId});

  @override
  State createState() => _BabyCareState();
}

class _BabyCareState extends State<BabyCare> {
  List<String> productIdList = [];
  List<ProductData> listOfMedicals = [];
  List<ProductData> productsList = [];

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    log("STORE ID :- ${widget.storeId}");
    log("CATOGORIY NAME  ${widget.categoryName}");
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      // Debugging: Print widget values
      print("Store ID: ${widget.storeId}");
      print("Category Name: ${widget.categoryName}");

      // Validate inputs to avoid invalid path errors
      if (widget.storeId == null || widget.storeId!.isEmpty) {
        throw Exception("Store ID is null or empty.");
      }
      if (widget.categoryName.isEmpty) {
        throw Exception("Category Name is null or empty.");
      }

      // Fetch the products from Firestore
      final querySnapshot = await FirebaseFirestore.instance
          .collection(
              'Medical Stores/${widget.storeId}/categories/${widget.categoryName}/products')
          .get();

      // Clear existing product list
      productsList.clear();

      // Iterate through the products and extract required data
      for (var productDoc in querySnapshot.docs) {
        productsList.add(
          ProductData(
            name: productDoc.data()['name'] ?? 'No Name',
            productId: productDoc.id,
            price: productDoc.data()['price'] ?? 0,
            image: productDoc.data()['imageUrl'] ?? '',
            mrp: productDoc.data()['mrp'] ?? 0,
          ),
        );
      }

      // Debugging: Print all fetched products
      for (var product in productsList) {
        print("Product: $product");
      }

      // Update UI
      setState(() {});
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  void _goToLikedPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Wishlist(),
      ),
    );
  }

  void _goToCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Cart(),
      ),
    );
  }

  List<Map<String, String>> categoryUrl = [
    {
      "category": "Baby Care",
      "url": "assets/jpg/BabyCareProduct.jpg",
    },
    {
      "category": "Cough & Cold",
      "url": "assets/png/CoughColdProduct.png",
    },
    {
      "category": "Ayurvedic",
      "url": "assets/jpg/AyurvedicProduct.jpg",
    },
    {
      "category": "Orthopaedics",
      "url": "assets/jpg/OrthopediacsProduct.jpg",
    },
    {
      "category": "Pain Relief",
      "url": "assets/jpg/C4.jpg",
    },
    {
      "category": "Skin Care",
      "url": "assets/jpg/SkinCareProduct.jpg",
    },
    {
      "category": "Vitamins",
      "url": "assets/jpg/VitaminsProduct.jpg",
    },
    {
      "category": "Fitness",
      "url": "assets/jpg/FitnessProduct.jpg",
    },
    {
      "category": "First Aid",
      "url": "assets/jpg/FirstaidProduct.jpg",
    },
    {
      "category": "General Discomfort",
      "url": "assets/jpg/GeneralDiscomfortProduct.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final titleFontSize = screenWidth * 0.07;
    final buttonFontSize = screenWidth * 0.037;

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
                  Color.fromRGBO(14, 190, 126, 220),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(9.0, screenHeight * 0.06, 9.0, 0),
            child: Column(
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
                          )),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Text(
                      widget.categoryName,
                      style: GoogleFonts.poppins(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: _goToLikedPage,
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: _goToCart,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  height: screenHeight * 0.13,
                  width: screenWidth * 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Builder(
                    builder: (context) {
                      // Find the matching category from the categoryUrl list
                      final category = categoryUrl.firstWhere(
                        (cat) => cat['category'] == widget.categoryName,
                        orElse: () => {
                          'category': 'default',
                          'url': 'assets/jpg/defaultImage.jpg'
                        },
                      );

                      // Display the image from the categoryUrl list
                      return Image.asset(
                        category['url']!,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth < 600 ? 2 : 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      final medicine = productsList[index];
                      var quantity = 0;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                medicine.image,
                                height: screenWidth * 0.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  // onTap: () => _toggleLike(index),
                                  child: const Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color: true ? Colors.red : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              medicine.name,
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '₹${medicine.price}',
                                  style: GoogleFonts.roboto(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'MRP ₹${medicine.mrp}',
                                  style: GoogleFonts.roboto(
                                    fontSize: screenWidth * 0.032,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            quantity == 0
                                ? SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      // onPressed: () => _toggleCart(medicine),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF00CFC1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        'ADD TO CART',
                                        style: GoogleFonts.roboto(
                                          fontSize: buttonFontSize,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      // onPressed: () => _toggleCart(medicine),
                                      icon: const Icon(
                                        Icons.check,
                                        color: Colors.black54,
                                      ),
                                      label: Text(
                                        'Item in Cart',
                                        style: GoogleFonts.roboto(
                                          fontSize: buttonFontSize,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
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
