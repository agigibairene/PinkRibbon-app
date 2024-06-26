import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatelessWidget {
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
          MaterialPageRoute(builder: (ctx) => MyApp()),
          (route) => false,
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            SizedBox(height: 26),
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'OUR STORY',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'At Pink ribbon, we understand the challenges faced during and after breast cancer treatment. Inspired by one of own’s stories, we find strength to empower others and practical advice through our app.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'OUR CONTENT',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'We update and review the content in our app on a weekly basis to ensure that our customers have accurate and up to date information.',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'OUR VALUES',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'EMPATHY\nSUPPORT\nEMPOWERMENT\nHOPE',
            style: TextStyle(fontSize: 16, color: Colors.white),
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

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                          child: Icon(
                        Icons.account_circle_sharp,
                        size: 60,
                        color: Colors.pink,
                      )),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'UserX',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'user@gmail.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.pink),
              title: Text('Home'),
              onTap: () => onTap(context, 0),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.healing_outlined, color: Colors.pink),
              title: Text('Self Examination'),
              onTap: () => onTap(context, 3),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.library_books, color: Colors.pink),
              title: Text('Blogs'),
              onTap: () => onTap(context, 0),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.contact_phone, color: Colors.pink),
              title: Text('Contacts and Specialists'),
              onTap: () => onTap(context, 2),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.local_florist, color: Colors.pink),
              title: Text('Healthy Living'),
              onTap: () => Navigator.pushNamed(context, '/healthy-living'),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.person, color: Colors.pink),
              title: Text('AboutUs'),
              onTap: () => onTap(context, 1),
            ),
            Divider(height: 1),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.pink),
              title: Text('Logout'),
              onTap: () => onTap(context, 0),
            ),
          ],
        ),
      ),
    );
  }
}
