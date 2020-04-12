import 'dart:async';
import 'dart:convert';
import 'package:bmc_guide/get_api/bloc/restaurant_bloc.dart';
import 'package:bmc_guide/get_api/bloc/travel_bloc.dart';
import 'package:bmc_guide/get_api/models/data_api.dart';
import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:bmc_guide/screens/welcome_screens/welcome_header.dart';
import 'package:bmc_guide/screens/welcome_screens/welcome_quick_actions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

final List<DataApi> travel = [];
final List<DataApi> restaurant = [];

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  StreamController<DataApi> streamControllerTra = StreamController.broadcast();
  StreamController<DataApi> streamControllerRes = StreamController.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    streamControllerTra.stream.listen((data) => setState(() => travel.add(data)));
    streamControllerRes.stream.listen((data) => setState(() => restaurant.add(data)));
    Load(streamControllerTra, 'travel-api');
    Load(streamControllerRes, 'restaurant-api');
  }

  Load(StreamController<DataApi> sc, String api) async {
    String url = 'https://bmc.guide.siqware.com/api/'+ api;
    var client =new http.Client();
    var req = new http.Request('get', Uri.parse(url));
    var streamRes = await client.send(req);
    streamRes.stream.transform(utf8.decoder).transform(json.decoder).expand((element) => element).map((map) => DataApi.fromJsonMap(map)).pipe(sc);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamControllerTra?.close();
    streamControllerRes?.close();
//    streamControllerTra = null;
//    streamControllerRes = null;
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TravelBloc()),
        ChangeNotifierProvider(create: (_) => RestaurantBloc()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'BMC Guide',
        home: WelcomeScreenPage(),
      ),
    );
  }
}

class WelcomeScreenPage extends StatefulWidget {
  @override
  _WelcomeScreenPageState createState() => _WelcomeScreenPageState();
}

class _WelcomeScreenPageState extends State<WelcomeScreenPage> {

  @override
  Widget build(BuildContext context) {
    final TravelBloc travelBloc = Provider.of<TravelBloc>(context);
    if(travelBloc.travelApi.length == 0){
      travelBloc.travelApi = travel;
      travel.clear();
    }
    final RestaurantBloc restaurantBloc = Provider.of<RestaurantBloc>(context);
    if(restaurantBloc.restaurantApi.length == 0){
      restaurantBloc.restaurantApi = restaurant;
      restaurant.clear();
    }

    return Scaffold(
      drawer: DrawerNavigation(),
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
              0.6
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
        ),
        title: Text(
            "BMC Guide",
            style: TextStyle(
                fontFamily: 'TimeBurner',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 25.0,
                letterSpacing: 1.0
            )
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          WelcomeHeader(),
          QuickActions(),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: <Widget>[
                WelcomeList(
                  icon: Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  title: 'Popular Place',
                  subtitle: 'Explore popular place',
                ),
                SizedBox(
                  height: 10,
                ),
                WelcomeList(
                  icon: Icon(Icons.restaurant, color: Colors.white),
                  title: 'Popular Resturant/Coffee',
                  subtitle: 'Find your favorite',
                ),
                SizedBox(
                  height: 10,
                ),
                WelcomeList(
                  icon: Icon(Icons.explore, color: Colors.white),
                  title: 'Blog',
                  subtitle: 'Visit the blogs',
                ),
              ],
            ),
          ),
          homeScreenBottom
        ],
      ),
    );
  }
}

//list
class WelcomeList extends StatefulWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  WelcomeList({Key key, this.icon, this.title, this.subtitle})
      : super(key: key);

  @override
  _WelcomeListState createState() => _WelcomeListState();
}

class _WelcomeListState extends State<WelcomeList> {
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD1DCFF),
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF00A2E3),
                  ),
                  child: widget.icon,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF00A2E3),
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xFF00A2E3),
            )
          ],
        ),
      ),
    );
  }
}

//card
final Widget homeScreenBottom = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("Our Main Sponsors",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          Spacer(),
          Builder(
              builder: (BuildContext context) => Text(
                    "Add Sponsor",
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ))
        ],
      ),
    ),
    Container(
      height: 210,
      child: ListView(scrollDirection: Axis.horizontal, children: sponsorCards),
    )
  ],
);
List<SponsorCard> sponsorCards = [
  SponsorCard("assets/images/yeac.png"),
  SponsorCard("assets/images/giz.png"),
  SponsorCard("assets/images/ABA-CAO-LP-KH.jpg"),
  SponsorCard("assets/images/aba_payment_card_banner_kh.jpg"),
  SponsorCard("assets/images/Fixed-Deposit-KH-3.jpg"),
];

class SponsorCard extends StatefulWidget {
  final String imagePath;
  SponsorCard(this.imagePath);

  @override
  _SponsorCardState createState() => _SponsorCardState();
}

class _SponsorCardState extends State<SponsorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ClipRRect(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(widget.imagePath),
              ),
              // child: PNetworkImage(
              //   imagePath,
              //   fit: BoxFit.cover,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class PNetworkImage extends StatefulWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const PNetworkImage(this.image, {Key key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  _PNetworkImageState createState() => _PNetworkImageState();
}

class _PNetworkImageState extends State<PNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.image,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/placeholder.jpg',
        fit: BoxFit.cover,
      ),
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
    );
  }
}
