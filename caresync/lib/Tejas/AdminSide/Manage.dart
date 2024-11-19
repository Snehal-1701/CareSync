// import 'package:caresync/Tejas/AdminSide/Productscreen.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart'; 
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart'; // Import image_picker package
// import 'dart:io'; // For File handling

// class ManageCategoriesScreen extends StatefulWidget {
//   final String storeId;
//   final String storeName;

//   const ManageCategoriesScreen({
//     super.key,
//     required this.storeId,
//     required this.storeName,
//   });

//   @override
//   _ManageCategoriesScreenState createState() => _ManageCategoriesScreenState();
// }

// class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
//   final List<String> categoryNames = [
//     "Cough & Cold",
//     "Orthopaedics",
//     "Pain Relief",
//     "Skin Care",
//     "Ayurvedic",
//     "Vitamins",
//     "Baby Care",
//     "Fitness",
//     "First Aid",
//     "General Discomfort",
//   ];

//   final DatabaseReference __medicalstoreRef =
//       FirebaseDatabase.instance.ref().child('CareSync/Medical Stores/');

//   Set<String> selectedCategories = {};
//   Map<String, String?> selectedCategoryImages = {};

//   void _navigateToManageProducts(BuildContext context, String categoryName) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ProductScreen(
//           category: categoryName,
//           storeId: widget.storeId,
//         ),
//       ),
//     );
//   }

//   Future<void> _saveSelectedCategories() async {
//     final DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

//     for (var categoryName in selectedCategories) {
//       String imageUrl = '';

//       if (selectedCategoryImages[categoryName] != null) {
//         try {
//           // Upload the image to Firebase Storage
//           String filePath = selectedCategoryImages[categoryName]!;
//           String fileName =
//               'categories/${widget.storeId}/$categoryName/${DateTime.now().millisecondsSinceEpoch}.jpg';

//           final UploadTask uploadTask =
//               FirebaseStorage.instance.ref(fileName).putFile(File(filePath));

//           final TaskSnapshot snapshot = await uploadTask;
//           imageUrl = await snapshot.ref.getDownloadURL();
//         } catch (e) {
//           print('Error uploading image for $categoryName: $e');
//         }
//       }

//       // Save category details to Realtime Database
//       await databaseRef
//           .child('CareSync/Medical Stores/${widget.storeId}/categories/$categoryName')
//           .push()
//           .set({
//             'name': categoryName,
//             'image_url': imageUrl,
//             'timestamp': ServerValue.timestamp,
//           });
//     }

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Selected categories saved successfully!')),
//     );
//   }

//   Future<void> _pickImage(String categoryName) async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         selectedCategoryImages[categoryName] = image.path;
//       });
//     }
//   }

//   Future<void> _openAddCategoryDialog(BuildContext context) async {
//     TextEditingController nameController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add New Category'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: 'Category Name'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 String name = nameController.text.trim();
//                 if (name.isNotEmpty) {
//                   // Allow image picking
//                   await _pickImage(name);
//                   setState(() {
//                     categoryNames.add(name);
//                   });
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('$name added successfully!')),
//                   );
//                   Navigator.pop(context);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Category name is required!')),
//                   );
//                 }
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Manage Categories for ${widget.storeName}'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: categoryNames.length,
//               itemBuilder: (context, index) {
//                 final category = categoryNames[index];
//                 return ListTile(
//                   leading: GestureDetector(
//                     onTap: () => _pickImage(category),
//                     child: Container(
//                       color: Colors.white,
//                       width: 50,
//                       height: 50,
//                       child: selectedCategoryImages[category] != null
//                           ? Image.file(
//                               File(selectedCategoryImages[category]!),
//                               fit: BoxFit.cover,
//                             )
//                           : const Icon(Icons.add_a_photo, size: 30),
//                     ),
//                   ),
//                   title: Text(category),
//                   trailing: Checkbox(
//                     value: selectedCategories.contains(category),
//                     onChanged: (bool? selected) {
//                       setState(() {
//                         if (selected == true) {
//                           selectedCategories.add(category);
//                         } else {
//                           selectedCategories.remove(category);
//                         }
//                       });
//                     },
//                   ),
//                   onTap: () {
//                     _navigateToManageProducts(context, category);
//                   },
//                 );
//               },
//             ),
//           ),
//           const Divider(),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton.icon(
//               onPressed: () async {
//                 if (selectedCategories.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Please select categories first!')),
//                   );
//                 } else {
//                   await _saveSelectedCategories();
//                 }
//               },
//               icon: const Icon(Icons.save),
//               label: const Text('Save Selected Categories'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton.icon(
//               onPressed: () => _openAddCategoryDialog(context),
//               icon: const Icon(Icons.add),
//               label: const Text('Add More Categories'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:caresync/Tejas/AdminSide/Productscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package
import 'dart:io'; // For File handling

class ManageCategoriesScreen extends StatefulWidget {
  final String storeId;
  final String storeName;

  const ManageCategoriesScreen({
    super.key,
    required this.storeId,
    required this.storeName,
  });

  @override
  _ManageCategoriesScreenState createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  final List<String> categoryNames = [
    "Cough & Cold",
    "Orthopaedics",
    "Pain Relief",
    "Skin Care",
    "Ayurvedic",
    "Vitamins",
    "Baby Care",
    "Fitness",
    "First Aid",
    "General Discomfort",
  ];

  Set<String> selectedCategories = {};
  Map<String, String?> selectedCategoryImages = {};

  void _navigateToManageProducts(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(
          category: categoryName,
          storeId: widget.storeId,
        ),
      ),
    );
  }

  Future<void> _saveSelectedCategories() async {
    final CollectionReference storeCategories = FirebaseFirestore.instance
        .collection('Medical Stores')
        .doc(widget.storeId)
        .collection('categories');

    for (var categoryName in selectedCategories) {
      String imageUrl = '';

      if (selectedCategoryImages[categoryName] != null) {
        try {
          // Upload the image to Firebase Storage
          String filePath = selectedCategoryImages[categoryName]!;
          String fileName =
              'CareSync/categories/${widget.storeId}/$categoryName/${DateTime.now().millisecondsSinceEpoch}.jpg';

          final UploadTask uploadTask =
              FirebaseStorage.instance.ref(fileName).putFile(File(filePath));

          final TaskSnapshot snapshot = await uploadTask;
          imageUrl = await snapshot.ref.getDownloadURL();
        } catch (e) {
          print('Error uploading image for $categoryName: $e');
        }
      }

      // Save category details to Firestore
      await storeCategories.doc(categoryName).set({
        'name': categoryName,
        'image_url': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selected categories saved successfully!')),
    );
  }

  Future<void> _pickImage(String categoryName) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedCategoryImages[categoryName] = image.path;
      });
    }
  }

  Future<void> _openAddCategoryDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text.trim();
                if (name.isNotEmpty) {
                  // Allow image picking
                  await _pickImage(name);
                  setState(() {
                    categoryNames.add(name);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name added successfully!')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Category name is required!')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Categories for ${widget.storeName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: categoryNames.length,
              itemBuilder: (context, index) {
                final category = categoryNames[index];
                return ListTile(
                  leading: GestureDetector(
                    onTap: () => _pickImage(category),
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      height: 50,
                      child: selectedCategoryImages[category] != null
                          ? Image.file(
                              File(selectedCategoryImages[category]!),
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.add_a_photo, size: 30),
                    ),
                  ),
                  title: Text(category),
                  trailing: Checkbox(
                    value: selectedCategories.contains(category),
                    onChanged: (bool? selected) {
                      setState(() {
                        if (selected == true) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                      });
                    },
                  ),
                  onTap: () {
                    _navigateToManageProducts(context, category);
                  },
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                if (selectedCategories.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select categories first!')),
                  );
                } else {
                  await _saveSelectedCategories();
                }
              },
              icon: const Icon(Icons.save),
              label: const Text('Save Selected Categories'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () => _openAddCategoryDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('Add More Categories'),
            ),
          ),
        ],
      ),
    );
  }
}
