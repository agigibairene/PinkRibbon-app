import 'package:flutter/material.dart';
import 'package:pink_ribbon/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HealthyLiving extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(width: 10),
            Text(
              'HEALTHY LIVING',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.pink),
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
            Container(
              color: Colors.pink[100],
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pink Ribbon',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                        ),
                      ),
                      Text(
                        'Breast health is in your hands.\nStay vigilant, stay informed!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildSection(
                title: 'EXERCISE',
                imageUrl: 'images/health-living1.png.png',
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
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Image.asset(imageUrl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Tap to Discover',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
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
        child: Text(
          'LOAD MORE',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
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
            icon: Icon(Icons.facebook),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.twitter),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.instagram),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.youtube),
            color: Colors.pink,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.pinterest),
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
