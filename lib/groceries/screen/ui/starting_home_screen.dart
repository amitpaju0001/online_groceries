import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.shopify),
            label: StringConst.welcomeScreenShop,
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.manage_search_sharp),
            label: StringConst.welcomeScreenExplore,
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart),
            label: StringConst.welcomeScreenCart,
          ),
          CurvedNavigationBarItem(
            child: Icon(CupertinoIcons.heart),
            label: StringConst.welcomeScreenFavourite,
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: StringConst.welcomeScreenAccount,
          ),
        ],
        index: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
      ),
    );
  }
}
