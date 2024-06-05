import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PinkRibbon',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PinkRibbon'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
            // Add your onPressed code here!
          },
        ),
      ),
      body: const HomePageContent(),
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
  const HomePageContent({super.key});

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
          const SizedBox(height: 20),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                InfoCard(title: 'Welcome Page'),
                InfoCard(title: 'Self Exam'),
                InfoCard(title: 'SIGN IN'),
              ],
            ),
          ),
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
          const SizedBox(height: 20),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://example.com/breast_cancer_awareness.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Positioned(
                bottom: 10,
                left: 10,
                child: Chip(
                  label: Text('Awareness Campaign'),
                  backgroundColor: Colors.pink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(4, (index) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.pink[100 * (index + 2)],
                child: Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;

  const InfoCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.pink[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
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
        title: const Text('FAQs'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pushNamed(context, '/menu');
            // Add your onPressed code here!
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 38.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ],
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
                        'Yes, self scanning is sufficient as the sole way to detect breast cancer.<br>However, if you do not have access to a scanner, you may need to use a different method to detect breast cancer.',
                  ),
                  FAQCard(
                    question: 'Is breast cancer genetic?',
                    answer:
                        'No, breast cancer is not genetic. It is a disease that occurs in the cells of the breast.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
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
      color: Colors.pink[100 * (index + 2)],
      margin: const EdgeInsets.all(10.0),
      child: ExpansionTile(
        title: Text(widget.question,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.answer,
                style: const TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
        onExpansionChanged: (bool expanded) {},
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const FAQScreen()),
            (route) => false,
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.square),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.circle),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.change_history), // This is the triangle icon
          label: 'Profile',
        ),
      ],
    );
  }
}

class SelfExaminationScreen extends StatelessWidget {
  const SelfExaminationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self Examination'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Add your menu item action here
            },
            itemBuilder: (BuildContext context) {
              return {'Settings', 'About'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FAQScreen()),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: const Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Self Examination Guide',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: RotatedBox(
                    quarterTurns: 4,
                    child: Icon(Icons.self_improvement,
                        size: 100, color: Colors.pink),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Steps to Perform a Self Examination:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Chip(
                  label: Text('Step 1: Look at your breasts in the mirror.'),
                  backgroundColor: Colors.pink,
                ),
                Chip(
                  label: Text('Step 2: Raise your arms and look for changes.'),
                  backgroundColor: Colors.pink,
                ),
                Chip(
                  label: Text('Step 3: Feel your breasts while lying down.'),
                  backgroundColor: Colors.pink,
                ),
                Chip(
                  label: Text(
                      'Step 4: Feel your breasts while standing or sitting.'),
                  backgroundColor: Colors.pink,
                ),
                SizedBox(height: 20),
                Text(
                  'If you notice any changes, contact your healthcare provider.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
