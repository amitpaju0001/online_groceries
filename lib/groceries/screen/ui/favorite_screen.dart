import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/shared/model/favourite_item_model.dart';
import 'package:online_groceries/groceries/shared/model/network_image_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<FavouriteItem> favouriteItems = [
    FavouriteItem(
      name: 'Sprite Can',
      size: '325ml',
      price: '\$1.50',
      imageUrl: NetworkImageModel.imageFavouriteSprite,
    ),
    FavouriteItem(
      name: 'Diet Coke',
      size: '355ml',
      price: '\$1.99',
      imageUrl: NetworkImageModel.imageFavouriteDietCock,
    ),
    FavouriteItem(
      name: 'Apple & Grape Juice',
      size: '2L',
      price: '\$15.50',
      imageUrl: NetworkImageModel.imageFavouritejuice,
    ),
    FavouriteItem(
      name: 'Coca Cola Can',
      size: '325ml',
      price: '\$4.99',
      imageUrl: NetworkImageModel.imageFavouriteCocaCola,
    ),
    FavouriteItem(
      name: 'Pepsi Can',
      size: '330ml',
      price: '\$4.99',
      imageUrl: NetworkImageModel.imageFavouritePepsi,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: ListView.separated(
        itemCount: favouriteItems.length,
        itemBuilder: (context, index) {
          final item = favouriteItems[index];
          return ListTile(
            leading: Image.network(
              item.imageUrl,
              width: 40,
              height: 40,
            ),
            title: Text(item.name),
            subtitle: Text('${item.size}, Price'),
            trailing: Text(item.price),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Add All To Cart'),
        ),
      ),
    );
  }
}
