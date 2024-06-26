
import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/shared/model/network_image_model.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Find Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  hintText: 'Search Store',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.green.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreFruit,width: 120,height: 140,),
                       Padding(
                         padding: const EdgeInsets.only(left: 32),
                         child: Text('Fresh Fruits & Vegetables',style: TextStyle(
                             fontSize: 16,fontWeight: FontWeight.bold
                         ),),
                       ),

                      ],
                    ),
                  ),
                  SizedBox(width: 18,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orange.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreOil,width: 120,height: 140,),
                        SizedBox(height: 24,),
                        Text('Cooking Oil & Ghee',style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.deepOrange.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreMeat,width: 120,height: 140,),
                        SizedBox(height: 28,),
                        Text(' Meat & fish',style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 18,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.purple.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreBakery,width: 120,height: 140,),
                        SizedBox(height: 28,),
                        Text('Bakery & Snacks',style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.yellow.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreDairy,width: 120,height: 140,),
                        SizedBox(height: 28,),
                        Text(' Dairy & Eggs',style: TextStyle(
                             fontSize: 16,fontWeight: FontWeight.bold
                         ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 18,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreBeverages,width: 120,height: 140,),
                        SizedBox(height: 28,),
                         Text('Beverages',style: TextStyle(
                             fontSize: 16,fontWeight: FontWeight.bold
                         ),),

                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.purple.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreChips,width: 120,height: 140,),
                        SizedBox(height: 28,),
                        Text(' Chips & kurkure',style: TextStyle(
                               fontSize: 16,fontWeight: FontWeight.bold
                           ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 18,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.42,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orange.shade50
                    ),
                    child: Column(
                      children: [
                        Image.network(NetworkImageModel.imageExploreFastFood,width: 120,height: 140,),
                        SizedBox(height: 28,),
                        Text('Fast Food',style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.bold
                        ),),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}