import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/screen/ui/sign_in_screen.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    'https://thumbs.dreamstime.com/b/vertical-portrait-attractive-young-woman-customer-holding-basket-fruits-standing-fruit-vegetables-section-pretty-grocery-232300888.jpg'),
                const SizedBox(height: 24.0),
                const Text(
                  'Welcome to Apna Grocery',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Get your groceries in as fast as one hour',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 16.0,
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
