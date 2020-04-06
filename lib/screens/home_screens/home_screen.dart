import 'dart:convert';
import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:bmc_guide/helpers/item_card.dart';
import 'package:bmc_guide/page/main_page.dart';
import 'package:bmc_guide/screens/home_screens/slide_header.dart';
import 'package:bmc_guide/screens/store_api/list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String cover;
String _travelUrl = 'https://bmc.guide.siqware.com/api/travel-api';
String _restaurantUrl = 'https://bmc.guide.siqware.com/api/restaurant-api';
List travelApi = [];
List restaurantApi = [];

List<ItemCard> travelPlaceCard = [
  ItemCard(
      "https://kohsantepheapdaily.com.kh/wp-content/uploads/2019/12/d87365f00eaf4dfa813c1d848539bb37-8.jpg",
      "បន្ទាយឆ្មារ",
      "12 Feb",
      "10",
      "500",
      '440',
      [
        'https://i2.wp.com/www.visitbanteaychhmar.org/wp-content/uploads/2014/12/Dharmasala-of-Banteay-Chhmar.jpg?ssl=1',
        'https://upload.wikimedia.org/wikipedia/commons/8/88/Banteay_Chhmar_Temple_Entrance.JPG',
        'https://media-cdn.tripadvisor.com/media/photo-s/13/4a/90/99/banteay-chhmar-temple.jpg'
      ]
  )
];

List<ItemCard> restaurantCard = [
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
];
List<ItemCard> hotelCard = [
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
];



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<String> getTravelApi() async {
    http.Response response = await http.get(_travelUrl);
    this.setState(() {
      travelApi = json.decode(response.body);
    });
    return 'Ok';
  }
Future<String> getRestaurantApi() async {
    http.Response response = await http.get(_restaurantUrl);
    this.setState(() {
      restaurantApi = json.decode(response.body);
    });
    return 'Ok';
  }

  @override
  void initState() {
    // TODO: implement
    getTravelApi();
    getRestaurantApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page', style: TextStyle(fontFamily: 'Lobster'),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFF00A2E3),Color(0xFF0075D1)])),
          ),
        ),
        drawer: DrawerNavigation(),
      body: ListView(
        children: <Widget>[
          SlideHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Tavel Location",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),),
                Spacer(),
                Builder(
                    builder: (BuildContext context) => FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new MainPage(0)));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: 210,
            child: ListView.builder(
              itemCount: travelApi.length == null ? 0 : travelApi.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return ListItemCard(
                    travelApi[index]['title'],
                    travelApi[index]['description'],
                    travelApi[index]['thumbnail'],
                    travelApi[index]['gallery']['gallery_detail'],
                    travelApi[index]['views']);

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Restaurant",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Builder(
                    builder: (BuildContext context) => FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new MainPage(3)));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: 210,
            child: ListView.builder(
              itemCount: restaurantApi.length == null ? 0 : restaurantApi.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return ListItemCard(
                    restaurantApi[index]['title'],
                    restaurantApi[index]['description'],
                    restaurantApi[index]['thumbnail'],
                    restaurantApi[index]['gallery']['gallery_detail'],
                    restaurantApi[index]['views']);

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Hotel",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Builder(
                    builder: (BuildContext context) => FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context) => new MainPage(1)));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            height: 210,
            child:
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: hotelCard
                ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}

