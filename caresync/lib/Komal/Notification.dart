import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationApp extends StatefulWidget {
  const NotificationApp({super.key});

  @override
  State<NotificationApp> createState() => _NotificationAppState();
}

class _NotificationAppState extends State<NotificationApp> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.06,
                bottom: screenHeight * 0.015,
                left: padding,
                right: padding,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: screenWidth * 0.12,
                      width: screenWidth * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.09),
                  Text(
                    "All Appointment",
                    style: GoogleFonts.rubik(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02,
                              vertical: screenWidth * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            ),
                            child: Text(
                              'Today',
                              style: GoogleFonts.rubik(
                                fontSize: screenWidth * 0.045,
                                color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Mark all',
                            style: GoogleFonts.rubik(
                              fontSize: screenWidth * 0.045,
                              color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _notificationItem(
                      context,
                      title: 'Scheduled Appointment',
                      subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      time: '2 M',
                      icon: Icons.calendar_today,
                    ),
                    _notificationItem(
                      context,
                      title: 'Scheduled Change',
                      subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      time: '2 H',
                      icon: Icons.calendar_today,
                      backgroundColor: Colors.teal[50]!,
                    ),
                    _notificationItem(
                      context,
                      title: 'Medical Notes',
                      subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      time: '3 H',
                      icon: Icons.note_alt,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02,
                              vertical: screenWidth * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            ),
                            child: Text(
                              'Yesterday',
                              style: GoogleFonts.rubik(
                                fontSize: screenWidth * 0.045,
                                color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Mark all',
                            style: GoogleFonts.rubik(
                              fontSize: screenWidth * 0.045,
                              color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _notificationItem(
                      context,
                      title: 'Scheduled Appointment',
                      subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      time: '1 D',
                      icon: Icons.calendar_today,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02,
                              vertical: screenWidth * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(screenWidth * 0.03),
                            ),
                            child: Text(
                              '15 April',
                              style: GoogleFonts.rubik(
                                fontSize: screenWidth * 0.045,
                                color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Mark all',
                            style: GoogleFonts.rubik(
                              fontSize: screenWidth * 0.045,
                              color: const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _notificationItem(
                      context,
                      title: 'Medical History Update',
                      subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      time: '5 D',
                      icon: Icons.history,
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

  Widget _notificationItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    Color backgroundColor = Colors.white,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final borderColor = const Color.fromRGBO(14, 190, 127, 1).withOpacity(0.1);

    return Container(
      margin: EdgeInsets.only(bottom: screenWidth * 0.05),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 5),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color.fromRGBO(14, 190, 127, 1),
            size: screenWidth * 0.08,
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.rubik(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  subtitle,
                  style: GoogleFonts.rubik(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            time,
            style: GoogleFonts.rubik(
              fontSize: screenWidth * 0.035,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
