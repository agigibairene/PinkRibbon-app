import 'package:flutter/material.dart';
import 'main.dart'; // Import main.dart to access MyDrawer

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts and Specialists'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 38.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(onTap: (ctx, i) {
        Navigator.pop(ctx); // Close the drawer
        Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(builder: (ctx) => MyApp()), // Restart the app
          (route) => false,
        );
      }),
    );
  }
}
