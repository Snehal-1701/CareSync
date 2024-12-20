import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Ayurvedic extends StatefulWidget {
  const Ayurvedic({super.key});

  @override
  State createState() => _AyurvedicState();
}

class _AyurvedicState extends State {
  List<Product> medicines = [
    Product(
      name: 'Kapiva Triphala Juice 1 litre',
      price: 249.07,
      mrp: 299.00,
      image: "assets/png/Category5/C5Product1.png",
      rating: 4.8,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Himalaya Evecare Capsule 30's",
      price: 166.25,
      mrp: 175.00,
      image: "assets/png/Category5/C5Product2.png",
      rating: 4.6,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Himalaya Pilex forte Ointment 30 gm",
      price: 116.25,
      mrp: 125.00,
      image: "assets/png/Category5/C5Product3.png",
      rating: 4.2,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Patanjali Honey 500 gm",
      price: 205.80,
      mrp: 210.00,
      image: "assets/png/Category5/C5Product4.png",
      rating: 4.8,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Dabur Chyawanprash Awaleha 950 gm",
      price: 359.45,
      mrp: 395.00,
      image: "assets/png/Category5/C5Product5.png",
      rating: 4.5,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Dr.Juneja's Petsaffa Natural Laxative Granules 60 gm",
      price: 49.68,
      mrp: 54.00,
      image: "assets/png/Category5/C5Product6.png",
      rating: 4.2,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Kapiva Wheat Grass Juice 1 ltr",
      price:449.10,
      mrp: 499.00,
      image: "assets/png/Category5/C5Product7.png",
      rating: 3.8,
      quantity: 0,
      liked: false,
    ),
    Product(
      name: "Pankajakasthuri Breathe Easy Granules 400 gm",
      price: 325.28,
      mrp: 380.00,
      image: "assets/png/Category5/C5Product8.png",
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
                      'Ayurvedic',
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
                    "assets/jpg/AyurvedicProduct.jpg",
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
