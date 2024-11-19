import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminJsonManager extends StatefulWidget {
  @override
  _AdminJsonManagerState createState() => _AdminJsonManagerState();
}

class _AdminJsonManagerState extends State<AdminJsonManager> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Map<String, dynamic>? _jsonData; // Holds the JSON data.
  bool _isLoading = false;

  // Upload JSON file to Firebase Storage
  Future<void> _uploadJson() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        setState(() => _isLoading = true);

        // Upload to Firebase Storage
        String fileName = 'medical_store_data.json';
        await _storage.ref(fileName).putFile(file);

        // Read JSON content
        String content = await file.readAsString();
        setState(() {
          _jsonData = jsonDecode(content);
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('JSON uploaded and loaded successfully!')),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload JSON: $e')),
      );
    }
  }

  // Save edited JSON to Firebase Storage
  Future<void> _saveEditedJson() async {
    if (_jsonData == null) return;

    try {
      setState(() => _isLoading = true);

      // Convert JSON to string
      String updatedJson = jsonEncode(_jsonData);

      // Upload updated JSON to Firebase Storage
      String fileName = 'medical_store_data.json';
      await _storage.ref(fileName).putString(updatedJson);

      // Update Firestore (if needed)
      await _firestore.collection('medicalStores').doc('storeData').set({
        'data': _jsonData,
      });

      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('JSON saved successfully!')),
      );
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save JSON: $e')),
      );
    }
  }

  // Render JSON as a text editor
  Widget _buildJsonEditor() {
    if (_jsonData == null) {
      return Center(
        child: Text(
          'No JSON loaded. Upload a file to view and edit.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

    return SingleChildScrollView(
      child: TextField(
        controller: TextEditingController(
          text: const JsonEncoder.withIndent('  ').convert(_jsonData),
        ),
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'JSON Data',
          alignLabelWithHint: true,
        ),
        onChanged: (value) {
          try {
            setState(() {
              _jsonData = jsonDecode(value);
            });
          } catch (_) {
            // Invalid JSON input; leave it unchanged.
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin JSON Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.upload_file),
            onPressed: _uploadJson,
            tooltip: 'Upload JSON',
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveEditedJson,
            tooltip: 'Save Changes',
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildJsonEditor(),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
