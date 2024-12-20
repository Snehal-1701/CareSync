import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Cart.dart';

final List<Product> likedItems = [];
class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<Product> cartItems = [];

  void _goToCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Cart(),
      ),
    );
  }

  void _toggleLike(Product product) {
    setState(() {
      product.liked = !product.liked;
      if (!product.liked) {
        likedItems.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double titleFontSize = screenWidth * 0.07;
    double itemFontSize = screenWidth * 0.04;
    double imageHeight = screenWidth * 0.15;

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
                    SizedBox(width: screenWidth*0.23,),
                    Text(
                      'Wishlist',
                      style: GoogleFonts.poppins(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    // IconButton(
                    //   icon: const Icon(Icons.shopping_cart, size: 28),
                    //   onPressed: _goToCart,
                    // ),
                  ],
                ),
            
                Expanded(
                  child: likedItems.isEmpty
                      ? Center(
                          child: Text(
                            'No items in wishlist',
                            style: GoogleFonts.roboto(
                              fontSize: itemFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: likedItems.length,
                          itemBuilder: (context, index) {
                            final product = likedItems[index];
                            return Card(
                              margin: EdgeInsets.all(screenWidth * 0.03),
                              child: ListTile(
                                leading: Image.asset(
                                  product.image,
                                  height: imageHeight,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  product.name,
                                  style: GoogleFonts.roboto(
                                    fontSize: itemFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  '₹${product.price}',
                                  style: GoogleFonts.roboto(
                                    fontSize: itemFontSize * 0.9,
                                    color: Colors.black,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: product.liked ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () => _toggleLike(product),
                                ),
                                onTap: () {
                                  setState(() {
                                    cartItems.add(product);
                                  });
                                },
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
