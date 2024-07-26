import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pink_ribbon/services/authentication.dart';
import './about_us.dart';
import './community.dart';
import 'package:pink_ribbon/contact.dart';
import 'package:pink_ribbon/emergency.dart';
import 'package:pink_ribbon/institutions.dart';
import 'package:pink_ribbon/login.dart';
import 'package:pink_ribbon/medication.dart';
import 'package:pink_ribbon/self_examination.dart';
import 'package:pink_ribbon/health_living.dart';
import 'package:pink_ribbon/blog.dart';
import 'package:firebase_core/firebase_core.dart';
import './first_page.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  await Future.delayed(
    const Duration(seconds: 2),
  );
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> list = [
    const HomePage(),
    const AboutUs(),
    const Contacts(),
    const SelfExamination(),
    const HealthyLiving(),
    const BlogScreen(),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading indicator while waiting for the authentication state.
          } else if (snapshot.hasData) {
            return MainPage(
              onTap: (ctx, i) {
                setState(() {
                  index = i;
                });
                Navigator.pop(ctx); // Close the drawer
              },
              currentIndex: index,
              child: list[index],
            );
          } else {
            return const FirstPage();
          }
        },
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/faq': (context) => const FAQScreen(),
        '/emergency': (context) => const EmergencyScreen(),
        '/institutions': (context) => const InstitutionsScreen(),
        '/medication': (context) => const MedicationScreen(),
        '/community': (context) => const CommunityScreen(),
        '/health-living': (context) => const HealthyLiving(),
        '/about-us': (context) => const AboutUs(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  final Function(BuildContext, int) onTap;
  final int currentIndex;
  final Widget child;

  const MainPage({
    required this.onTap,
    required this.currentIndex,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 0
          ? AppBar(
              title: const Text('Home',
                  style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            )
          : null,
      body: child,
      drawer: MyDrawer(onTap: onTap, username: '', userEmail: ''),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  const MyDrawer({
    super.key,
    required this.onTap,
    required String username,
    required String userEmail,
  });

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String username = user?.displayName ?? 'User';
    final String userEmail = user?.email ?? 'user@gmail.com';

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.pink,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                          child: Icon(
                        Icons.account_circle_sharp,
                        size: 60,
                        color: Colors.pink,
                      )),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      username,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Flexible(
                      child: Text(
                        userEmail,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.pink),
              title: const Text('Home'),
              onTap: () => onTap(context, 0),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.healing_outlined, color: Colors.pink),
              title: const Text('Self Examination'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SelfExamination();
                }));
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.library_books, color: Colors.pink),
              title: const Text('Blogs'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlogScreen();
                }));
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.contact_phone, color: Colors.pink),
              title: const Text('Contacts and Specialists'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Contacts();
                }));
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.local_florist, color: Colors.pink),
              title: const Text('Healthy Living'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return HealthyLiving();
                }));
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.pink),
              title: const Text('About Us'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AboutUs();
                }));
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.pink),
              title: const Text('Log Out'),
              onTap: () async {
                await AuthMethod().signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstPage()),
                  (route) => false,
                );
              },
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
              MaterialPageRoute(builder: (context) => const SelfExamination()),
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
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Center(
          child: Text(
            'Welcome to PinkRibbon',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.pink[100],
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
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
                    margin: const EdgeInsets.only(right: 20.0),
                    child: Image.asset(
                      'images/logo.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const Column(
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
                          'Your Breast health.',
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
              const SizedBox(height: 8),
              const Center(
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
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return GestureDetector(
                onTap: () {
                  navigateToPage(context, index);
                },
                child: Container(
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
                      const SizedBox(height: 8),
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
                ));
          }),
        ),
      ],
    );
  }
}

void navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SelfExamination()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HealthyLiving()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CommunityScreen()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HealthyLiving()),
      );
      break;
    case 4:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Contacts()),
      );
      break;
    case 5:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FAQScreen()),
      );
      break;
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
  // ignore: library_private_types_in_public_api
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 218, 65, 116),
      margin: const EdgeInsets.all(10.0),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: const TextStyle(color: Colors.black),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.answer,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
        onExpansionChanged: (bool expanded) {},
      ),
    );
  }
}
