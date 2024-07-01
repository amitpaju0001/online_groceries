import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/screen/ui/home_screen.dart';
import 'package:online_groceries/groceries/shared/model/network_image_model.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPassword = false;
  bool navigate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding:  const EdgeInsets.only(left: 16, right: 16,top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 36),
                  Center(
                    child: Image.network(
                      NetworkImageModel.imageAppBar,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Loging',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Enter your email and password',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8,top: 16),
                    child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your Email',

                        ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          navigate = formKey.currentState?.validate() ?? false;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8,top: 16),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !isPassword,
                      decoration: InputDecoration(
                        hintText: 'Enter Your password',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(isPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          navigate = formKey.currentState?.validate() ?? false;
                        });
                      },
                    ),
                  ),
                   const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Forgot password?'),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: navigate
                          ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                      : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                      ),
                      child: const Text('Log In'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                      },
                      child: const Text(
                        'Don’t have an account? Signup',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
