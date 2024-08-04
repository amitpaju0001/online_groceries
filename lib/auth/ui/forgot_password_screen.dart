import 'package:flutter/material.dart';
import 'package:online_groceries/auth/provider/custom_auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your Email',
              ),
            ),
            Consumer<CustomAuthProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  onPressed: () {
                    provider.resetPassword(emailController.text.trim());
                  },
                  child: provider.isLoading
                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : Text('Send Link'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
