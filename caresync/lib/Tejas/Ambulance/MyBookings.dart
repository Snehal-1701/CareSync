import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAmbulanceBookingsScreen extends StatefulWidget {
  const MyAmbulanceBookingsScreen({super.key});

  @override
  _MyAmbulanceBookingsScreenState createState() =>
      _MyAmbulanceBookingsScreenState();
}

class _MyAmbulanceBookingsScreenState
    extends State<MyAmbulanceBookingsScreen> {
  final DatabaseReference _bookingsRef =
      FirebaseDatabase.instance.ref().child('CareSync/bookings');

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.fromLTRB(16.0, 60, 16, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          size: 30,
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 28),
                    Expanded(
                      child: Text(
                        'My Ambulance Bookings',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                // Bookings list
                Expanded(
                  child: StreamBuilder<DatabaseEvent>(
                    stream: _bookingsRef.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error fetching bookings'));
                      }

                      if (!snapshot.hasData ||
                          snapshot.data!.snapshot.value == null) {
                        return const Center(child: Text('No bookings found'));
                      }

                      Map bookings = snapshot.data!.snapshot.value as Map;

                      return ListView.builder(
                        itemCount: bookings.length,
                        itemBuilder: (context, index) {
                          String key = bookings.keys.elementAt(index);
                          Map booking = bookings[key];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ambulance: ${booking['ambulanceName']}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Pickup: ${booking['pickupLocation']}',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Dropoff: ${booking['dropoffLocation']}',
                                    style: GoogleFonts.poppins(fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Status: ${booking['status']}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: booking['status'] == 'Pending'
                                          ? Colors.orange
                                          : Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
