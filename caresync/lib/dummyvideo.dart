// // import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';

// // class VideoExample extends StatefulWidget {
// //   @override
// //   _VideoExampleState createState() => _VideoExampleState();
// // }

// // class _VideoExampleState extends State<VideoExample> {
// //   late VideoPlayerController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerController.asset('assets/Doctor holding gift box.mp4')
// //       ..initialize().then((_) {
// //         setState(() {}); // Refresh after initialization
// //         _controller.play(); // Start playback
// //       });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: _controller.value.isInitialized
// //             ? AspectRatio(
// //                 aspectRatio: _controller.value.aspectRatio,
// //                 child: VideoPlayer(_controller),
// //               )
// //             : CircularProgressIndicator(), // Show a loader until the video loads
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     _controller.dispose();
// //   }
// // }


// import 'package:flutter/material.dart';

// class AnimatedGifExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Animated GIF Example")),
//       body: Center(
//         child: Image.asset('assets/Doctor holding gift box.gif'), // Local GIF
//         // Or for online GIF:
//         // child: Image.network('https://example.com/your_animation.gif'),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class DisplayPDFFile extends StatelessWidget {
  final File pdfFile;

  DisplayPDFFile({required this.pdfFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Display PDF")),
      body: pdfFile.existsSync()
          ? PDFView(
              filePath: pdfFile.path,
            )
          : Center(child: Text("File not found")),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: DisplayPDFFile(pdfFile: File('"C:/Users/SNEHAL/Downloads/May_Jun_2022 (1).pdf"')),
//   ));
// }
