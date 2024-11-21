import 'dart:io';

import 'package:caresync/Snehal/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'dummyvideo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: AnimatedGifExample(),
      // home: DisplayPDFFile(pdfFile: File('lib/May_Jun_2022 (1).pdf')),
    );
  }
}

