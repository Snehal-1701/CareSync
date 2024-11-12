import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddMedicalStorePage extends StatefulWidget {
  const AddMedicalStorePage({super.key});

  @override
  _AddMedicalStorePageState createState() => _AddMedicalStorePageState();
}

class _AddMedicalStorePageState extends State<AddMedicalStorePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
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
        child: Column(
          children: [
            // Custom AppBar
            Container(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                bottom: screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.teal[700],),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      "Add Medical Store",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.teal[700],
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), 
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image Picker with Circle Avatar
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: screenWidth * 0.15, 
                        backgroundColor: Colors.grey[300],
                        backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
                        child: _selectedImage == null
                            ? Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: screenWidth * 0.2,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Text Fields
                    _buildTextField("Store Name", _nameController, screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    _buildTextField("Location", _locationController, screenWidth),
                    SizedBox(height: screenHeight * 0.02),
                    _buildTextField("Contact Number", _contactController, screenWidth),
                    SizedBox(height: screenHeight * 0.04),

                    // Add Store Button
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[400],
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical: screenHeight * 0.02,
                          ),
                        ),
                        child: Text(
                          "Add Store",
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, double screenWidth) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.07),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
