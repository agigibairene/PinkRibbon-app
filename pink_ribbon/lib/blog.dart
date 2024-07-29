import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

//BlogScreen displays a list of blog posts fetched from Firestore
class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  // Fetches blog posts from Firestore
  Future<List<Map<String, dynamic>>> fetchBlogPosts() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('blogs').get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs',
            style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.pink),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: const Color(0xFFEC407A),
          ),
        ),
      ),
      drawer: MyDrawer(
        onTap: (ctx, i) {
          Navigator.pop(ctx);
          Navigator.pushAndRemoveUntil(
            ctx,
            MaterialPageRoute(builder: (ctx) => const MyApp()),
            (route) => false,
          );
        },
        username: '',
        userEmail: '',
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchBlogPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No blogs available.'));
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.pink[100],
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              right: 20.0, bottom: 40.0, left: 20.0),
                          child: Image.asset(
                            'images/logo.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                        // Wrap the Column with Expanded to adapt to available space
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Pink Ribbon',
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Breast health is in you hands.\nStay vigilant, stay informed!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...snapshot.data!.map((blogData) {
                    return BlogPost(
                      imageUrl: blogData['imageUrl'],
                      description: blogData['description'],
                      url: blogData['url'],
                    );
                  }).toList(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.instagram),
                          color: Colors.pink,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.facebook),
                          color: Colors.pink,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.twitter),
                          color: Colors.pink,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.youtube),
                          color: Colors.pink,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.pinterest),
                          color: Colors.pink,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// BlogPost widget displays an individual blog post with image, description, and a button
class BlogPost extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String url;

  const BlogPost({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.pink,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(imageUrl),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _launchURL(url),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              child: const Text(
                'Tap to Discover',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
