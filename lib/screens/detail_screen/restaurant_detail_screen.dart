import 'package:bmc_guide/helpers/item_card.dart';
import 'package:flutter/material.dart';

List<ItemCard> itemCard = [
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
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

String cover;
class RestaurantHome extends StatelessWidget {
  static final String path = "lib/src/pages/travel/travel_home.dart";

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
        title: Text('Restaurant & Coffee', style: TextStyle(fontFamily: 'Lobster'),),
      ),
      body: ListView(
        children: <Widget>[HomeScreenTop(), homeScreenBottom],
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
            height: 250,
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
                SizedBox(
                  height: 20,
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

final Widget homeScreenBottom = Column(
  children: <Widget>[
    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     children: <Widget>[
    //       // Text('Hotel Place',
    //       //   style: TextStyle(
    //       //     color: Colors.black87,
    //       //     fontSize: 15,
    //       //     fontWeight: FontWeight.w700
    //       //   )
    //       // ),
    //       // Spacer(),
    //       // Builder(
    //       //   builder: (BuildContext context) => GestureDetector(
    //       //     onTap: (){

    //       //     },
    //       //     child: Text(
    //       //     "View All",
    //       //     style: TextStyle(
    //       //       fontSize: 14, color: Theme.of(context).primaryColor
    //       //     ),
    //       //   ),
    //       //   )
    //       // ),
    //       // Padding(padding: const EdgeInsets.only(bottom: 40))
    //     ],
    //   ),
    // ),

    Container(
      height: 210,
      child: ListView(scrollDirection: Axis.horizontal, children: itemCard),
    ),
    Padding(padding: const EdgeInsets.only(bottom: 40))
  ],
);
