import 'dart:convert';

import 'package:bmc_guide/helpers/item_card.dart';
import 'package:bmc_guide/screens/store_api/list_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



String _travelUrl = 'https://bmc.guide.siqware.com/api/travel-api';
List travelApi = [];

String cover;

class TravelHome extends StatefulWidget {
  @override
  _TravelHomeState createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  Future<String> getTravelApi() async {
    http.Response response = await http.get(_travelUrl);
    this.setState(() {
      travelApi = json.decode(response.body);
    });
    return 'Ok';
  }
  @override
  void initState() {
    // TODO: implement
    getTravelApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: <Color>[
              //7928D1
              const Color(0xFF0075D1),
              const Color(0xFF00A2E3),
            ], stops: <double>[
              0.4,
              0.8
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
        ),
        title: Text('Trvel Place', style: TextStyle(fontFamily: 'Lobster'),),
      ),
      body: ListView(
        children: <Widget>[
          HomeScreenTop(),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Tavel List",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 210,
                child: travelApi.length != 0 ? ListView.builder(
                  itemCount: travelApi.length == null ? 0 : travelApi.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return ListItemCard(
                      travelApi[index]['id'],
                      travelApi[index]['title'],
                      travelApi[index]['thumbnail'],
                      travelApi[index]['description'],
                      travelApi[index]['location'],
                      travelApi[index]['location_url'],
                      travelApi[index]['category'],
                      travelApi[index]['status'],
                      travelApi[index]['views'],
                      travelApi[index]['created_at'],
                      travelApi[index]['gallery']['gallery_detail'],
                    );
                  },
                ) : Container(child: Center(child: Text('Data loading ...')))
              ),
              Padding(padding: const EdgeInsets.only(bottom: 40))
            ],
          )],
      ),
    );
  }
}


class HomeScreenTop extends StatefulWidget {
  @override
  _HomeScreenTopState createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<HomeScreenTop> {

  final TextStyle dropdownMenuLabel =
  TextStyle(color: Colors.white, fontSize: 16);
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);
  var selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 220,
            decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: <Color>[
              //7928D1
              const Color(0xFF0075D1),
              const Color(0xFF00A2E3),
            ], stops: <double>[
              0.2,
              0.6
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 250,
                    child: Text(
                      "Where do you want to go ?",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: TextEditingController(text: ''),
                      cursorColor: Theme.of(context).primaryColor,
                      style: dropdownMenuItem,
                      decoration: InputDecoration(
                          hintText: 'Search your place...',
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height - 53);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 14);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


