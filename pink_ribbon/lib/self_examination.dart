import 'package:flutter/material.dart';

class SelfExamination extends StatelessWidget {
  const SelfExamination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 30.0), // Adjusted margin to the right of the icon
                      child: Icon(Icons.menu),
                    ),
                    
                    Text(
                      'Self Examination',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFFEC407A)),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Important Points Before Starting a Breast Self-Examination (BSE)',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              _content(context, 'a', 'images/Calendar.png',
                'Breast Self Exam should be done once a month within 2-3 days after menstruation or any day in a month by those who do not have menstruation.'
              ),
              _content(context, 'b', 'images/hand.jpg',
                'Use the pads of your three middle fingers. To check your entire breast area, start at your armpit with varying degrees of pressure by moving in a circular motion'
              ),
              _content(context, 'c', 'images/BSE-rubbing.png',
                'Move your fingers up and down your entire breast area, from your collarbone down to your breastbone and under your armpits, vice versa'
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Steps for Self Examination',
                  style: TextStyle(fontSize: 18.0, color: Color(0xFFEC407A), fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              _content(context, '1', 'images/Step-1.webp',
                'Step 1: Begin by looking at your breasts in the mirror with your shoulders straight and your arms on your hips. Here’s what you should look for: Breasts that are their usual size, shape, and color Breasts that are evenly shaped without visible distortion or swelling'
              ),
              _content(context, '2', 'images/Step-2.webp',
                'Step 2: Raise Arms and Examine Your Breasts Now, raise your arms and look for the same changes.'
              ),
              _content(context, '3', 'images/Step-1.webp',
                'Step 3: While you’re at the mirror, look for any signs of fluid coming out of one or both nipples (this could be a watery, milky, or yellow fluid or blood).'
              ),
              _content(context, '4', 'images/Step-4.webp',
                'Step 4: Feel Your Breasts for Lumps While Standing or Sitting Finally, feel your breasts while you are standing or sitting. Many women find that the easiest way to feel their breasts is when their skin is wet and slippery, so they like to do this step in the shower. Cover your entire breast, using the same hand movements.'
              ),
              _content(context, '5', 'images/Step-5.webp',
                'Step 5: Feel for Breast Lumps While Lying Down Next, check for breast lumps or abnormalities by feeling your breasts while lying down, using your right hand to feel your left breast, and then your left hand to feel your right breast. Use a firm, smooth touch with the first few finger pads of your hand, keeping the fingers flat and together.'
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, String label, String imagePath, String text) {
    return Row(
      children: [
        Container(
          width: 30.0,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.0, 
              fontWeight: FontWeight.bold,
              color: isNumeric(label) ? const Color(0xFFEC407A) : Colors.black
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath, height: 200.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

bool isNumeric(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  
  final numericRegex = RegExp(r'^-?\d+(?:\.\d+)?$');
  return numericRegex.hasMatch(value);
}
