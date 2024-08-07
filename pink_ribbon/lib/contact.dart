import 'package:flutter/material.dart';
import 'main.dart'; // Import main.dart to access MyDrawer

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts and Specialists',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.pink,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: MyDrawer(onTap: (ctx, i) {
        Navigator.pop(ctx); // Close the drawer
        Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(builder: (ctx) => const MyApp()), // Restart the app
          (route) => false,
        );
      }, username: '', userEmail: '',),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset('images/contacts.png', fit: BoxFit.cover),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(
                    title: 'In your region',
                    text:
                        'This map gives you an overview of the health centers, hospitals, and hotlines around your region.',
                  ),
                  InfoCard(
                    title: 'Institutions',
                    text:
                        'Find an overview of counselling and support health services you can engage with.',
                  ),
                  InfoCard(
                    title: 'Emergency contacts',
                    text:
                        'List of people who can be reached in case of an emergency. You can also call them directly.',
                  ),
                  InfoCard(
                    title: 'Medication management resources',
                    text:
                        'List of pharmacies where you can refill your prescriptions and advice at affordable prices.',
                  ),
                  InfoCard(
                    title: 'Join a community',
                    text:
                        'Belong and connect with other like-minded people in your community. Sharing every emotion and experiences.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String text;

  const InfoCard({required this.title, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 218, 65, 116),
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
        onTap: () {
          if (title == 'Emergency contacts') {
            Navigator.pushNamed(context, '/emergency');
          }
          if (title == 'Institutions') {
            Navigator.pushNamed(context, '/institutions');
          }
          if (title == 'Medication management resources') {
            Navigator.pushNamed(context, '/medication');
          }
          if (title == 'Join a community') {
            Navigator.pushNamed(context, '/community');
          }
          // Add navigation logic her
        },
      ),
    );
  }
}
