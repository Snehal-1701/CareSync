// import 'dart:io';

// import 'package:caresync/Tejas/AdminSide/Manage.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';


// class AddStoreScreen extends StatefulWidget {
//   const AddStoreScreen({super.key});

//   @override
//   _AddStoreScreenState createState() => _AddStoreScreenState();
// }

// class _AddStoreScreenState extends State<AddStoreScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   String? _lastAddedStoreName; 

//   File? _profileImage; 
//   final String _imageUrl = '';
//   bool _isImageSelected = false;

//   final DatabaseReference _medicalstoreRef =
//       FirebaseDatabase.instance.ref().child('CareSync/Medical Stores/');

//    void _saveStore() async{
//     String name = _nameController.text.trim();
//     String address = _addressController.text.trim();
//     String phone = _phoneController.text.trim();

//     if (name.isNotEmpty && address.isNotEmpty && phone.isNotEmpty ) {
//       await _medicalstoreRef.push().set({
//         'name': name,
//         'phone': phone,
//         'address': address,
//         'timestamp': ServerValue.timestamp,
//       }).then((_) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Medical Store added successfully!")));
//         _nameController.clear();
//         _phoneController.clear();
//         _addressController.clear();
//         //Save the name of the last added store
//         setState(() {
//           _lastAddedStoreName = name;
//         });
//       }).catchError((error) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Failed to add medical store: $error")));
//       });
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Please fill all fields")));
//     }
//   }

//   // Function to pick image from device
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//         _isImageSelected = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Medical Store'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             GestureDetector(
//                 onTap: _pickImage,
//                 child: CircleAvatar(
//                   radius: screenWidth * 0.1,
//                   backgroundImage: _isImageSelected
//                       ? FileImage(_profileImage!)
//                       : (_imageUrl.isNotEmpty ? NetworkImage(_imageUrl) : null),
//                   child: !_isImageSelected && _imageUrl.isEmpty
//                       ? const Icon(Icons.camera_alt,
//                           size: 30, color: Colors.white)
//                       : null,
//                 )),
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Store Name'),
//             ),
//             TextField(
//               controller: _addressController,
//               decoration: const InputDecoration(labelText: 'Store Address'),
//             ),
//             TextField(
//               controller: _phoneController,
//               decoration: const InputDecoration(labelText: 'Phone Number'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveStore,
//               child: const Text('Add Store'),
//             ),
//             const SizedBox(height: 20),
//             if (_lastAddedStoreName != null) ...[
//               const Divider(),
//               Text(
//                 'Store Added: $_lastAddedStoreName',
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ManageCategoriesScreen(
//                         storeId: _lastAddedStoreName!,
//                         storeName: _lastAddedStoreName!,
//                       ),
//                     ),
//                   );
//                 },
//                 child: const Text('Add Categories'),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:caresync/Tejas/AdminSide/Manage.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AddStoreScreen extends StatefulWidget {
//   const AddStoreScreen({super.key});

//   @override
//   _AddStoreScreenState createState() => _AddStoreScreenState();
// }

// class _AddStoreScreenState extends State<AddStoreScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   File? _profileImage;
//   bool _isImageSelected = false;
//   String? _lastAddedStoreName;
//   String? _lastAddedStoreId;

//   final DatabaseReference _medicalstoreRef =
//       FirebaseDatabase.instance.ref().child('CareSync/Medical Stores');

//   // Function to pick an image from the device
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//         _isImageSelected = true;
//       });
//     }
//   }

//   // Function to upload the image to Firebase Storage and return its URL
//   Future<String?> _uploadImage(File image) async {
//     try {
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('medical_stores/${DateTime.now().millisecondsSinceEpoch}');
//       final uploadTask = await storageRef.putFile(image);
//       return await uploadTask.ref.getDownloadURL();
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Image upload failed: $e')));
//       return null;
//     }
//   }

//   // Function to validate the phone number
//   bool _isPhoneNumberValid(String phone) {
//     final regex = RegExp(r'^\+91\d{10}$');
//     return regex.hasMatch(phone);
//   }

//   // Function to save the medical store details
//   // void _saveStore() async {
//   //   String name = _nameController.text.trim();
//   //   String address = _addressController.text.trim();
//   //   String phone = _phoneController.text.trim();

//   //   if (name.isEmpty || address.isEmpty || phone.isEmpty) {
//   //     ScaffoldMessenger.of(context)
//   //         .showSnackBar(const SnackBar(content: Text("Please fill all fields")));
//   //     return;
//   //   }

//   //   if (!_isPhoneNumberValid(phone)) {
//   //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//   //         content: Text("Phone number must be 10 digits and start with +91")));
//   //     return;
//   //   }

//   //   String? imageUrl;
//   //   if (_isImageSelected && _profileImage != null) {
//   //     imageUrl = await _uploadImage(_profileImage!);
//   //     if (imageUrl == null) return; // Stop if image upload fails
//   //   }

//   //   try {
//   //     final newStoreRef = _medicalstoreRef.push();
//   //     await newStoreRef.set({
//   //       'name': name,
//   //       'phone': phone,
//   //       'address': address,
//   //       'image_url': imageUrl ?? '',
//   //       'timestamp': ServerValue.timestamp,
//   //     });

//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text("Medical Store added successfully!")));
//   //     _nameController.clear();
//   //     _phoneController.clear();
//   //     _addressController.clear();
//   //     setState(() {
//   //       _profileImage = null;
//   //       _isImageSelected = false;
//   //       _lastAddedStoreName = name;
//   //       _lastAddedStoreId = newStoreRef.key; // Save the generated store ID
//   //     });
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text("Failed to add medical store: $e")));
//   //   }
//   // }

//   void _saveStore() async {
//   String name = _nameController.text.trim();
//   String address = _addressController.text.trim();
//   String phone = _phoneController.text.trim();

//   if (name.isEmpty || address.isEmpty || phone.isEmpty) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text("Please fill all fields")));
//     return;
//   }

//   if (!_isPhoneNumberValid(phone)) {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text("Phone number must be 10 digits and start with +91")));
//     return;
//   }

//   String? imageUrl;
//   if (_isImageSelected && _profileImage != null) {
//     imageUrl = await _uploadImage(_profileImage!);
//     if (imageUrl == null) return; // Stop if image upload fails
//   }

//   try {
//     // Generate a unique ID for the store
//     final newStoreRef = _medicalstoreRef.push();
//     String storeId = newStoreRef.key!;

//     // Save the store's details
//     await newStoreRef.child('details').set({
//       'name': name,
//       'phone': phone,
//       'address': address,
//       'image_url': imageUrl ?? '',
//       'timestamp': ServerValue.timestamp,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Medical Store added successfully!")));
//     _nameController.clear();
//     _phoneController.clear();
//     _addressController.clear();
//     setState(() {
//       _profileImage = null;
//       _isImageSelected = false;
//       _lastAddedStoreName = name;
//       _lastAddedStoreId = storeId; // Save the generated store ID
//     });
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to add medical store: $e")));
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Medical Store'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: CircleAvatar(
//                   radius: screenWidth * 0.1,
//                   backgroundImage: _isImageSelected && _profileImage != null
//                       ? FileImage(_profileImage!)
//                       : null,
//                   child: !_isImageSelected
//                       ? const Icon(Icons.camera_alt,
//                           size: 30, color: Colors.white)
//                       : null,
//                 ),
//               ),
//               TextField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(labelText: 'Store Name'),
//               ),
//               TextField(
//                 controller: _addressController,
//                 decoration: const InputDecoration(labelText: 'Store Address'),
//               ),
//               TextField(
//                 controller: _phoneController,
//                 decoration: const InputDecoration(labelText: 'Phone Number'),
//                 keyboardType: TextInputType.phone,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _saveStore,
//                 child: const Text('Add Store'),
//               ),
//               const SizedBox(height: 20),
//               if (_lastAddedStoreName != null && _lastAddedStoreId != null) ...[
//                 const Divider(),
//                 Text(
//                   'Store Added: $_lastAddedStoreName',
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ManageCategoriesScreen(
//                           storeId: _lastAddedStoreId!,
//                           storeName: _lastAddedStoreName!,
//                         ),
//                       ),
//                     );
//                   },
//                   child: const Text('Add Categories'),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:caresync/Tejas/AdminSide/Manage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStoreScreen extends StatefulWidget {
  const AddStoreScreen({super.key});

  @override
  _AddStoreScreenState createState() => _AddStoreScreenState();
}

class _AddStoreScreenState extends State<AddStoreScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  File? _profileImage;
  bool _isImageSelected = false;
  String? _lastAddedStoreName;
  String? _lastAddedStoreId;

  final CollectionReference _medicalStoresRef =
      FirebaseFirestore.instance.collection('Medical Stores');

  // Function to pick an image from the device
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
        _isImageSelected = true;
      });
    }
  }

  // Function to upload the image to Firebase Storage and return its URL
  Future<String?> _uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('CareSync/medical_stores/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = await storageRef.putFile(image);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Image upload failed: $e')));
      return null;
    }
  }

  // Function to validate the phone number
  bool _isPhoneNumberValid(String phone) {
    final regex = RegExp(r'^\+91\d{10}$');
    return regex.hasMatch(phone);
  }

  // Function to save the medical store details
  void _saveStore() async {
    String name = _nameController.text.trim();
    String address = _addressController.text.trim();
    String phone = _phoneController.text.trim();

    if (name.isEmpty || address.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    if (!_isPhoneNumberValid(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Phone number must be 10 digits and start with +91")));
      return;
    }

    String? imageUrl;
    if (_isImageSelected && _profileImage != null) {
      imageUrl = await _uploadImage(_profileImage!);
      if (imageUrl == null) return; // Stop if image upload fails
    }

    try {
      // Generate a new document in the 'medicalStores' collection
      final newStoreRef = _medicalStoresRef.doc();
      String storeId = newStoreRef.id;

      // Save the store's details
      await newStoreRef.set({
        'name': name,
        'phone': phone,
        'address': address,
        'image_url': imageUrl ?? '',
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Medical Store added successfully!")));
      _nameController.clear();
      _phoneController.clear();
      _addressController.clear();
      setState(() {
        _profileImage = null;
        _isImageSelected = false;
        _lastAddedStoreName = name;
        _lastAddedStoreId = storeId; // Save the generated store ID
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to add medical store: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medical Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: screenWidth * 0.1,
                  backgroundImage: _isImageSelected && _profileImage != null
                      ? FileImage(_profileImage!)
                      : null,
                  child: !_isImageSelected
                      ? const Icon(Icons.camera_alt,
                          size: 30, color: Colors.white)
                      : null,
                ),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Store Name'),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Store Address'),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveStore,
                child: const Text('Add Store'),
              ),
              const SizedBox(height: 20),
              if (_lastAddedStoreName != null && _lastAddedStoreId != null) ...[
                const Divider(),
                Text(
                  'Store Added: $_lastAddedStoreName',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManageCategoriesScreen(
                          storeId: _lastAddedStoreId!,
                          storeName: _lastAddedStoreName!,
                        ),
                      ),
                    );
                  },
                  child: const Text('Add Categories'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
