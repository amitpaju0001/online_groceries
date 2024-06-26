import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/screen/ui/select_location_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
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
                      'Enter your - 4 digit code',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: _otpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'code',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter otp';
                    }
                    if (value.length > 4) {
                      return 'otp cannot exceed 4 digits';
                    }
                    if (value.length < 4) {
                      return 'Please enter 4 digits';
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
                      builder: (context) => const SelectLocationScreen(),
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
