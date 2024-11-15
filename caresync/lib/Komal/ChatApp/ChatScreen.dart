import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  final Map<String, String> chatData;

  const ChatScreen({super.key, required this.chatData});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> messages = [];

  @override
  void initState() {
    super.initState();
    messages.add({
      "text": widget.chatData["message"] ?? '',
      "type": "received",
      "time": widget.chatData["time"] ?? '',
    });
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose an option',
                style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.photo, color: Colors.blue),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file, color: Colors.green),
                title: const Text('File'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          Column(
            children: [
              // Custom AppBar with increased space from top and modified back button
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 10,
                  left: screenWidth * 0.02,
                  right: screenWidth * 0.02,
                  bottom: screenHeight * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          widget.chatData['name'] ?? 'Chat',
                          style: GoogleFonts.rubik(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.05,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.call, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
          
              // Chat Messages
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 8.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isSent = message["type"] == "sent";
                    return Align(
                      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: screenWidth * 0.04),
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            constraints: BoxConstraints(maxWidth: screenWidth * 0.75),
                            decoration: BoxDecoration(
                              color: isSent ? const Color(0xFF4A49E8) : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              message["text"]!,
                              style: GoogleFonts.rubik(
                                color: isSent ? Colors.white : Colors.black87,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Text(
                              message["time"]!,
                              style: GoogleFonts.rubik(color: Colors.grey, fontSize: screenWidth * 0.03),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          
              // Message Input Field
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.grey),
                      onPressed: _showAttachmentOptions,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          hintStyle: TextStyle(color: Colors.grey[500], fontSize: screenWidth * 0.04),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Color(0xFF4A49E8)),
                      onPressed: () {
                        if (_messageController.text.trim().isNotEmpty) {
                          setState(() {
                            messages.add({
                              "text": _messageController.text,
                              "type": "sent",
                              "time": "12:10",
                            });
                            _messageController.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
