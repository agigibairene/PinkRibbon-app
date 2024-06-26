import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ABOUT US',
          style: TextStyle(color: Colors.pink),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.pink),
      ),
      drawer: MyDrawer(onTap: (ctx, i) {
        Navigator.pop(ctx);
        Navigator.pushAndRemoveUntil(
          ctx,
          MaterialPageRoute(builder: (ctx) => const MyApp()),
          (route) => false,
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 26),
            _buildContent(),
            _buildSocialMediaIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.pink[100],
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Image.asset('images/logo.png', height: 50),
          const Text(
            'Pink Ribbon',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
          const Text(
            'Breast health is in your hands. Stay vigilant, stay informed!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          const Text(
            'WHO WE ARE !',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      color: Colors.pink,
      padding: const EdgeInsets.all(40.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                'OUR STORY',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'At Pink ribbon, we understand the challenges faced during and after breast cancer treatment. Inspired by one of own’s stories, we find strength to empower others and practical advice through our app.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                'OUR CONTENT',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'We update and review the content in our app on a weekly basis to ensure that our customers have accurate and up to date information.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                'OUR VALUES',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'EMPATHY\nSUPPORT\nEMPOWERMENT\nHOPE',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.instagram),
            color: Colors.pink,
            onPressed: () {},
          ),
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
