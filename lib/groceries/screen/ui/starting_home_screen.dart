import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/screen/ui/account_screen.dart';
import 'package:online_groceries/groceries/screen/ui/explore_screen.dart';
import 'package:online_groceries/groceries/screen/ui/favorite_screen.dart';
import 'package:online_groceries/groceries/screen/ui/home_screen.dart';
import 'package:online_groceries/groceries/screen/ui/my_cart_screen.dart';
import 'package:online_groceries/groceries/shared/const/string_const.dart';

class StartingHomeScreen extends StatefulWidget {
  const StartingHomeScreen({super.key});

  @override
  State<StartingHomeScreen> createState() => _StartingHomeScreenState();
}

class _StartingHomeScreenState extends State<StartingHomeScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const MyCartScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        currentIndex: currentTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify,color: Colors.blue,),
            label: StringConst.welcomeScreenShop,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_sharp,color: Colors.blue,),
            label: StringConst.welcomeScreenExplore,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,color: Colors.blue,),
            label: StringConst.welcomeScreenCart,
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart,color: Colors.blue,),
            label: StringConst.welcomeScreenFavourite,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity,color: Colors.blue,),
            label: StringConst.welcomeScreenAccount,
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
      ),
    );
  }
}
