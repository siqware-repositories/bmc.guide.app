import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

int id;
String title;
String thumbnail;
String description;
String location;
String locationUrl;
String category;
bool status;
int viewer;
String createdAt;
List galleryDetail;

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class AboutThisPlace extends StatefulWidget {
  AboutThisPlace(
      int _id,
      String _title,
      String _thumbnail,
      String _description,
      String _location,
      String _locationUrl,
      String _category,
      bool _status,
      int _viewer,
      String _createdAt,
      List _galleryDetail
      ){
    id = _id;
    title = _title;
    thumbnail = _thumbnail;
    description = _description;
    location = _location;
    locationUrl = _locationUrl;
    category = _category;
    status = _status;
    viewer = _viewer;
    createdAt = _createdAt;
    galleryDetail = _galleryDetail;
  }

  @override
  _AboutThisPlaceState createState() => _AboutThisPlaceState();
}

class _AboutThisPlaceState extends State<AboutThisPlace> {
  List<dynamic> widgetList = [
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

  Size size;
  //Pages covers entire carousel
  final CarouselSlider gallerySlider = CarouselSlider(
    viewportFraction: 1.0,
    aspectRatio: 2.0,
    autoPlay: false,
    enlargeCenterPage: false,
    items: map<Widget>(
      galleryDetail,
          (index, i) {
        print(i['url']);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: CachedNetworkImageProvider(i['url']), fit: BoxFit.cover),
          ),
        );
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OrientationBuilder(
            builder: (context, orientation){
              return Stack(
                children: <Widget>[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(thumbnail),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  ListView(
                    children: <Widget>[
                      SizedBox(height: 100.0),
                      Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontFamily: 'Bokor',
                              fontWeight: FontWeight.bold
                          )
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                      Container(
                          child: Card(
                            color: Colors.black38,
                            elevation: 10,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Gallary".toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15,
                                          color: Colors.white
                                      ),
                                    ),
                                    // Text("Sort by price"),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      child: gallerySlider,
                                    )
                                  ],
                                )
                            ),
                          )
                      ),
                      Container(
                          child: Card(
                            color: Colors.black38,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min, // To make the card compact
                                children: <Widget>[
                                  Text(
                                    'About This Place',
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontFamily: 'Lobster'
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  Html(
                                      data: """ $description """),
                                  // Text(
                                  //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                  //   textAlign: TextAlign.center,
                                  //   style: TextStyle(fontSize: 16.0, color: Colors.white),
                                  // ),
                                  SizedBox(height: 24.0),
                                ],
                              ),
                            ),
                          )
                      ),
                      Container(
                          child: Card(
                            color: Colors.black38,
                            elevation: 10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // To make the card compact
                              children: <Widget>[
                                Text(
                                  'Related',
                                  style: TextStyle(
                                      fontFamily: 'Lobster',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 6.0),
                                Container(
                                  height: 210,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
//                                    children: relatedCard,
                                  ),
                                ),
                                SizedBox(height: 24.0),
                              ],
                            ),
                          )
                      ),
                      Container(
                          child: Card(
                            color: Colors.black38,
                            elevation: 10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // To make the card compact
                              children: <Widget>[
                                Text(
                                  'Todo',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontFamily: 'Lobster'
                                  ),
                                ),
                                SizedBox(height: 6.0),
                                Container(
                                  child: GridView.count(
                                    crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                                    controller:
                                    ScrollController(keepScrollOffset: false),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: widgetList.map((var value) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        elevation: 20,
                                        margin: EdgeInsets.all(5.0),
                                        child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(value['asset'], scale: 5, colorBlendMode: BlendMode.color,),
                                                Text(
                                                  value['name'],
                                                  style: TextStyle(
                                                      fontSize: 20.0, color: Colors.black),
                                                ),
                                              ],
                                            )
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(height: 24.0),
                              ],
                            ),
                          )
                      ),
                    ],
                  )
                ],
              );
            }
        )
    );
  }
}