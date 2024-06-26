import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/screen/ui/number_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60.0),
              Image.network(
                  'https://vita-grown.com/wp-content/uploads/2020/05/fruits.png'),
              const SizedBox(height: 40.0),
              const Text(
                'Get your groceries with Apna Grocery',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NumberScreen(),
                      ));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 8.0),
                    Text(
                      '+91',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(height: 40.0, thickness: 1.0),
              const Text(
                'Or connect with social media',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                icon: const Icon(Icons.g_mobiledata, color: Colors.white),
                label: const Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  minimumSize: const Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                icon: const Icon(Icons.facebook, color: Colors.white),
                label: const Text(
                  'Continue with Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
