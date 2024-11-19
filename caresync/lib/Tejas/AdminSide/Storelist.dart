import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StoreListScreen extends StatelessWidget {
  const StoreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Stores'),
      ),
      body: StreamBuilder(
        stream: firestore
            .collection('CareSync')
            .doc('MedicalStores')
            .collection('MedicalStores')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final stores = snapshot.data?.docs ?? [];

          if (stores.isEmpty) {
            return const Center(child: Text('No stores found.'));
          }

          return ListView.builder(
            itemCount: stores.length,
            itemBuilder: (context, index) {
              final store = stores[index];
              return ListTile(
                title: Text(store.id), // Store name as document ID
                subtitle: Text('Address: ${store['address']}\nPhone: ${store['phoneNumber']}'),
              );
            },
          );
        },
      ),
    );
  }
}
