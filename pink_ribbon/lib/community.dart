import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// CommunityScreen displays a list of support groups fetched from Firestore
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  // Fetches support group data from Firestore
  Future<List<Map<String, dynamic>>> fetchSupportGroups() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('supportGroups').get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belong, Support Groups',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchSupportGroups(),
          builder: (context, snapshot) {
            // Show loading spinner while fetching data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // Display error message if there's an error
            else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            // Show message if no support groups are available
            else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No support groups available.'));
            }
            // Display support groups if data is available
            else {
              return ListView(
                children: snapshot.data!.map((groupData) {
                  return ContactCard(
                    name: groupData['name'],
                    location: groupData['location'],
                    sessionsTime: groupData['sessionsTime'],
                    email: groupData['email'],
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}

// ContactCard displays individual support group information
class ContactCard extends StatelessWidget {
  final String name;
  final String location;
  final String sessionsTime;
  final String email;

  const ContactCard({
    required this.name,
    required this.location,
    required this.sessionsTime,
    required this.email,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Location: $location',
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              'Sessions Time: $sessionsTime',
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 5),
            // Make email address clickable
            InkWell(
              child: Text(email, style: const TextStyle(color: Colors.blue)),
              onTap: () async {
                // Implement email functionality here (e.g., open email client)
              },
            ),
          ],
        ),
      ),
    );
  }
}
