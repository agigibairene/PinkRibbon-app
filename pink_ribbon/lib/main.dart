import 'package:flutter/material.dart';
import 'package:pink_ribbon/about_us.dart';
import 'package:pink_ribbon/community.dart';
import 'package:pink_ribbon/contact.dart';
import 'package:pink_ribbon/emergency.dart';
import 'package:pink_ribbon/institutions.dart';
import 'package:pink_ribbon/medication.dart';
import 'package:pink_ribbon/self_examination.dart';
import 'package:pink_ribbon/health_living.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> list = [
    const HomePage(),
    AboutUs(),
    const Contacts(),
    const SelfExaminationScreen(),
    HealthyLiving(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: index == 0
            ? AppBar(
                title: const Text('Home',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              )
            : null,
        body: list[index],
        drawer: MyDrawer(onTap: (ctx, i) {
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
        }),
      ),
      routes: {
        '/faq': (context) => const FAQScreen(),
        '/emergency': (context) => const EmergencyScreen(),
        '/institutions': (context) => const InstitutionsScreen(),
        '/medication': (context) => const MedicationScreen(),
        '/community': (context) => const CommunityScreen(),
        '/health-living': (context) => HealthyLiving(),
        '/about-us': (context) => AboutUs()
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  const MyDrawer({super.key, required this.onTap});

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
              onTap: () => onTap(context, 0),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SelfExaminationScreen()),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FAQScreen()),
          );
        },
        child: const Icon(Icons.question_answer),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  HomePageContent({super.key});

  final List<String> imagesURLs = [
    'images/self_examination.png',
    'images/exercise.png',
    'images/community.png',
    'images/mindfulness.png',
    'images/contacts.png',
    'images/faqhome.png',
  ];

  final List<String> titles = [
    'SELF EXAMINATION',
    'DIET AND EXERCISE',
    'COMMUNITY',
    'MINDFULNESS',
    'CONTACTS',
    'FAQS',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Welcome to PinkRibbon',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: Colors.pink[300],
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 80,
                    color: Colors.pink,
                    // Thick pink line divider
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 20.0), // Adjust the value as needed
                      child: Image.asset(
                        'images/logo.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pink Ribbon',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Breast health is in your hands.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 4,
                    width: 80,
                    color: Colors.pink,
                    // Thick pink line divider
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'WE\'RE HERE FOR YOU',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          /*
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Learn More'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Donate'),
              ),
            ],
          ),
          */
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(6, (index) {
              return Container(
                color: Colors.pink,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        child: Image.asset(
                          imagesURLs[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      titles[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQs',
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
          MaterialPageRoute(builder: (ctx) => MyApp()), // Restart the app
          (route) => false,
        );
      }),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset('images/FAQ.png', fit: BoxFit.cover),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FAQCard(
                    question:
                        'What are the benefits of early cancer detection?',
                    answer:
                        'Early detection of breast cancer can help reduce the time needed to diagnose and treat patients. Early detection can also help to reduce the spread of the disease.',
                  ),
                  FAQCard(
                    question:
                        'Is self scanning sufficient as the sole way to detect breast cancer?',
                    answer:
                        'Yes, self scanning is sufficient as the sole way to detect breast cancer.However, if you do not have access to a scanner, you may need to use a different method to detect breast cancer.',
                  ),
                  FAQCard(
                    question: 'How do I ensure I dont get breast cancer?',
                    answer:
                        'You cant change some risk factors, such as family history. But you can make lifestyle changes to lower your risk. Stay away from alcohol, get active, manage your weight are just but a few.',
                  ),
                  FAQCard(
                    question: 'Is breast cancer genetic?',
                    answer:
                        'It is important to note that most women who get breast cancer do not have a family history of the disease. But women who have close blood relatives with breast cancer have a higher risk',
                  ),
                  FAQCard(
                    question:
                        'How can I get actively involved in breast cancer journey?',
                    answer:
                        'Spread the word and talk about it with family, friends and acquaintances. Join conferences and walks, be involved.',
                  ),
                  FAQCard(
                    question: 'Can I get breast cancer after 40 years old?',
                    answer:
                        'Yes you can. Any age can get breast cancer. However, you should be aware that the rates of breast cancer increase after 40 years.',
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

class FAQCard extends StatefulWidget {
  final String question;
  final String answer;

  const FAQCard({required this.question, required this.answer, super.key});

  @override
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 218, 65, 116),
      margin: const EdgeInsets.all(10.0),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(color: Colors.black),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.answer,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        onExpansionChanged: (bool expanded) {},
      ),
    );
  }
}
