import 'package:caresync/Tejas/PatientSide.dart/PatientHomeScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AmbulanceDetailsScreen extends StatelessWidget {
  final String ambulanceId;
  final String ambulanceType;

  AmbulanceDetailsScreen({
    super.key,
    required this.ambulanceId,
    required this.ambulanceType,
  });

  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final DatabaseReference ambulanceRef = FirebaseDatabase.instance
        .ref()
        .child('CareSync/ambulances/$ambulanceType/$ambulanceId');

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.white, Colors.redAccent],
          ),
        ),
        child: FutureBuilder<DataSnapshot>(
          future: ambulanceRef.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            }

            if (!snapshot.hasData || snapshot.data!.value == null) {
              return const Center(child: Text('No data available'));
            }

            var ambulanceData = snapshot.data!.value as Map<dynamic, dynamic>;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.07,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button and title
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: screenWidth * 0.1,
                            width: screenWidth * 0.1,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.04),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.grey,
                              size: screenWidth * 0.06,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.08),
                        Text(
                          'Ambulance Details',
                          style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // Ambulance details card
                    Container(
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${ambulanceData['name'] ?? 'N/A'}',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Phone: ${ambulanceData['phone'] ?? 'N/A'}',
                            style: TextStyle(fontSize: screenWidth * 0.045),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Location: ${ambulanceData['location'] ?? 'N/A'}',
                            style: TextStyle(fontSize: screenWidth * 0.045),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            'Charges: ${ambulanceData['charges'] ?? 'N/A'}',
                            style: TextStyle(fontSize: screenWidth * 0.045),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Booking form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _pickupController,
                            decoration: InputDecoration(
                              labelText: 'Pickup Location',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.03),
                              ),
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
                            decoration: InputDecoration(
                              labelText: 'Dropoff Location',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.03),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter dropoff location';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _bookAmbulance(context, ambulanceData);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.2,
                                vertical: screenHeight * 0.02,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.03),
                              ),
                            ),
                            child: const Text(
                              'Book Ambulance',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _bookAmbulance(BuildContext context, Map<dynamic, dynamic> ambulanceData) async {
    String pickupLocation = _pickupController.text;
    String dropoffLocation = _dropoffController.text;

    DatabaseReference bookingsRef =
        FirebaseDatabase.instance.ref().child('CareSync/bookings').push();

    try {
      await bookingsRef.set({
        'ambulanceId': ambulanceId,
        'ambulanceType': ambulanceType,
        'ambulancePhone': ambulanceData['phone'],
        'ambulanceName': ambulanceData['name'],
        'pickupLocation': pickupLocation,
        'dropoffLocation': dropoffLocation,
        'status': 'Pending',
        'timestamp': ServerValue.timestamp,
      });

      // Show success message in the SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully booked ${ambulanceData['name']}!'),
      ));

      // Navigate to the PatientHomeScreen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const PatientHomeScreen()),
        (route) => false,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Booking failed. Please try again.'),
      ));
    }
  }
}
