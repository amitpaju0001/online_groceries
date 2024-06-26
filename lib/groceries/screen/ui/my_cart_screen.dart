import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/shared/const/string_const.dart';
import 'package:online_groceries/groceries/shared/model/cart_items_model.dart';
import 'package:online_groceries/groceries/shared/model/network_image_model.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final List<CartItems> items = [
    CartItems(
        image: NetworkImageModel.imageCartBellPepper,
        name: 'Bell Pepper Red',
        quantity: '1kg',
        price: 4.99),
    CartItems(
        image: NetworkImageModel.imageCartEgg,
        name: 'Egg Chicken Red',
        quantity: '4pcs',
        price: 1.99),
    CartItems(
        image: NetworkImageModel.imageBanana,
        name: 'Organic Bananas',
        quantity: '1.2kg',
        price: 3.00),
    CartItems(
        image: NetworkImageModel.imageGinger,
        name: 'Ginger',
        quantity: '250gm',
        price: 2.99),
  ];

  double get totalPrice =>
      items.fold(0.0, (sum, item) => sum + (item.price * item.count));

  void incrementQuantity(int index) {
    setState(() {
      items[index].count++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (items[index].count > 1) {
        items[index].count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.cartScreenApp),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: Image.network(
                    item.image,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(item.name),
                  subtitle: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => decrementQuantity(index),
                      ),
                      Text(item.count.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => incrementQuantity(index),
                      ),
                      const SizedBox(width: 10),
                      Text(item.quantity),
                    ],
                  ),
                  trailing:
                      Text('\$${(item.price * item.count).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    StringConst.cartScreenCheckOut,
                    semanticsLabel: ('\$${totalPrice.toStringAsFixed(2)}'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
