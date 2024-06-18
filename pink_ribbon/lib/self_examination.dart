import 'package:flutter/material.dart';
// import 'package:pink_ribbon/profile.dart';
//import 'package:pink_ribbon/faq_screen.dart';
//import 'package:pink_ribbon/self_examination.dart';

class SelfExaminationScreen extends StatelessWidget {
  const SelfExaminationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self Examination'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Add your menu item action here
            },
            itemBuilder: (BuildContext context) {
              return {'Settings', 'About'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: const Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Self Examination Guide',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: RotatedBox(
                    quarterTurns: 4,
                    child: Icon(Icons.self_improvement,
                        size: 100, color: Colors.pink),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Steps to Perform a Self Examination:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Chip(
                  label: Text('Step 1: Look at your breasts in the mirror.'),
                  backgroundColor: Colors.pink,
                ),
                Chip(
                  label: Text('Step 2: Raise your arms and look for changes.'),
                  backgroundColor: Colors.pink,
                ),
                Chip(
                  label: Text('Step 3: Feel your breasts while lying down.'),
                  backgroundColor: Colors.pink,
                ),
                Chip(
                  label: Text(
                      'Step 4: Feel your breasts while standing or sitting.'),
                  backgroundColor: Colors.pink,
                ),
                SizedBox(height: 20),
                Text(
                  'If you notice any changes, contact your healthcare provider.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
