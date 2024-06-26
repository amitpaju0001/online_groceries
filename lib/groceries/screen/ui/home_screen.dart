import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/shared/const/string_const.dart';
import 'package:online_groceries/groceries/shared/model/network_image_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    NetworkImageModel.imageUrl1,
    NetworkImageModel.imageUrl2,
    NetworkImageModel.imageUrl3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(
          NetworkImageModel.imageAppBar,
          height: 20,
          width: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ListTile(
                contentPadding: EdgeInsets.only(left: 86),
                leading: Icon(Icons.location_on),
                title: Text(
                    StringConst.homeScreenApp,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.blueAccent)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    prefixIcon: const Icon(Icons.search),
                    hintText: StringConst.homeScreenHint),
              ),
              CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index, pageIndex) {
                  String imageUrl = imageList[index];
                  return Image.network(imageUrl);
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.2,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
              ),
              const ListTile(
                title: Text(StringConst.homeScreenOffer),
                trailing: Text(
                  StringConst.homeScreenSeeAll,
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageBanana,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenBananas),
                            subtitle: Text(
                              StringConst.homeScreenPcs,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageApple,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenApple),
                            subtitle: Text(StringConst.homeScreenApplePrice,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageOrange,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenOrange),
                            subtitle: Text(
                              StringConst.homeScreenApplePrice,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ListTile(
                title: Text(StringConst.homeScreenSell),
                trailing: Text(
                  StringConst.homeScreenSeeAll,
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                           NetworkImageModel.imageRedChili,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenChilli),
                            subtitle: Text(
                              StringConst.homeScreenApplePrice,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageGinger,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenGinger),
                            subtitle: Text(
                              StringConst.homeScreenApplePrice,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageTomato,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenTomato),
                            subtitle: Text(
                              StringConst.homeScreenApplePrice,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ListTile(
                title: Text(StringConst.homeScreenGroceries),
                trailing: Text(
                  StringConst.homeScreenSeeAll,
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.orange.shade50),
                      child: Row(
                        children: [
                          Image.network(
                            NetworkImageModel.imagePulses
                          ),
                          const Text(StringConst.homeScreenPulses),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green.shade50),
                      child: Row(
                        children: [
                          Image.network(
                            NetworkImageModel.imageRice
                              ),
                          const Text(StringConst.homeScreenRice),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageBeefBone,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenBone),
                            subtitle: Text(
                              StringConst.homeScreenApplePrice,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageBroilerChicken,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenBroiler),
                            subtitle: Text(
                              StringConst.homeScreenApplePrice,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            NetworkImageModel.imageEggs,
                            width: 72,
                            height: 80,
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenEggs),
                            subtitle: Text(
                              StringConst.homeScreenPcs,
                            ),
                          ),
                          const ListTile(
                            title: Text(StringConst.homeScreenPrice),
                            trailing: Icon(
                              Icons.add_box_rounded,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
