import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_groceries/auth/model/user_model.dart';
import 'package:online_groceries/auth/provider/custom_auth_provider.dart';
import 'package:online_groceries/auth/ui/forgot_password_screen.dart';
import 'package:online_groceries/auth/ui/register_screen.dart';
import 'package:online_groceries/groceries/screen/ui/starting_home_screen.dart';
import 'package:online_groceries/groceries/shared/model/network_image_model.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      body: Consumer<CustomAuthProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
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
                            'Log in',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
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
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ForgotPasswordScreen();
                              },
                            ),
                          );
                        },
                        child: const Text('Forgot password?'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            UserModel userModel = UserModel(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            CustomAuthProvider provider =
                            Provider.of<CustomAuthProvider>(context, listen: false);
                            await provider.login(userModel);
                            if (!provider.isError) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StartingHomeScreen(),
                                ),
                              );
                            }
                          } else {
                           Fluttertoast.showToast(msg: 'login failed');
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          CustomAuthProvider provider =
                          Provider.of<CustomAuthProvider>(context, listen: false);
                          await provider.googleLogin();
                          if (!provider.isError) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StartingHomeScreen(),
                              ),
                            );
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.google, size: 20),
                            SizedBox(width: 5),
                            Text(
                              'Google Login',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            ),
                          );
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
          );
        },
      ),
    );
  }
}
