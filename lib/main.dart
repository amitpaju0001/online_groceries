
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries/auth/provider/custom_auth_provider.dart';
import 'package:online_groceries/auth/service/auth_service.dart';
import 'package:online_groceries/auth/ui/log_in_screen.dart';
import 'package:online_groceries/core/storage_helper.dart';
import 'package:online_groceries/groceries/screen/ui/starting_home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthService());
    Get.put(StorageHelper());
    CustomAuthProvider authProvider = CustomAuthProvider();
    authProvider.loadLoginStatus();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => authProvider,)
      ],
      child: Consumer<CustomAuthProvider>(builder:(context, provider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: provider.isLoggedIn?StartingHomeScreen():LogInScreen(),
          debugShowCheckedModeBanner: false,
        );
      }
      ),
    );
  }
}
