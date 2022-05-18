import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/Network%20Controller/ServicesController.dart';
import 'package:grocery/Network%20Controller/getBanners.dart';
import 'package:grocery/screens/product_details/favourite_toggle_icon_widget.dart';

import '../../Constants/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List banner2 = [];
  int activeIndex = 0;
  List banner1 = [];
  List servicesList = [];

  getBanners() async {
    banner1 = await getBannerList1();
    banner2 = await getBannerList2();
    servicesList = await getServices();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('My Bookings'),
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: profileImg,
                          height: 50,
                          width: 50,
                        ),
                        title: const Text('Welcome - DEEPAK'),
                        subtitle: Text(
                          'Balance - 15.00 ',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Welcome to fusion and start your journey',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                banner1.length == 0
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 200,
                              viewportFraction: 1,
                              autoPlay: true,
                              onPageChanged: (index, reason) =>
                                  setState(() => activeIndex = index),
                            ),
                            itemCount: banner1.length,
                            itemBuilder: (context, index, realIndex) {
                              final urlImage = banner1[index];

                              return buildurlImage(urlImage, index);
                            },
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    Text(
                      'Popular Services',
                      style: TextStyle(
                        fontFamily: "workSans",
                        color: Colors.grey[850],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6)),
                Container(
                  // margin: EdgeInsets.symmetric(vertical: 4,horizontal: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1))),
                  height: 210,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: servicesList.length,
                    itemBuilder: (c, i) {
                      var data = servicesList[i];
                      return MyArticles1(
                        data['photo'],
                        data['rating'],
                        data['no'],
                        data['name'],
                        data['cost'],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                banner2.length == 0
                    ? Container()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 180,
                              viewportFraction: 1,
                              autoPlay: true,
                            ),
                            itemCount: banner2.length,
                            itemBuilder: (context, index, realIndex) {
                              final urlImage = banner2[index];

                              return buildUrlImage2(urlImage, index);
                            },
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                    Text(
                      'Our Brands',
                      style: TextStyle(
                        fontFamily: "workSans",
                        color: Colors.grey[850],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6)),
                Container(
                  // margin: EdgeInsets.symmetric(vertical: 4,horizontal: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(1))),
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyArticles2("https://attolinfra.com/fusion/images/1.jpg"),
                      MyArticles2("https://attolinfra.com/fusion/images/2.jpg"),
                      MyArticles2("https://attolinfra.com/fusion/images/3.jpg"),
                      MyArticles2("https://attolinfra.com/fusion/images/4.jpg"),
                      MyArticles2("https://attolinfra.com/fusion/images/5.jpg"),
                      MyArticles2("https://attolinfra.com/fusion/images/6.jpg"),
                      MyArticles2("https://attolinfra.com/fusion/images/7.jpg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildurlImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: CachedNetworkImage(
          imageUrl: urlImage,
          fit: BoxFit.cover,
        ),
      );

  Widget buildUrlImage2(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: CachedNetworkImage(
          imageUrl: urlImage,
          fit: BoxFit.cover,
        ),
      );

  Container MyArticles2(String imageVal) {
    return Container(
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Wrap(
          children: [
            Image.network(imageVal),
          ],
        ),
      ),
    );
  }

  Container MyArticles1(String imageVal, rating, totalRating, name, amount) {
    return Container(
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imageVal,
              height: 140,
              fit: BoxFit.fitWidth,
            ),
            sbh(3),
            Container(
              padding: EdgeInsets.all(3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.orangeAccent,
                      ),
                      sbw(5),
                      Text(
                        rating,
                        style: TextStyle(color: Colors.orangeAccent),
                      ),
                      sbw(5),
                      Text(
                        "($totalRating)",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      FavoriteToggleIcon(),
                    ],
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'From \$$amount',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
