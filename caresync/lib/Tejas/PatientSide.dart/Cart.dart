import 'package:caresync/Tejas/Model%20Class/ProductModel.dart';
import 'package:caresync/Tejas/PatientSide.dart/Orders.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'PaymentScreen.dart';

final List<Product> cartItems = [];

class Cart extends StatefulWidget {
  const Cart({super.key});
  
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double get totalAmount {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void _removeItem(int index) {
    setState(() {
      cartItems[index].isInCart = false; 
      cartItems.removeAt(index); 
    });
  }

  // Function to show the checkout dialog
  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Checkout',
            textAlign: TextAlign.center,
          ),
          content: const Text('Are you sure you want to proceed with order?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Proceed'),
              onPressed: () {
                // Add the cart items to placed orders
                placedOrders.addAll(cartItems); // Move cart items to placed orders
                cartItems.clear(); // Empty the cart
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentSuccess(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double titleFontSize = screenWidth * 0.07;
    double itemFontSize = screenWidth * 0.04;
    double imageWidth = screenWidth * 0.2;

    return Scaffold(
      body: Stack(
        children: [
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
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, screenHeight * 0.06, 16.0, 0),
            child: Column(
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
                          )
                        ),
                    ),
                    SizedBox(width: screenWidth*0.23),
                    Text(
                      'My Cart',
                      style: GoogleFonts.rubik(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
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
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  product.image,
                                  width: imageWidth,
                                  height: imageWidth,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                          fontSize: itemFontSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: screenWidth * 0.01),
                                      Text(
                                        'Price: ₹${(product.price * product.quantity).toStringAsFixed(2)}',
                                        style: GoogleFonts.roboto(
                                          fontSize: itemFontSize * 0.9,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      SizedBox(height: screenWidth * 0.01),
                                      Text(
                                        'Quantity: ${product.quantity}',
                                        style: GoogleFonts.roboto(
                                          fontSize: itemFontSize * 0.9,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _removeItem(index);
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: screenWidth * 0.2),
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (product.quantity > 1) {
                                        product.quantity--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '${product.quantity}',
                                  style: TextStyle(fontSize: itemFontSize * 1.2),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      product.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Detail',
                        style: GoogleFonts.roboto(
                          fontSize: itemFontSize * 1.3,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal', style: GoogleFonts.roboto(fontSize: itemFontSize)),
                          Text('₹${totalAmount.toStringAsFixed(2)}', style: GoogleFonts.roboto(fontSize: itemFontSize)),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Taxes', style: GoogleFonts.roboto(fontSize: itemFontSize)),
                          Text('₹1.00', style: GoogleFonts.roboto(fontSize: itemFontSize)),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.roboto(fontSize: itemFontSize, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹${(totalAmount + 1).toStringAsFixed(2)}',
                            style: GoogleFonts.roboto(fontSize: itemFontSize, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      Text(
                        'Payment Method',
                        style: GoogleFonts.roboto(
                          fontSize: itemFontSize * 1.3,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        child: Row(
                          children: [
                            const Icon(Icons.credit_card, color: Colors.blue, size: 24),
                            SizedBox(width: screenWidth * 0.03),
                            Text(
                              'Cash On Delivery Only',
                              style: GoogleFonts.roboto(
                                fontSize: itemFontSize,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      Center(
                        child: SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.06,
                          child: ElevatedButton(
                            onPressed: _showCheckoutDialog, 
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Text(
                              'Checkout',
                              style: GoogleFonts.roboto(
                                fontSize: titleFontSize * 0.6,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
