// import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
// import 'package:caresync/Tejas/PatientSide.dart/Orders.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'PaymentScreen.dart';

// final List<Product> cartItems = [];

// class Cart extends StatefulWidget {
//   const Cart({super.key});
  
//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   double get totalAmount {
//     double total = 0.0;
//     for (var item in cartItems) {
//       total += item.price * item.quantity;
//     }
//     return total;
//   }

//   void _removeItem(int index) {
//     setState(() {
//       cartItems[index].isInCart = false; 
//       cartItems.removeAt(index); 
//     });
//   }

//   // Function to show the checkout dialog
//   void _showCheckoutDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text(
//             'Checkout',
//             textAlign: TextAlign.center,
//           ),
//           content: const Text('Are you sure you want to proceed with order?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Proceed'),
//               onPressed: () {
//                 // Add the cart items to placed orders
//                 placedOrders.addAll(cartItems); // Move cart items to placed orders
//                 cartItems.clear(); // Empty the cart
//                 Navigator.of(context).pop();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const PaymentSuccess(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     double titleFontSize = screenWidth * 0.07;
//     double itemFontSize = screenWidth * 0.04;
//     double imageWidth = screenWidth * 0.2;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 stops: [0.0, 0.3, 0.7, 1.0],
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
//             padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16.0, 0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                    GestureDetector(
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
//                     SizedBox(width: screenWidth*0.23),
//                     Text(
//                       'My Cart',
//                       style: GoogleFonts.poppins(
//                         fontSize: titleFontSize,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cartItems.length,
//                     itemBuilder: (context, index) {
//                       final product = cartItems[index];
//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
//                         padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           // gradient: const LinearGradient(
//                           //   colors: [
//                           //     Color.fromRGBO(255, 255, 255, 0.9),
//                           //     Color.fromRGBO(220, 220, 220, 0.6),
//                           //   ],
//                           //   begin: Alignment.topLeft,
//                           //   end: Alignment.bottomRight,
//                           // ),
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                                   color: Colors.black87.withOpacity(0.6),
//                                   offset: const Offset(0, 4),
//                                   blurRadius: 6.0,
//                                   spreadRadius: 0.1,
//                                 ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Image.asset(
//                                   product.image,
//                                   width: imageWidth,
//                                   height: imageWidth,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 SizedBox(width: screenWidth * 0.03),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         product.name,
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: GoogleFonts.roboto(
//                                           fontSize: itemFontSize,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                       SizedBox(height: screenWidth * 0.01),
//                                       Text(
//                                         'Price: ₹${(product.price * product.quantity).toStringAsFixed(2)}',
//                                         style: GoogleFonts.roboto(
//                                           fontSize: itemFontSize * 0.9,
//                                           color: Colors.black54,
//                                         ),
//                                       ),
//                                       SizedBox(height: screenWidth * 0.01),
//                                       Text(
//                                         'Quantity: ${product.quantity}',
//                                         style: GoogleFonts.roboto(
//                                           fontSize: itemFontSize * 0.9,
//                                           color: Colors.black54,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.delete),
//                                   onPressed: () {
//                                     _removeItem(index);
//                                   },
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(width: screenWidth * 0.2),
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.remove_circle_outline,
//                                     color: Colors.grey,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       if (product.quantity > 1) {
//                                         product.quantity--;
//                                       }
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   '${product.quantity}',
//                                   style: TextStyle(fontSize: itemFontSize * 1.2),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.add_circle_outline,
//                                     color: Colors.grey,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       product.quantity++;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Payment Detail',
//                         style: GoogleFonts.roboto(
//                           fontSize: itemFontSize * 1.3,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: screenWidth * 0.02),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Subtotal', style: GoogleFonts.roboto(fontSize: itemFontSize)),
//                           Text('₹${totalAmount.toStringAsFixed(2)}', style: GoogleFonts.roboto(fontSize: itemFontSize)),
//                         ],
//                       ),
//                       SizedBox(height: screenWidth * 0.02),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Taxes', style: GoogleFonts.roboto(fontSize: itemFontSize)),
//                           Text('₹1.00', style: GoogleFonts.roboto(fontSize: itemFontSize)),
//                         ],
//                       ),
//                       SizedBox(height: screenWidth * 0.02),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Total',
//                             style: GoogleFonts.roboto(fontSize: itemFontSize, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             '₹${(totalAmount + 1).toStringAsFixed(2)}',
//                             style: GoogleFonts.roboto(fontSize: itemFontSize, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: screenWidth * 0.04),
//                       Text(
//                         'Payment Method',
//                         style: GoogleFonts.roboto(
//                           fontSize: itemFontSize * 1.3,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       SizedBox(height: screenWidth * 0.02),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           border: Border.all(color: Colors.grey.shade300),
//                         ),
//                         padding: EdgeInsets.all(screenWidth * 0.025),
//                         child: Row(
//                           children: [
//                             const Icon(Icons.credit_card, color: Colors.blue, size: 24),
//                             SizedBox(width: screenWidth * 0.03),
//                             Text(
//                               'Cash On Delivery Only',
//                               style: GoogleFonts.roboto(
//                                 fontSize: itemFontSize,
//                                 color: Colors.black87,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: screenWidth * 0.04),
//                       Center(
//                         child: SizedBox(
//                           width: screenWidth * 0.8,
//                           height: screenHeight * 0.06,
//                           child: ElevatedButton(
//                             onPressed: _showCheckoutDialog, 
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20.0),
//                               ),
//                             ),
//                             child: Text(
//                               'Checkout',
//                               style: GoogleFonts.roboto(
//                                 fontSize: titleFontSize * 0.6,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
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
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // import '../Model Class/ProductModel.dart';

// // import 'PaymentScreen.dart';

// // final List<Product> cartItems = [];

// // class Cart extends StatefulWidget {
// //   final String patientId; // Patient ID to fetch their cart
// //   const Cart({super.key, required this.patientId});

// //   @override
// //   State<Cart> createState() => _CartState();
// // }

// // class _CartState extends State<Cart> {
// //   late CollectionReference cartRef;

// //   @override
// //   void initState() {
// //     super.initState();
// //     cartRef = FirebaseFirestore.instance
// //         .collection('CareSync')
// //         .doc('patients')
// //         .collection('accounts')
// //         .doc(widget.patientId)
// //         .collection('cart');
// //     fetchCartItems();
// //   }

// //   double get totalAmount {
// //     double total = 0.0;
// //     for (var item in cartItems) {
// //       total += item.price * item.quantity;
// //     }
// //     return total;
// //   }

// //   Future<void> fetchCartItems() async {
// //     try {
// //       final snapshot = await cartRef.get();
// //       final products = snapshot.docs.map((doc) {
// //         final data = doc.data() as Map<String, dynamic>;
// //         return Product(
// //           id: doc.id,
// //           name: data['name'],
// //           price: data['price'],
// //           quantity: data['quantity'],
// //           image: data['image'],
// //           isInCart: true,
// //         );
// //       }).toList();

// //       setState(() {
// //         cartItems.clear();
// //         cartItems.addAll(products);
// //       });
// //     } catch (e) {
// //       print('Error fetching cart items: $e');
// //     }
// //   }

// //   Future<void> updateCartItem(Product product) async {
// //     try {
// //       await cartRef.doc(product.id).update({'quantity': product.quantity});
// //     } catch (e) {
// //       print('Error updating cart item: $e');
// //     }
// //   }

// //   void _removeItem(int index) async {
// //     try {
// //       final product = cartItems[index];
// //       await cartRef.doc(product.id).delete();
// //       setState(() {
// //         cartItems.removeAt(index);
// //       });
// //     } catch (e) {
// //       print('Error removing cart item: $e');
// //     }
// //   }

// //   void _showCheckoutDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text(
// //             'Checkout',
// //             textAlign: TextAlign.center,
// //           ),
// //           content: const Text('Are you sure you want to proceed with the order?'),
// //           actions: <Widget>[
// //             TextButton(
// //               child: const Text('Cancel'),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //             TextButton(
// //               child: const Text('Proceed'),
// //               onPressed: () async {
// //                 try {
// //                   // Add the cart items to placed orders
// //                   final batch = FirebaseFirestore.instance.batch();
// //                   for (var item in cartItems) {
// //                     final orderRef = FirebaseFirestore.instance
// //                         .collection('CareSync')
// //                         .doc('patients')
// //                         .collection('accounts')
// //                         .doc(widget.patientId)
// //                         .collection('orders')
// //                         .doc();
// //                     batch.set(orderRef, {
// //                       'name': item.name,
// //                       'price': item.price,
// //                       'quantity': item.quantity,
// //                       'image': item.image,
// //                     });
// //                   }

// //                   // Clear the cart
// //                   for (var item in cartItems) {
// //                     final cartItemRef = cartRef.doc(item.id);
// //                     batch.delete(cartItemRef);
// //                   }
// //                   await batch.commit();

// //                   cartItems.clear(); // Empty the local cart
// //                   Navigator.of(context).pop();
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => const PaymentSuccess(),
// //                     ),
// //                   );
// //                 } catch (e) {
// //                   print('Error during checkout: $e');
// //                 }
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;
// //     double titleFontSize = screenWidth * 0.07;
// //     double itemFontSize = screenWidth * 0.04;
// //     double imageWidth = screenWidth * 0.2;

// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Container(
// //             decoration: const BoxDecoration(
// //               gradient: LinearGradient(
// //                 begin: Alignment.topLeft,
// //                 end: Alignment.bottomRight,
// //                 stops: [0.0, 0.3, 0.7, 1.0],
// //                 colors: [
// //                   Color.fromRGBO(97, 206, 255, 220),
// //                   Colors.white,
// //                   Colors.white,
// //                   Color.fromRGBO(14, 190, 126, 220),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16.0, 0),
// //             child: Column(
// //               children: [
// //                 Row(
// //                   children: [
// //                     GestureDetector(
// //                       onTap: () {
// //                         Navigator.pop(context);
// //                       },
// //                       child: Container(
// //                         height: screenWidth * 0.1,
// //                         width: screenWidth * 0.1,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(17),
// //                           color: Colors.white,
// //                         ),
// //                         child: const Icon(
// //                           size: 30,
// //                           Icons.arrow_back_ios_new_rounded,
// //                           color: Colors.grey,
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(width: screenWidth * 0.23),
// //                     Text(
// //                       'My Cart',
// //                       style: GoogleFonts.poppins(
// //                         fontSize: titleFontSize,
// //                         fontWeight: FontWeight.w600,
// //                       ),
// //                     ),
// //                     const Spacer(),
// //                   ],
// //                 ),
// //                 Expanded(
// //                   child: ListView.builder(
// //                     itemCount: cartItems.length,
// //                     itemBuilder: (context, index) {
// //                       final product = cartItems[index];
// //                       return Container(
// //                         margin: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
// //                         padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.circular(8.0),
// //                           color: Colors.white,
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: Colors.black87.withOpacity(0.6),
// //                               offset: const Offset(0, 4),
// //                               blurRadius: 6.0,
// //                               spreadRadius: 0.1,
// //                             ),
// //                           ],
// //                         ),
// //                         child: Column(
// //                           children: [
// //                             Row(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Image.asset(
// //                                   product.image,
// //                                   width: imageWidth,
// //                                   height: imageWidth,
// //                                   fit: BoxFit.cover,
// //                                 ),
// //                                 SizedBox(width: screenWidth * 0.03),
// //                                 Expanded(
// //                                   child: Column(
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children: [
// //                                       Text(
// //                                         product.name,
// //                                         maxLines: 2,
// //                                         overflow: TextOverflow.ellipsis,
// //                                         style: GoogleFonts.roboto(
// //                                           fontSize: itemFontSize,
// //                                           fontWeight: FontWeight.w600,
// //                                         ),
// //                                       ),
// //                                       SizedBox(height: screenWidth * 0.01),
// //                                       Text(
// //                                         'Price: ₹${(product.price * product.quantity).toStringAsFixed(2)}',
// //                                         style: GoogleFonts.roboto(
// //                                           fontSize: itemFontSize * 0.9,
// //                                           color: Colors.black54,
// //                                         ),
// //                                       ),
// //                                       SizedBox(height: screenWidth * 0.01),
// //                                       Text(
// //                                         'Quantity: ${product.quantity}',
// //                                         style: GoogleFonts.roboto(
// //                                           fontSize: itemFontSize * 0.9,
// //                                           color: Colors.black54,
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 IconButton(
// //                                   icon: const Icon(Icons.delete),
// //                                   onPressed: () {
// //                                     _removeItem(index);
// //                                   },
// //                                 ),
// //                               ],
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               children: [
// //                                 SizedBox(width: screenWidth * 0.2),
// //                                 IconButton(
// //                                   icon: const Icon(
// //                                     Icons.remove_circle_outline,
// //                                     color: Colors.grey,
// //                                   ),
// //                                   onPressed: () {
// //                                     setState(() {
// //                                       if (product.quantity > 1) {
// //                                         product.quantity--;
// //                                         updateCartItem(product);
// //                                       }
// //                                     });
// //                                   },
// //                                 ),
// //                                 Text(
// //                                   '${product.quantity}',
// //                                   style: TextStyle(fontSize: itemFontSize * 1.2),
// //                                 ),
// //                                 IconButton(
// //                                   icon: const Icon(
// //                                     Icons.add_circle_outline,
// //                                     color: Colors.grey,
// //                                   ),
// //                                   onPressed: () {
// //                                     setState(() {
// //                                       product.quantity++;
// //                                       updateCartItem(product);
// //                                     });
// //                                   },
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Payment Detail',
// //                         style: GoogleFonts.roboto(
// //                           fontSize: itemFontSize * 1.3,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black87,
// //                         ),
// //                       ),
// //                       SizedBox(height: screenWidth * 0.02),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Text(
// //                             'Total Amount',
// //                             style: GoogleFonts.roboto(
// //                               fontSize: itemFontSize * 1.2,
// //                               fontWeight: FontWeight.w600,
// //                               color: Colors.black87,
// //                             ),
// //                           ),
// //                           Text(
// //                             '₹${totalAmount.toStringAsFixed(2)}',
// //                             style: GoogleFonts.roboto(
// //                               fontSize: itemFontSize * 1.2,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.black87,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: screenWidth * 0.03),
// //                       GestureDetector(
// //                         onTap: _showCheckoutDialog,
// //                         child: Container(
// //                           width: double.infinity,
// //                           padding: EdgeInsets.symmetric(
// //                             vertical: screenWidth * 0.03,
// //                           ),
// //                           decoration: BoxDecoration(
// //                             color: Colors.greenAccent[400],
// //                             borderRadius: BorderRadius.circular(10.0),
// //                           ),
// //                           child: Center(
// //                             child: Text(
// //                               'Proceed to Checkout',
// //                               style: GoogleFonts.roboto(
// //                                 fontSize: itemFontSize * 1.3,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.white,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../Model Class/productdetails.dart';

// class Cart extends StatefulWidget {
//   final String patientId;

//   const Cart({super.key, required this.patientId});

//   @override
//   State<Cart> createState() => _CartState();
// }

// class _CartState extends State<Cart> {
//   List<ProductData> cartProducts = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCartProducts();
//   }

//   Future<void> fetchCartProducts() async {
//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('CareSync/patients/accounts/${widget.patientId}/Cart')
//           .get();

//       cartProducts.clear();
//       for (var productDoc in querySnapshot.docs) {
//         cartProducts.add(
//           ProductData(
//             name: productDoc.data()['name'] ?? 'No Name',
//             productId: productDoc.id,
//             price: productDoc.data()['price'] ?? 0,
//             image: productDoc.data()['image'] ?? '',
//             mrp: productDoc.data()['mrp'] ?? 0,
//           ),
//         );
//       }

//       setState(() {});
//     } catch (e) {
//       print("Error fetching cart products: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Cart"),
//       ),
//       body: cartProducts.isEmpty
//           ? const Center(child: Text("Your cart is empty."))
//           : ListView.builder(
//               itemCount: cartProducts.length,
//               itemBuilder: (context, index) {
//                 final product = cartProducts[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8.0),
//                   child: ListTile(
//                     leading: Image.network(product.image, width: 50, height: 50),
//                     title: Text(
//                       product.name,
//                       style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text('Price: ₹${product.price}'),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () async {
//                         await FirebaseFirestore.instance
//                             .collection(
//                                 'CareSync/patients/accounts/${widget.patientId}/Cart')
//                             .doc(product.productId)
//                             .delete();
//                         fetchCartProducts();
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model Class/productdetails.dart';

class Cart extends StatefulWidget {
  final String patientId;
  final VoidCallback onProductChanged;

  const Cart({
    super.key,
    required this.patientId,
    required this.onProductChanged,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<ProductData> cartProducts = [];

  @override
  void initState() {
    super.initState();
    fetchCartProducts();
  }

  Future<void> fetchCartProducts() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('CareSync/patients/accounts/${widget.patientId}/Cart')
          .get();

      cartProducts.clear();
      for (var productDoc in querySnapshot.docs) {
        cartProducts.add(
          ProductData(
            name: productDoc.data()['name'] ?? 'No Name',
            productId: productDoc.id,
            price: productDoc.data()['price'] ?? 0,
            image: productDoc.data()['image'] ?? '',
            mrp: productDoc.data()['mrp'] ?? 0,
          ),
        );
      }

      setState(() {});
    } catch (e) {
      print("Error fetching cart products: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartProducts.isEmpty
          ? const Center(child: Text("Your cart is empty."))
          : ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      product.name,
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: ₹${product.price}'),
                        Text(
                          'MRP: ₹${product.mrp}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection(
                                'CareSync/patients/accounts/${widget.patientId}/Cart')
                            .doc(product.productId)
                            .delete();
                        widget.onProductChanged(); // Notify BabyCare screen
                        fetchCartProducts();
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
