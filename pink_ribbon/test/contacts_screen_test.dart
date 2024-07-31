import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pink_ribbon/main.dart';
import 'package:pink_ribbon/contact.dart';

void main() {
  testWidgets('Contacts screen test', (WidgetTester tester) async {
    // Build the Contacts screen widget
    await tester.pumpWidget(
      MaterialApp(
        home: Contacts(),
        routes: {
          '/emergency': (context) =>
              Scaffold(body: Center(child: Text('Emergency Page'))),
          '/institutions': (context) =>
              Scaffold(body: Center(child: Text('Institutions Page'))),
          '/medication': (context) =>
              Scaffold(body: Center(child: Text('Medication Page'))),
          '/community': (context) =>
              Scaffold(body: Center(child: Text('Community Page'))),
        },
      ),
    );

    // Verify the AppBar title
    expect(find.text('Contacts and Specialists'), findsOneWidget);

    // Verify the InfoCards
    expect(find.text('In your region'), findsOneWidget);
    expect(
        find.text(
            'This map gives you an overview of the health centers, hospitals, and hotlines around your region.'),
        findsOneWidget);

    expect(find.text('Institutions'), findsOneWidget);
    expect(
        find.text(
            'Find an overview of counselling and support health services you can engage with.'),
        findsOneWidget);

    expect(find.text('Emergency contacts'), findsOneWidget);
    expect(
        find.text(
            'List of people who can be reached in case of an emergency. You can also call them directly.'),
        findsOneWidget);

    expect(find.text('Medication management resources'), findsOneWidget);
    expect(
        find.text(
            'List of pharmacies where you can refill your prescriptions and advice at affordable prices.'),
        findsOneWidget);

    expect(find.text('Join a community'), findsOneWidget);
    expect(
        find.text(
            'Belong and connect with other like-minded people in your community. Sharing every emotion and experiences.'),
        findsOneWidget);

    // Tap on the emergency contacts card
    await tester.tap(find.text('Emergency contacts'));
    await tester.pumpAndSettle();
  });
}
