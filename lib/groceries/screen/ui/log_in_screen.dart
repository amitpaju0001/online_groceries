import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/shared/model/network_image_model.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              NetworkImageModel.imageAppBar,
              height: 20,
              width: 20,
            ),
            SizedBox(height: 32,),
            ListTile(
              title: Text('Loging',style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text('Enter your email and password'),
            ),

          ],
        ),
      ),
    );
  }
}
