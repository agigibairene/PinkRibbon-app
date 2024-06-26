import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstitutionsScreen extends StatelessWidget {
  const InstitutionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counselling Services',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            ContactCard(
              name: 'Faraja Cancer Support',
              offers: 'Therapies for physical and spiritual wellbeing',
              uniqueValue: 'Therapists all over Africa',
              link: 'https://www.farajacancersupport.org/therapy/index.html',
              rating: '5.0',
            ),
            ContactCard(
              name: 'African Women’s Development Fund',
              offers: 'Provides both lectures and therapy',
              uniqueValue:
                  'Women and survivors attend this, mostly in Zimbabwe',
              link:
                  'https://awdf.org/life-and-hope-after-breast-cancer-african-women-providing-support/',
              rating: '4.5',
            ),
            ContactCard(
              name: 'CANSA\'S Online Support Resources',
              offers: 'Book resources, zoom calls, Facebook links',
              uniqueValue:
                  'All-round; you can join support group, read alone, join zoom call at your own pace',
              link:
                  'https://cansa.org.za/cansas-care-support/cansas-online-support-resources/',
              rating: '5.0',
            ),
            ContactCard(
              name: 'U-Love Community',
              offers: 'Mental health talks',
              uniqueValue:
                  'Helps with mental health issues through games, music, fun sessions',
              link: 'https://ulovecommunity.co.za/',
              rating: '4.5',
            ),
            ContactCard(
              name: 'USIU',
              offers: 'Therapies for emotional wellbeing',
              uniqueValue: 'In person meetups and an institution too',
              link:
                  'https://www.usiu.ac.ke/2010/breast-cancer-awareness-month-what-you-need-know-about/',
              rating: '4.5',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String offers;
  final String uniqueValue;
  final String link;
  final String rating;

  const ContactCard({
    required this.name,
    required this.offers,
    required this.uniqueValue,
    required this.link,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double starValue = double.parse(rating);
    int fullStars = starValue.floor();
    bool halfStar = starValue - fullStars >= 0.5;

    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
              offers,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              uniqueValue,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 10),
            InkWell(
              child: const Text(
                'Learn More',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
              onTap: () async {
                final url = Uri.parse(link);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Rating:',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(width: 5),
                Row(
                  children: List.generate(5, (index) {
                    if (index < fullStars) {
                      return const Icon(
                        Icons.star,
                        color: Colors.pink,
                      );
                    } else if (halfStar && index == fullStars) {
                      return const Icon(
                        Icons.star_half,
                        color: Colors.pink,
                      );
                    } else {
                      return const Icon(
                        Icons.star_border,
                        color: Colors.pink,
                      );
                    }
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
