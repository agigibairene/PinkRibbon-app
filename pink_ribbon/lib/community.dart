import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

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
        child: ListView(
          children: const [
            ContactCard(
              name: 'Faraja Cancer Support Trust',
              location: 'Makoyeti West, Nairobi KE',
              sessionsTime: 'Everyweek, 10.00am-12.00pm EAT',
              email: 'arwa@farajacancersupport.org',
            ),
            ContactCard(
              name: 'AmaBele Belles',
              location: 'Cape Town, South Africa',
              sessionsTime: 'Every Tuesday, 10.00am-12.00pm, 2.00pm-4.00pm CAT',
              email: 'info@amabelebelles.co.za',
            ),
            ContactCard(
              name: 'ABC-SG',
              location:
                  '1st floor, 11 Moses Majekodunmi Crescent, Utako, Abuja',
              sessionsTime: 'Saturdays, 2.00pm-4.00pm CAT',
              email: 'info@projectpinkblue.org',
            ),
            ContactCard(
              name: 'IHE',
              location: 'Algeria, Egypt, Morocco',
              sessionsTime: 'Bound to change, email to find out',
              email: 'ihe@ihe.se',
            ),
            ContactCard(
              name: 'UICC',
              location: 'Central Africa',
              sessionsTime: 'Every Tuesday and Thursday, anytime',
              email: 'uicc@email.com',
            ),
          ],
        ),
      ),
    );
  }
}

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
    Key? key,
  }) : super(key: key);

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
      ),
    );
  }
}
