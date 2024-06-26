import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emergency Contacts',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            ContactCard(
              name: 'Breast Cancer Now',
              email: 'bcare@gmail.com',
              hotline: '0808 800 6000',
            ),
            ContactCard(
              name: 'Aga Khan ',
              email: 'khanemergency@gmail.com',
              hotline: '0808 800 5000',
            ),
            ContactCard(
              name: 'Cancer Care international',
              email: 'info@cancercareinternational.org',
              hotline: '0715 678 875',
            ),
            ContactCard(
              name: 'Lumumba Center',
              email: 'lumumba@gmail.com',
              hotline: '0809 800 6000',
            ),
            ContactCard(
              name: 'Carefree organisation',
              email: 'freeus@gmail.com',
              hotline: '0818 800 6000',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String hotline;

  const ContactCard(
      {required this.name,
      required this.email,
      required this.hotline,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Text(hotline, style: const TextStyle(color: Colors.blue)),
              onTap: () async {
                final url = Uri.parse('tel:$hotline');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            InkWell(
              child: Text(email, style: const TextStyle(color: Colors.blue)),
              onTap: () async {
                final url = Uri.parse('mailto:$email');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
        trailing: const Icon(Icons.phone, color: Colors.pink),
        onTap: () async {
          final url = Uri.parse('tel:$hotline');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            throw 'Could not launch $url';
          }
        },
      ),
    );
  }
}
