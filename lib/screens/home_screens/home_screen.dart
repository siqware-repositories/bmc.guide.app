import 'package:bmc_guide/get_api/services/load_restaurant_data.dart';
import 'package:bmc_guide/get_api/services/load_travel_api.dart';
import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:bmc_guide/page/main_page.dart';
import 'package:bmc_guide/screens/home_screens/slide_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
          LoadTravelData(),
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
          LoadRestaurantData(),
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
//                  children: hotelCard
                ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}

