import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/shared/model/account_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final List<AccountModel> accountOptions = [
    AccountModel(
      icon: Icons.shopping_bag,
      title: 'Orders',
      onTap: () {},
    ),
    AccountModel(
      icon: Icons.person,
      title: 'My Details',
      onTap: () {},
    ),
    AccountModel(
      icon: Icons.location_on,
      title: 'Delivery Address',
      onTap: () {},
    ),
    AccountModel(
      icon: Icons.payment,
      title: 'Payment Methods',
      onTap: () {},
    ),
    AccountModel(
      icon: Icons.local_offer,
      title: 'Promo Cord',
      onTap: () {},
    ),
    AccountModel(
      icon: Icons.notifications,
      title: 'Notifications',
      onTap: () {},
    ),
    AccountModel(
      icon: Icons.help,
      title: 'Help',
      onTap: () {},
    ),
    AccountModel(
      icon: Icons.info,
      title: 'About',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mita Paju',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Mitapaju@gmail.com',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Column(
              children: accountOptions.map((option) {
                return ListTile(
                  leading: Icon(option.icon),
                  title: Text(option.title),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: option.onTap,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Row(children: [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 180,
                        ),
                        Text(
                          'Log Out',
                          selectionColor: Colors.green,
                        ),
                      ])),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
