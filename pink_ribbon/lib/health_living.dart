import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthyLiving extends StatelessWidget {
  const HealthyLiving({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Text(
              'Healthy Living',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.pink),
      ),
      drawer: MyDrawer(onTap: (ctx, i) {
        Navigator.pop(ctx);
        Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(builder: (ctx) => const MyApp()),
          (route) => false,
        );
      }, username: '', userEmail: '',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.pink[100],
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Container(
                    margin: const EdgeInsets.only(
                        right: 20.0, bottom: 40.0, left: 20.0),
                    child: Image.asset(
                      'images/logo.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Pink Ribbon',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Breast health is in your hands.\nStay vigilant, stay informed!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildSection(
                title: 'EXERCISE',
                imageUrl: 'images/health-living1.png',
                description:
                    'It has been scientifically proven that physical activity and exercise can significantly reduce the risk of certain types of cancer.'),
            _buildSection(
              title: 'NUTRITION',
              imageUrl: 'images/health-living2.png',
              description:
                  'Eating a healthy, balanced diet can do a lot to improve your health and prevent diseases, including some cancers.',
            ),
            _buildLoadMoreButton(),
            _buildSocialMediaIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title,
      required String description,
      required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2),
              borderRadius: BorderRadius.circular(0),
              color: Colors.pink,
            ),
            child: Column(
              children: [
                Image.asset(imageUrl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                  ),
                  child: const Text(
                    'Tap to Discover',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        ),
        child: const Text(
          'LOAD MORE',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.facebook),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.twitter),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.instagram),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.youtube),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.pinterest),
            color: Colors.pink,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
