import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BabyCare extends StatefulWidget {
  const BabyCare({super.key});

  @override
  State createState() => _BabyCareState();
}

class _BabyCareState extends State {
  List<Product> medicines = [
    Product(
      name: 'Pampers Baby Dry Pants (M) 20',
      price: 369.00,
      mrp: 00.00,
      image: "assets/png/Category7/C7Product1.png",
      rating: 4.8,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Dexolac Stage 2 (After 6 Months) Powder 400 gm (Refill Pack)",
      price: 460.00,
      mrp: 00.00,
      image: "assets/png/Category7/C7Product2.png",
      rating: 4.6,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Johnson's Baby Cream 100 gm",
      price: 180.50,
      mrp: 190.00,
      image: "assets/png/Category7/C7Product3.png",
      rating: 4.2,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Johnson's Baby Skincare Wipes 72's",
      price: 140.00,
      mrp: 280.00,
      image: "assets/png/Category7/C7Product4.png",
      rating: 4.8,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Nestle Cerelac Stage 4 (12 Months+) Powder 300 gm- Multigrain & Fruits (Refill Pack)",
      price: 330.00,
      mrp: 00.00,
      image: "assets/png/Category7/C7Product5.png",
      rating: 4.5,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Mothercare Flexi Straw Toddler Cup - Blue",
      price: 509.15,
      mrp: 599.00,
      image: "assets/png/Category7/C7Product6.png",
      rating: 4.2,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Nestle Nan Pro 1 (Upto 6 Months) Powder 400 gm (Refill Pack)",
      price: 825.00,
      mrp: 0.00,
      image: "assets/png/Category7/C7Product7.png",
      rating: 3.8,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Pampers Active Baby (XL) 32's",
      price: 999.00,
      mrp: 0.00,
      image: "assets/png/Category7/C7Product8.png",
      rating: 4.2,
      quantity: 0,
      liked: false,
    ),
  ];

  void _toggleCart(Product product) {
    setState(() {
      if (product.quantity == 0) {
        product.quantity = 1;
        cartItems.add(product);
      } else {
        product.quantity = 0;
        cartItems.remove(product);
      }
    });
  }

  void _toggleLike(int index) {
    setState(() {
      final product = medicines[index];
      product.liked = !product.liked;
      product.liked ? likedItems.add(product) : likedItems.remove(product);
    });
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
                          )
                        ),
                    ),
                    SizedBox(width: screenWidth*0.2),
                    Text(
                      'BabyCare',
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
                  width: screenWidth*2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "assets/jpg/BabyCareProduct.jpg",
                    fit: BoxFit.fill,
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
                    itemCount: medicines.length,
                    itemBuilder: (context, index) {
                      final medicine = medicines[index];
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
                              child: Image.asset(
                                medicine.image,
                                height: screenWidth * 0.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      medicine.rating.toString(),
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => _toggleLike(index),
                                  child: Icon(
                                    Icons.favorite,
                                    size: 20,
                                    color: medicine.liked ? Colors.red : Colors.grey,
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
                            medicine.quantity == 0
                                ? SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () => _toggleCart(medicine),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF00CFC1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
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
                                      onPressed: () => _toggleCart(medicine),
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
                                          borderRadius: BorderRadius.circular(8),
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
