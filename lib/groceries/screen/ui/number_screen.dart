import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/screen/ui/verification_screen.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  bool _navigate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enter your mobile number',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    prefixText: '+91',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length > 10) {
                      return 'Phone number cannot exceed 10 digits';
                    }
                    if (value.length < 10) {
                      return 'Please enter 10 digits';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _navigate = _formKey.currentState?.validate() ?? false;
                    });
                  },
                ),
                const Divider(height: 1, thickness: 1.0),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          shape: const CircleBorder(),
          onPressed: _navigate
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationScreen(),
                    ),
                  );
                }
              : null,
          child: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
