import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAmbulancePage extends StatefulWidget {
  const AddAmbulancePage({super.key});

  @override
  _AddAmbulancePageState createState() => _AddAmbulancePageState();
}

class _AddAmbulancePageState extends State<AddAmbulancePage> {
  final _ambulanceNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _chargesController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedAmbulanceType = 'Basic Life Support';

  final List<String> _ambulanceTypes = [
    'Basic Life Support',
    'Advanced Life Support',
    'Patient Transport',
  ];

  final DatabaseReference _ambulancesRef =
      FirebaseDatabase.instance.ref().child('CareSync/ambulances');

  void addAmbulance() {
    String ambulanceName = _ambulanceNameController.text;
    String phoneNumber = _phoneController.text;
    String location = _locationController.text;
    String charges = _chargesController.text;
    String ambulanceType = _selectedAmbulanceType;

    if (ambulanceName.isNotEmpty &&
        location.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        charges.isNotEmpty &&
        ambulanceType.isNotEmpty) {
      _ambulancesRef.child(ambulanceType).push().set({
        'name': ambulanceName,
        'phone': phoneNumber,
        'location': location,
        'charges': charges,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ambulance added successfully!")));
        _ambulanceNameController.clear();
        _phoneController.clear();
        _locationController.clear();
        _chargesController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to add ambulance: $error")));
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please fill all fields")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
            padding: const EdgeInsets.fromLTRB(16.0, 70, 16, 0),
            child: Column(
              children: [
                // Custom AppBar
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 42, 
                            width: 42,
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
                      
                      Text(
                        'Add Ambulance',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      // IconButton(
                      //   icon: const Icon(Icons.shopping_cart),
                      //   onPressed: _goToCart,
                      // ),
                    ],
                  ),
            const SizedBox(height: 50,),
                // Form Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      _buildTextField(
                        controller: _ambulanceNameController,
                        labelText: "Ambulance Name",
                        icon: Icons.local_hospital,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _phoneController,
                        labelText: "Phone Number",
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _locationController,
                        labelText: "Location",
                        icon: Icons.location_on,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _chargesController,
                        labelText: "Charges",
                        icon: Icons.attach_money,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: _selectedAmbulanceType,
                        items: _ambulanceTypes.map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedAmbulanceType = newValue!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Select Ambulance Type",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.car_repair),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: addAmbulance,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: const Color.fromRGBO(14, 190, 127, 1),
                          ),
                          child: const Text(
                            "Add Ambulance",
                            style: TextStyle(fontSize: 16, color: Colors.white),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
      keyboardType: keyboardType,
    );
  }
}
