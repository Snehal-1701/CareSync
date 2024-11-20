// import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
// import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
// import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Orthopaedics extends StatefulWidget {
//   const Orthopaedics({super.key});

//   @override
//   State createState() => _OrthopaedicsState();
// }

// class _OrthopaedicsState extends State {
//   List<Product> medicines = [
//     Product(
//       name: 'Tynor R.O.M. Knee Brace 37 cm x 55 cm (UN) (D 10)',
//       price: 2184.0,
//       mrp: 2730.0,
//       image: "assets/png/Category2/C2Product1.png",
//       rating: 4.8,
//       quantity: 0,
//       liked: false,
//     ),
//     Product(
//       name: "Sahyog Wellness Hot Water Bottle/Bag - Green",
//       price: 255.00,
//       mrp: 300,
//       image: "assets/png/Category2/C2Product2.png",
//       rating: 4.6,
//       quantity: 0,
//       liked: false,
//     ),
//     Product(
//       name: "Truuth Ankle Support (M)",
//       price: 91.77,
//       mrp: 399,
//       image: "assets/png/Category2/C2Product3.png",
//       rating: 4.2,
//       quantity: 0,
//       liked: false,
//     ),
//     Product(
//       name: "Tynor Taylor's Brace Long (UN) (A 13)",
//       price: 2172.00,
//       mrp: 2715,
//       image: "assets/png/Category2/C2Product4.png",
//       rating: 4.8,
//       quantity: 0,
//       liked: false,
//     ),
//     Product(
//       name: "Tynor Contoured Cervical Pillow - Grey (One Size Fits All) (B 19)",
//       price: 1574.40,
//       mrp: 1640,
//       image: "assets/png/Category2/C2Product5.png",
//       rating: 4.5,
//       quantity: 0,
//       liked: false,
//     ),
//     Product(
//       name: "Tynor Walker Boot Air (M) (D 51)",
//       price: 3160.00,
//       mrp: 3950,
//       image: "assets/png/Category2/C2Product6.png",
//       rating: 4.2,
//       quantity: 0,
//       liked: false,
//     ),
//     Product(
//       name: "Vissco Medip Walker Plain",
//       price: 1402.33,
//       mrp: 1921,
//       image: "assets/png/Category2/C2Product7.png",
//       rating: 3.8,
//       quantity: 0,
//       liked: false,
//     ),
//     Product(
//       name: "Entros Height Adjustable Commode (EHS-696)",
//       price: 5127.74,
//       mrp: 6178,
//       image: "assets/png/Category2/C2Product8.png",
//       rating: 4.2,
//       quantity: 0,
//       liked: false,
//     ),
//   ];

//   void _toggleCart(Product product) {
//     setState(() {
//       if (product.quantity == 0) {
//         product.quantity = 1;
//         cartItems.add(product);
//       } else {
//         product.quantity = 0;
//         cartItems.remove(product);
//       }
//     });
//   }

//   void _toggleLike(int index) {
//     setState(() {
//       final product = medicines[index];
//       product.liked = !product.liked;
//       product.liked ? likedItems.add(product) : likedItems.remove(product);
//     });
//   }

//   void _goToLikedPage() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => const Wishlist(),
//       ),
//     );
//   }

//   void _goToCart() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => const Cart(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final titleFontSize = screenWidth * 0.07;
//     final buttonFontSize = screenWidth * 0.037;

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
//                   Color.fromRGBO(14, 190, 126, 220),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(9.0, screenHeight * 0.06, 9, 0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                           height: screenWidth * 0.1,
//                           width: screenWidth * 0.1,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(17),
//                             color: Colors.white,
//                           ),
//                           child: const Icon(
//                             size: 30,
//                             Icons.arrow_back_ios_new_rounded,
//                             color: Colors.grey,
//                           )
//                         ),
//                     ),
//                     SizedBox(width: screenWidth*0.12),
//                     Text(
//                       'Orthopaedics',
//                       style: GoogleFonts.poppins(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       onPressed: _goToLikedPage,
//                       icon: const Icon(Icons.favorite_border_outlined),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.shopping_cart),
//                       onPressed: _goToCart,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),
//                 Container(
//                   height: screenHeight * 0.16,
//                   width: screenWidth*2,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                   ),
//                   child: Image.asset(
//                     "assets/jpg/OrthopediacsProduct.jpg",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Expanded(
//                   child: GridView.builder(
//                     padding: const EdgeInsets.all(8.0),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: screenWidth < 600 ? 2 : 4,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 20,
//                       childAspectRatio: 0.6,
//                     ),
//                     itemCount: medicines.length,
//                     itemBuilder: (context, index) {
//                       final medicine = medicines[index];
//                       return Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Center(
//                               child: Image.asset(
//                                 medicine.image,
//                                 height: screenWidth * 0.3,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     const Icon(
//                                       Icons.star,
//                                       color: Colors.amber,
//                                       size: 18,
//                                     ),
//                                     const SizedBox(width: 4),
//                                     Text(
//                                       medicine.rating.toString(),
//                                       style: GoogleFonts.roboto(fontSize: 14),
//                                     ),
//                                   ],
//                                 ),
//                                 GestureDetector(
//                                   onTap: () => _toggleLike(index),
//                                   child: Icon(
//                                     Icons.favorite,
//                                     size: 20,
//                                     color: medicine.liked ? Colors.red : Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               medicine.name,
//                               maxLines: 2,
//                               style: GoogleFonts.roboto(
//                                 fontSize: screenWidth * 0.04,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 Text(
//                                   '₹${medicine.price}',
//                                   style: GoogleFonts.roboto(
//                                     fontSize: screenWidth * 0.045,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 7),
//                                 Text(
//                                   'MRP ₹${medicine.mrp}',
//                                   style: GoogleFonts.roboto(
//                                     fontSize: screenWidth * 0.030,
//                                     color: Colors.black54,
//                                     decoration: TextDecoration.lineThrough,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 5),
//                             medicine.quantity == 0
//                                 ? SizedBox(
//                                     width: double.infinity,
//                                     child: ElevatedButton(
//                                       onPressed: () => _toggleCart(medicine),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: const Color(0xFF00CFC1),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                       child: Text(
//                                         'ADD TO CART',
//                                         style: GoogleFonts.roboto(
//                                           fontSize: buttonFontSize,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 : SizedBox(
//                                     width: double.infinity,
//                                     child: ElevatedButton.icon(
//                                       onPressed: () => _toggleCart(medicine),
//                                       icon: const Icon(
//                                         Icons.check,
//                                         color: Colors.black54,
//                                       ),
//                                       label: Text(
//                                         'Item in Cart',
//                                         style: GoogleFonts.roboto(
//                                           fontSize: buttonFontSize,
//                                           color: Colors.black54,
//                                         ),
//                                       ),
//                                       style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.white10,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                           ],
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
