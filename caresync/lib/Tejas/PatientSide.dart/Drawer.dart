import 'package:caresync/Snehal/landingpage.dart';
import 'package:caresync/Snehal/medical_records/medical_record_screen_1.dart';
import 'package:caresync/Tejas/PatientSide.dart/Cart.dart';
import 'package:caresync/Tejas/Login&Sigup/Patient/SignIn.dart';
import 'package:caresync/Tejas/PatientSide.dart/Orders.dart';
import 'package:caresync/Tejas/PatientSide.dart/PatientProfile.dart';
import 'package:caresync/Tejas/PatientSide.dart/Wishlist.dart';
import 'package:caresync/Tejas/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const AppDrawer({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int selectedIndex = -1; 

  void _onItemTapped(int index, BuildContext context, Widget page) {
    setState(() {
      selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFE0F7FA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 70, 16, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PatientProfilePage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[400],
                      radius: 30,
                      child: const Icon(Icons.person, size: 40, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tejas', style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            _buildDrawerItem(Icons.calendar_today, 'My Appointments', context, const Cart(), 0),
            _buildDrawerItem(Icons.list, 'My Orders', context, const OrdersPage(), 1),
            _buildDrawerItem(Icons.shopping_cart, 'My Cart', context, const Cart(), 2),
            _buildDrawerItem(Icons.favorite, 'Wishlist', context, const Wishlist(), 3),
            _buildDrawerItem(Icons.medical_services, 'Medical Records', context, const RecordScreen1(), 4),
            const Divider(),
            ListTile(
              leading: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      widget.isDarkMode ? Colors.grey[800] : Colors.yellow[700],
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                    widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: widget.isDarkMode ? Colors.amber : Colors.blue),
              ),
              title: Text('Dark Mode', style: GoogleFonts.lato(fontSize: 16)),
              trailing: Switch(
                value: widget.isDarkMode,
                onChanged: (_) => widget.toggleTheme(),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout', style: GoogleFonts.lato(fontSize: 16)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Log Out',
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'Are you sure you want to logout?',
                        style: GoogleFonts.lato(fontSize: 16),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'Ok',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(); 
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LandingPage()),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context, Widget page, int index) {
    return ListTile(
      leading: Icon(
        icon,
        color: selectedIndex == index ? const Color.fromRGBO(14, 190, 127, 1) : Colors.black, 
      ),
      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: selectedIndex == index ? const Color.fromRGBO(14, 190, 127, 1) : Colors.black, 
        ),
      ),
      onTap: () => _onItemTapped(index, context, page),
    );
  }
}
