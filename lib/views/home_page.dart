import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../data/prodduct_data.dart';
import 'my_cart_page.dart';
import 'product_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:primaryColor,
        iconTheme: const IconThemeData(color: whiteColor),
        title: const Text(
          'S W A N',
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => const MyCartPage()));
              },
              icon: const Icon(Icons.add_shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // CarouselSlider
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(10),
                  color: blueColor.withOpacity(.05),
                  height: MediaQuery.of(context).size.height * .25,
                ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .25,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                // autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),

            // Horizontal ListView
            SizedBox(
              height: 110,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                            'https://w1.pngwing.com/pngs/716/918/png-transparent-poster-shoe-sneakers-shoe-shop-sports-xtep-blue-white.png',
                          ),
                        ),
                        Text('Shoes')
                      ],
                    ),
                  );
                },
              ),
            ),

            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
              ),
              itemCount: ProductData().productData.length,
              itemBuilder: (context, index) {
                var data = ProductData().productData[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  color: blackColor.withOpacity(.05),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                                  data: data,
                                )),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: whiteColor,
                              image: DecorationImage(
                                image: NetworkImage('${data['img']}'
                                    // 'https://kdbdeals.com/wp-content/uploads/2023/08/476e5163-98ec-4d56-bc4c-f856e7066f64.jpg',
                                    ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data['brand']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Color : ${data['color']}',
                                ),
                                Text(
                                  'Amount : ${data['amount']}',
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // SizedBox(),
                                    Text(
                                      '${data['discount']}% OFF',
                                      style: const TextStyle(
                                          color: greenColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    const Icon(Icons.shopping_cart_outlined),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
