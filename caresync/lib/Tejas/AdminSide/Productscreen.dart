// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// // Example Product class
// class Product {
//   String name;
//   double price;
//   double mrp;
//   final String image;
//   bool liked; // Product liked status

//   Product({
//     required this.name,
//     required this.price,
//     required this.mrp,
//     required this.image,
//     this.liked = false,
//   });
// }

// //final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// final Map<String, List<Product>> predefinedProductCategories = {
//   'Baby Care': [
//     Product(
//       name: 'Pampers Baby Dry Pants (M) 20',
//       price: 369.00,
//       mrp: 0.00,
//       image: 'assets/png/Category7/C7Product1.png',
//     ),
//     Product(
//       name: 'Huggies Wonder Pants L 22\'s',
//       price: 419.00,
//       mrp: 0.00,
//       image: 'assets/png/Category7/C7Product2.png',
//     ),
//     Product(
//       name: 'Johnson’s Baby Soap 75 gm (Pack of 3)',
//       price: 107.66,
//       mrp: 149.00,
//       image: 'assets/png/Category7/C7Product3.png',
//     ),
//     // Add more products here
//   ],
//   // More categories can be added here
// };

// class ProductScreen extends StatefulWidget {
//   final String category;
//   final String storeId;

//   const ProductScreen({super.key, required this.category, required this.storeId});

//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   List<Product> selectedProducts = []; // List of selected products for the store

//   @override
//   Widget build(BuildContext context) {
//     // Get the list of products based on the category selected from the predefined list
//     List<Product> products = predefinedProductCategories[widget.category] ?? [];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.category} Products'),
//       ),
//       body: products.isEmpty
//           ? const Center(
//               child: Text(
//                 'No products available in this category.',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             )
//           : ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 Product product = products[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Image
//                         ConstrainedBox(
//                           constraints: const BoxConstraints(maxWidth: 100, maxHeight: 100),
//                           child: Image.asset(
//                             product.image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // Product name with text overflow handling
//                               Text(
//                                 product.name,
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               const SizedBox(height: 8),
//                               // Price and MRP
//                               Text('Price: ₹${product.price}'),
//                               Text('MRP: ₹${product.mrp}'),
//                               const SizedBox(height: 8),
//                               // Product selection option
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(
//                                       selectedProducts.contains(product)
//                                           ? Icons.check_circle
//                                           : Icons.radio_button_unchecked,
//                                       color: selectedProducts.contains(product)
//                                           ? Colors.green
//                                           : Colors.black,
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         if (selectedProducts.contains(product)) {
//                                           selectedProducts.remove(product);
//                                         } else {
//                                           selectedProducts.add(product);
//                                         }
//                                       });
//                                     },
//                                   ),
//                                   Text(selectedProducts.contains(product)
//                                       ? 'Selected'
//                                       : 'Select'),
//                                   const Spacer(),
//                                   // Edit Product Option
//                                   IconButton(
//                                     icon: const Icon(Icons.edit),
//                                     onPressed: () {
//                                       _editProduct(product);
//                                     },
//                                   ),
//                                   // Delete Product Option
//                                   IconButton(
//                                     icon: const Icon(Icons.delete),
//                                     onPressed: () {
//                                       setState(() {
//                                         products.remove(product);
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _saveSelectedProducts,
//         tooltip: 'Save Selected Products',
//         child: const Icon(Icons.save),
//       ),
//     );
//   }

//   // Edit product details (name, price, MRP)
//   void _editProduct(Product product) async {
//     TextEditingController nameController = TextEditingController(text: product.name);
//     TextEditingController priceController = TextEditingController(text: product.price.toString());
//     TextEditingController mrpController = TextEditingController(text: product.mrp.toString());

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Edit Product'),
//           content: Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: 'Product Name'),
//               ),
//               TextField(
//                 controller: priceController,
//                 decoration: const InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: mrpController,
//                 decoration: const InputDecoration(labelText: 'MRP'),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   product.name = nameController.text;
//                   product.price = double.tryParse(priceController.text) ?? 0.0; // default to 0.0 if empty/invalid
//                   product.mrp = double.tryParse(mrpController.text) ?? 0.0; // default to 0.0 if empty/invalid
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

// void _saveSelectedProducts() async {
//   if (selectedProducts.isEmpty) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text('No products selected!')));
//     return;
//   }

//   try {
//     // Store the selected products in Realtime Database under the category
//     String category = widget.category;
//     String storeId = widget.storeId;

//     // Convert product data to a format suitable for Firebase
//     List<Map<String, dynamic>> productData = selectedProducts.map((product) {
//       return {
//         'name': product.name,
//         'price': product.price,
//         'mrp': product.mrp,
//         'image': product.image,
//       };
//     }).toList();

//     // Add the products to the Realtime Database
//     final DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
//     await databaseRef
//         .child('CareSync/Medical Stores/$storeId/categories/$category/products')
//         .set(productData);

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Products saved successfully!')));
//   } catch (e) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text('Error: $e')));
//   }
// }

//   // Open dialog to add a new product
//   void _openAddProductDialog() async {
//     TextEditingController nameController = TextEditingController();
//     TextEditingController priceController = TextEditingController();
//     TextEditingController mrpController = TextEditingController();
//     TextEditingController imageController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add New Product'),
//           content: Column(
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: 'Product Name'),
//               ),
//               TextField(
//                 controller: priceController,
//                 decoration: const InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: mrpController,
//                 decoration: const InputDecoration(labelText: 'MRP'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: imageController,
//                 decoration: const InputDecoration(labelText: 'Image URL'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Ensure price and MRP are valid doubles
//                 double price = double.tryParse(priceController.text) ?? 0.0; // default to 0.0 if empty/invalid
//                 double mrp = double.tryParse(mrpController.text) ?? 0.0; // default to 0.0 if empty/invalid

//                 setState(() {
//                   Product newProduct = Product(
//                     name: nameController.text,
//                     price: price,
//                     mrp: mrp,
//                     image: imageController.text,
//                   );
//                   predefinedProductCategories[widget.category]?.add(newProduct);
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class Product {
//   String name;
//   double price;
//   double mrp;
//   String? imageUrl;
//   bool isSelected;

//   Product({
//     required this.name,
//     required this.price,
//     required this.mrp,
//     this.imageUrl,
//     this.isSelected = false,
//   });

//   // Convert a Product object to a Map (for Firestore)
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'price': price,
//       'mrp': mrp,
//       'imageUrl': imageUrl ?? '',
//     };
//   }

//   // Create a Product object from Firestore data
//   factory Product.fromFirestore(Map<String, dynamic> data) {
//     return Product(
//       name: data['name'],
//       price: data['price'],
//       mrp: data['mrp'],
//       imageUrl: data['imageUrl'],
//     );
//   }
// }

// final Map<String, List<Product>> predefinedProductCategories = {
//   'Baby Care': [
//     Product(
//       name: 'Pampers Baby Dry Pants (M) 20',
//       price: 369.00,
//       mrp: 400.00,
//     ),
//     Product(
//       name: 'Huggies Wonder Pants L 22\'s',
//       price: 419.00,
//       mrp: 450.00,
//     ),
//     Product(
//       name: 'Johnson’s Baby Soap 75 gm (Pack of 3)',
//       price: 107.66,
//       mrp: 149.00,
//     ),
//   ],
//   // Add other categories if needed
// };

// class ProductScreen extends StatefulWidget {
//   final String category;
//   final String storeId;

//   const ProductScreen({super.key, required this.category, required this.storeId});

//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   List<Product> products = [];
//   bool isLoading = true;
//   List<Product> selectedProducts = []; // Track selected products
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     try {
//       final categoryDoc = FirebaseFirestore.instance
//           .collection('Medical Stores')
//           .doc(widget.storeId)
//           .collection('categories')
//           .doc(widget.category);

//       final snapshot = await categoryDoc.collection('products').get();

//       // Check if Firestore has products, otherwise use predefined ones
//       if (snapshot.docs.isEmpty) {
//         setState(() {
//           products = predefinedProductCategories[widget.category] ?? [];
//           isLoading = false;
//         });
//         return;
//       }

//       products = snapshot.docs.map((doc) {
//         return Product.fromFirestore(doc.data());
//       }).toList();

//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching products: $e')),
//       );
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Future<String> uploadImage(File imageFile) async {
//     final storageRef = FirebaseStorage.instance
//         .ref()
//         .child('CareSync/products/${DateTime.now().millisecondsSinceEpoch}.jpg');
//     await storageRef.putFile(imageFile);
//     return await storageRef.getDownloadURL();
//   }

//   void _addProduct() async {
//     TextEditingController nameController = TextEditingController();
//     TextEditingController priceController = TextEditingController();
//     TextEditingController mrpController = TextEditingController();
//     File? selectedImage;

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Product'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: 'Product Name'),
//                 ),
//                 TextField(
//                   controller: priceController,
//                   decoration: const InputDecoration(labelText: 'Price'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 TextField(
//                   controller: mrpController,
//                   decoration: const InputDecoration(labelText: 'MRP'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton.icon(
//                   onPressed: () async {
//                     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//                     if (pickedFile != null) {
//                       selectedImage = File(pickedFile.path);
//                     }
//                   },
//                   icon: const Icon(Icons.image),
//                   label: const Text('Choose Image'),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 if (selectedImage == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Please select an image')),
//                   );
//                   return;
//                 }

//                 final imageUrl = await uploadImage(selectedImage!);

//                 final newProduct = Product(
//                   name: nameController.text,
//                   price: double.tryParse(priceController.text) ?? 0.0,
//                   mrp: double.tryParse(mrpController.text) ?? 0.0,
//                   imageUrl: imageUrl,
//                 );

//                 final categoryDoc = FirebaseFirestore.instance
//                     .collection('Medical Stores')
//                     .doc(widget.storeId)
//                     .collection('categories')
//                     .doc(widget.category);

//                 await categoryDoc.collection('products').add(newProduct.toMap());

//                 fetchProducts();
//                 Navigator.pop(context);
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> deleteProduct(Product product) async {
//     final categoryDoc = FirebaseFirestore.instance
//         .collection('Medical Stores')
//         .doc(widget.storeId)
//         .collection('categories')
//         .doc(widget.category);

//     final querySnapshot = await categoryDoc
//         .collection('products')
//         .where('name', isEqualTo: product.name)
//         .get();

//     for (var doc in querySnapshot.docs) {
//       await doc.reference.delete();
//     }

//     fetchProducts();
//   }

//   // Handle save selected products
//   Future<void> saveSelectedProducts() async {
//     try {
//       for (var product in selectedProducts) {
//         final categoryDoc = FirebaseFirestore.instance
//             .collection('Medical Stores')
//             .doc(widget.storeId)
//             .collection('categories')
//             .doc(widget.category);

//         await categoryDoc.collection('products').add(product.toMap());
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Selected products saved successfully!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving selected products: $e')),
//       );
//     }
//   }

//   // Handle editing the product details
//   void _editProduct(Product product) async {
//     TextEditingController nameController = TextEditingController(text: product.name);
//     TextEditingController priceController = TextEditingController(text: product.price.toString());
//     TextEditingController mrpController = TextEditingController(text: product.mrp.toString());
//     File? selectedImage;

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Edit Product'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: 'Product Name'),
//                 ),
//                 TextField(
//                   controller: priceController,
//                   decoration: const InputDecoration(labelText: 'Price'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 TextField(
//                   controller: mrpController,
//                   decoration: const InputDecoration(labelText: 'MRP'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton.icon(
//                   onPressed: () async {
//                     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//                     if (pickedFile != null) {
//                       selectedImage = File(pickedFile.path);
//                     }
//                   },
//                   label: const Text('Choose Image'),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 if (selectedImage != null) {
//                   product.imageUrl = await uploadImage(selectedImage!);
//                 }

//                 product.name = nameController.text;
//                 product.price = double.tryParse(priceController.text) ?? 0.0;
//                 product.mrp = double.tryParse(mrpController.text) ?? 0.0;

//                 // Save the updated product details back to Firestore
//                 final categoryDoc = FirebaseFirestore.instance
//                     .collection('Medical Stores')
//                     .doc(widget.storeId)
//                     .collection('categories')
//                     .doc(widget.category);

//                 final querySnapshot = await categoryDoc
//                     .collection('products')
//                     .where('name', isEqualTo: product.name)
//                     .get();

//                 for (var doc in querySnapshot.docs) {
//                   await doc.reference.update(product.toMap());
//                 }

//                 fetchProducts();
//                 Navigator.pop(context);
//               },
//               child: const Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.category)),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];

//                 return ListTile(
//                   leading:IconButton(
//                           icon: const Icon(Icons.image, size: 50),
//                           onPressed: () async {
//                             final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//                             if (pickedFile != null) {
//                               File selectedImage = File(pickedFile.path);

//                               final imageUrl = await uploadImage(selectedImage);

//                               setState(() {
//                                 product.imageUrl = imageUrl;
//                               });

//                               final categoryDoc = FirebaseFirestore.instance
//                                   .collection('Medical Stores')
//                                   .doc(widget.storeId)
//                                   .collection('categories')
//                                   .doc(widget.category);

//                               final querySnapshot = await categoryDoc
//                                   .collection('products')
//                                   .where('name', isEqualTo: product.name)
//                                   .get();

//                               for (var doc in querySnapshot.docs) {
//                                 await doc.reference.update({
//                                   'imageUrl': imageUrl,
//                                 });
//                               }
//                             }
//                           },
//                   ),
//                   title: Text(product.name),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Price: ₹${product.price}'),
//                       Text('MRP: ₹${product.mrp}'),
//                     ],
//                   ),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () => _editProduct(product),
//                       ),
//                       Checkbox(
//                         value: product.isSelected,
//                         onChanged: (bool? value) {
//                           setState(() {
//                             product.isSelected = value!;
//                             if (product.isSelected) {
//                               selectedProducts.add(product);
//                             } else {
//                               selectedProducts.remove(product);
//                             }
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () => deleteProduct(product),
//                       ),
//                     ],
//                   ),
//                 );
//               },

//             ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: _addProduct,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Product {
  String name;
  double price;
  double mrp;
  String? imageUrl;
  bool isSelected;

  Product({
    required this.name,
    required this.price,
    required this.mrp,
    this.imageUrl,
    this.isSelected = false,
  });
}

final Map<String, List<Product>> predefinedProductCategories = {
  'Baby Care': [
    Product(name: 'Pampers Baby Dry Pants (M) 20', price: 369.00, mrp: 400.00),
    Product(name: 'Huggies Wonder Pants L 22\'s', price: 419.00, mrp: 450.00),
    Product(
        name: 'Johnson’s Baby Soap 75 gm (Pack of 3)',
        price: 107.66,
        mrp: 149.00),
  ],
  'Health Essentials': [
    Product(name: 'Vicks Vaporub', price: 50.00, mrp: 60.00),
    Product(name: 'Dettol Antiseptic Liquid', price: 150.00, mrp: 180.00),
  ],
};

class ProductScreen extends StatefulWidget {
  final String category;
  final String storeId;

  const ProductScreen({super.key, required this.storeId, required this.category});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Product> products;
  List<Product> selectedProducts = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    products = predefinedProductCategories[widget.category] ?? [];
  }

  void _addProduct() {
    TextEditingController nameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController mrpController = TextEditingController();
    File? selectedImage;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Product'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: mrpController,
                  decoration: const InputDecoration(labelText: 'MRP'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      selectedImage = File(pickedFile.path);
                    }
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Choose Image'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final newProduct = Product(
                  name: nameController.text,
                  price: double.tryParse(priceController.text) ?? 0.0,
                  mrp: double.tryParse(mrpController.text) ?? 0.0,
                  imageUrl: selectedImage?.path,
                );
                setState(() {
                  products.add(newProduct);
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editProduct(Product product) {
    TextEditingController nameController =
        TextEditingController(text: product.name);
    TextEditingController priceController =
        TextEditingController(text: product.price.toString());
    TextEditingController mrpController =
        TextEditingController(text: product.mrp.toString());
    File? selectedImage;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Product'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: mrpController,
                  decoration: const InputDecoration(labelText: 'MRP'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      selectedImage = File(pickedFile.path);
                    }
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Choose Image'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  product.name = nameController.text;
                  product.price = double.tryParse(priceController.text) ?? 0.0;
                  product.mrp = double.tryParse(mrpController.text) ?? 0.0;
                  if (selectedImage != null) {
                    product.imageUrl = selectedImage!.path;
                  }
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteProduct(Product product) {
    setState(() {
      products.remove(product);
    });
  }

  Future<void> _saveSelectedProducts() async {
    if (selectedProducts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No products selected to save')),
      );
      return;
    }

    final firestore = FirebaseFirestore.instance;
    final storage = FirebaseStorage.instance;

    for (var product in selectedProducts) {
      String? imageUrl;
      if (product.imageUrl != null) {
        final file = File(product.imageUrl!);
        final ref = storage.ref().child('CareSync/products/${DateTime.now().toIso8601String()}_${product.name}.jpg');
        final uploadTask = await ref.putFile(file);
        imageUrl = await uploadTask.ref.getDownloadURL();
      }
      print('________________________Medical Stores/${widget.storeId}/categories/${widget.category}___________________');
      await firestore.collection('Medical Stores/${widget.storeId}/categories/${widget.category}/products').add({
       
        'name': product.name,
        'price': product.price,
        'mrp': product.mrp,
        'imageUrl': imageUrl,
        'category': widget.category,
      });
      
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selected products saved successfully')),
    );
    setState(() {
      selectedProducts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: product.imageUrl != null
                ? Image.file(File(product.imageUrl!), width: 50, height: 50)
                : const Icon(Icons.image, size: 50),
            title: Text(product.name),
            subtitle: Text('Price: ₹${product.price} | MRP: ₹${product.mrp}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: product.isSelected,
                  onChanged: (value) {
                    setState(() {
                      product.isSelected = value ?? false;
                      if (product.isSelected) {
                        selectedProducts.add(product);
                      } else {
                        selectedProducts.remove(product);
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editProduct(product),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteProduct(product),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _saveSelectedProducts,
            heroTag: 'save',
            child: const Icon(Icons.save),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _addProduct,
            heroTag: 'add',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
