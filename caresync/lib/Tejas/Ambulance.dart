import 'package:flutter/material.dart';

class AmbulanceBookingPage extends StatefulWidget {
  const AmbulanceBookingPage({super.key});

  @override
  _AmbulanceBookingPageState createState() => _AmbulanceBookingPageState();
}

class _AmbulanceBookingPageState extends State<AmbulanceBookingPage> {
  String selectedAmbulance = 'Basic Ambulance';
  bool bookingConfirmed = false;

  void showConfirmationMessage() {
    setState(() {
      bookingConfirmed = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        bookingConfirmed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Ambulance"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Ambulance Type",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ambulanceTypeCard('Basic Ambulance', Icons.local_hospital),
                  ambulanceTypeCard('Advanced Ambulance', Icons.medical_services),
                  ambulanceTypeCard('ICU Ambulance', Icons.health_and_safety),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pickup Location",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            searchField("Enter Pickup Location"),
            const SizedBox(height: 20),
            const Text(
              "Drop-off Location",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            searchField("Enter Drop-off Location"),
            const Spacer(),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: bookingConfirmed ? 1 : 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Booking Confirmed!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: showConfirmationMessage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Confirm Booking",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      ),
    );
  }

  Widget ambulanceTypeCard(String type, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmbulance = type;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedAmbulance == type ? Colors.redAccent.withOpacity(0.8) : Colors.grey[300],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              type,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
