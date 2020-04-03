
import 'package:bmc_guide/page/main_page.dart';
import 'package:bmc_guide/screens/about/about.dart';
import 'package:bmc_guide/screens/contact/contact.dart';
import 'package:bmc_guide/screens/welcome_screens/welcome_screen.dart';
import 'package:flutter/material.dart';

List<dynamic> drawerItem = [
  {
    'asset':'assets/images/map.png',
    'name':'Direction'
  },
  {
    'asset':'assets/images/map.png',
    'name':'Hotel'
  },
  {
    'asset':'assets/images/dish.png',
    'name':'Restaurant'
  },
  {
    'asset':'assets/images/map.png',
    'name':'Gallary'
  }
];

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80.0,
            child: DrawerHeader(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => WelcomeScreen()));
                  },
                  child: Text('BMC Guide', style: TextStyle(
                    color: Colors.white, fontFamily: 'Lobster', fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: <Color>[
              //7928D1
              const Color(0xFF0075D1),
              const Color(0xFF00A2E3),
            ], stops: <double>[
              0.3,
              0.8
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(10.0)
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => MainPage(2)));
            },
          ),
          ListTile(
            leading: Icon(Icons.place),
            title: Text('Place Travel'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => MainPage(0)));
            },
          ),ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Restaurant'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => MainPage(3)));
            },
          ),ListTile(
            leading: Icon(Icons.hotel),
            title: Text('Hotel'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => MainPage(1)));
            },
          ),ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contact'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => Contact()));
            },
          ),ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => About()));
            },
          ),
        ],
      ),
    );
  }
}
