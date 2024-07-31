import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../lib/about_us.dart'; // Import the about_us.dart file

void main() {
  testWidgets('AboutUs widget test', (WidgetTester tester) async {
    // Build the AboutUs widget
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutUs(),
      ),
    );

    // Verify the AppBar title
    expect(find.text('About Us '), findsOneWidget);

    // Verify the presence of header elements
    expect(find.text('Pink Ribbon'), findsOneWidget);
    expect(
        find.text(
            'Breast health is in your hands. Stay vigilant, stay informed!'),
        findsOneWidget);
    expect(find.text('WHO WE ARE !'), findsOneWidget);

    // Verify the presence of content elements
    expect(find.text('OUR STORY'), findsOneWidget);
    expect(
        find.text(
            'At Pink ribbon, we understand the challenges faced during and after breast cancer treatment. Inspired by one of own’s stories, we find strength to empower others and practical advice through our app.'),
        findsOneWidget);
    expect(find.text('OUR CONTENT'), findsOneWidget);
    expect(
        find.text(
            'We update and review the content in our app on a weekly basis to ensure that our customers have accurate and up to date information.'),
        findsOneWidget);
    expect(find.text('OUR VALUES'), findsOneWidget);
    expect(find.text('EMPATHY\nSUPPORT\nEMPOWERMENT\nHOPE'), findsOneWidget);

    // Verify the presence of social media icons
    expect(find.byIcon(FontAwesomeIcons.instagram), findsOneWidget);
    expect(find.byIcon(Icons.facebook), findsOneWidget);
    expect(find.byIcon(FontAwesomeIcons.twitter), findsOneWidget);
    expect(find.byIcon(FontAwesomeIcons.youtube), findsOneWidget);
    expect(find.byIcon(FontAwesomeIcons.pinterest), findsOneWidget);
  });
}
