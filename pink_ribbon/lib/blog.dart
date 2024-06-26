import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pink_ribbon/main.dart';

class BlogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOGS'),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: MyDrawer(
        onTap: (ctx, i) {
          Navigator.pop(ctx);
          Navigator.pushAndRemoveUntil(
            ctx,
            MaterialPageRoute(builder: (ctx) => MyApp()),
            (route) => false,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.pink[100],
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 16),
            BlogPost(
              imageUrl: 'images/blog1.png',
              description:
                  '“When I was going through my cancer treatment I was shocked at the lack of services for BME patients.”',
            ),
            BlogPost(
              imageUrl: 'images/blog2.png',
              description:
                  'Can cannabis products stop breast cancer from returning? We take a look beyond the headlines',
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.instagram),
                    color: Colors.pink,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    color: Colors.pink,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    color: Colors.pink,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.youtube),
                    color: Colors.pink,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.pinterest),
                    color: Colors.pink,
                    onPressed: () {},
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

class BlogPost extends StatelessWidget {
  final String imageUrl;
  final String description;

  BlogPost({required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(imageUrl),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Tap to Discover',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
