import 'package:caresync/Tejas/PatientSide.dart/PatientHomeScreen.dart';
import 'package:flutter/material.dart';

class AmbulanceDetailsScreen extends StatefulWidget {
  final String ambulanceId;

  const AmbulanceDetailsScreen({super.key, required this.ambulanceId});

  @override
  _AmbulanceDetailsScreenState createState() => _AmbulanceDetailsScreenState();
}

class _AmbulanceDetailsScreenState extends State<AmbulanceDetailsScreen> {
  final _pickupController = TextEditingController();
  final _dropoffController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void confirmBooking(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Booking Confirmed",
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            content: Text(
              "Your booking for ${widget.ambulanceId} has been confirmed!",
              style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PatientHomeScreen()),
                  );
                },
                child: Text("OK", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double padding = screenWidth * 0.04;
    double margin = screenWidth * 0.05;
    double iconSize = screenWidth * 0.1;

    return Scaffold(
      body: SingleChildScrollView( 
        child: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueAccent, Colors.white, Colors.redAccent],
              stops: [0.1, 0.5, 1.0], 
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(padding, screenHeight * 0.06, padding, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom AppBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);  // Navigate back
                      },
                      child: Container(
                        height: screenWidth * 0.1,
                        width: screenWidth * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenWidth * 0.04),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.grey,
                          size: screenWidth * 0.06,
                        ),
                      ),
                    ),
                    Text(
                      'Ambulance Details',
                      style: TextStyle(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: iconSize), 
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),

                // Ambulance Details Section
                Center(
                  child: Text(
                    widget.ambulanceId,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Contact Number Section
                Center(
                  child: Text(
                    "Contact: +91 9852668800", 
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // Form for Booking
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _pickupController,
                        decoration: const InputDecoration(
                          labelText: 'Pickup Location',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter pickup location';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      TextFormField(
                        controller: _dropoffController,
                        decoration: const InputDecoration(
                          labelText: 'Dropoff Location',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter dropoff location';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      ElevatedButton(
                        onPressed: () => confirmBooking(context),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.02),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.03)),
                        ),
                        child: Text('Book Now', style: TextStyle(fontSize: screenWidth * 0.05)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
