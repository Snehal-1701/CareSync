import 'package:caresync/Komal/ChatApp/ChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Map<String, String>> chatMessages = [
    {"name": "Dr. Anna", "message": "You have a good heart!", "time": "12:45"},
    {"name": "Dr. Hendra", "message": "How are you today?", "time": "12:45"},
    {"name": "Dr. Christy", "message": "Cool! You'll feel better soon", "time": "12:45"},
    {"name": "Dr. Wilson", "message": "You have a good heart!", "time": "12:45"},
    {"name": "Dr. Stewart", "message": "You have a good heart!", "time": "12:45"},
  ];

  void _navigateToChat(Map<String, String> chat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          chatData: chat,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = screenWidth * 0.04;

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
            child: Padding(
              padding: EdgeInsets.fromLTRB(padding, screenHeight * 0.06, padding, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: screenWidth * 0.12,
                          width: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenWidth * 0.04),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        'Messages',
                        style: GoogleFonts.rubik(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.12), // Placeholder for spacing
                    ],
                  ),
                  
                  // Search Bar
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.08),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          icon: Icon(Icons.search, color: Colors.grey, size: screenWidth * 0.06),
                        ),
                        style: TextStyle(fontSize: screenWidth * 0.045),
                      ),
                    ),
                  ),
                        
                  // Chat List
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      itemCount: chatMessages.length,
                      itemBuilder: (context, index) {
                        final chat = chatMessages[index];
                        return GestureDetector(
                          onTap: () => _navigateToChat(chat),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: screenWidth * 0.08,
                                  backgroundImage: AssetImage('assets/jpg/ChatApp/doctor${index + 1}.jpg'),
                                ),
                                SizedBox(width: screenWidth * 0.03),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        chat["name"]!,
                                        style: GoogleFonts.rubik(
                                          fontSize: screenWidth * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.005),
                                      Text(
                                        chat["message"]!,
                                        style: GoogleFonts.rubik(
                                          fontSize: screenWidth * 0.04,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  chat["time"]!,
                                  style: GoogleFonts.rubik(
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
