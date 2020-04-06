import 'package:bmc_guide/helpers/item_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

var raw = 
"""
<div>
      <div id="header_set">
      <h1>Header 1</h1>
      <h2>Header 2</h2>
      <h3>Header 3</h3>
      <h4>Header 4</h4>
      <h5>Header 5</h5>
      <h6>Header 6</h6>
      <hr />
      Below hr
      <b>Bold</b>
      </div>
      <h1>Demo Page</h1>
      <p>This is a <u>fantastic</u> nonexistent product that you should really really really consider buying!</p>
      <a href="https://github.com">https://github.com</a><br />
      <br />
      <h2>Pricing</h2>
      <p>Lorem ipsum <b>dolor</b> sit amet.</p>
      <center>
        This is some center text... <abbr>ABBR</abbr> and <acronym>ACRONYM</acronym>
      </center>
      <h2>The Team</h2>
      <p>There isn't <i>really</i> a team...</p>
      <h2>Installation</h2>
      <p>You <u>cannot</u> install a nonexistent product!</p>
      <h2>Don't ask me to find <em>x</em> in</h2>
      <p>log<sub>2</sub>(<em>x</em><sup>2</sup> - 6<em>x</em>) = 3 + log<sub>2</sub>(1 - <em>x</em>)</p>
      <div id="bdi_test">
        <h3><code>bdi</code> and <code>bdo</code> Test:</h3>
        <p>
        In the example below, usernames are shown along with the number of points in a contest.
        If the bdi element is not supported in the browser, the username of the Arabic user would confuse the text (the bidirectional algorithm would put the colon and the number "90" next to the word "User" rather than next to the word "points").
        </p>
        
        <ul>
         <li>User <bdi>hrefs</bdi>: 60 points</li>
         <li>User <bdi>jdoe</bdi>: 80 points</li>
         <li>User <bdi>إيان</bdi>: 90 points</li>
         <bdo dir="rtl">Swapped!</bdo>
         <bdo dir="ltr">This text will go left to right!</bdo>
         <bdo dir="rtl">With bdi: User <bdi>إيان</bdi>: 90 points</bdo>
         <bdo dir="rtl">Without bdi: User إيان: 90 points</bdo>
         <bdo dir="ltr">ltr w/ bdi: User <bdi>إيان</bdi>: 90 points</bdo>
         <bdo dir="ltr">ltr w/o bdi: User إيان: 90 points</bdo>
        </ul>
      </div>
            <div>
              <table>
              <caption>This is the table's caption</caption>
                <tr><th>Head 1<sup>*</sup></th><th>Head 2</th><th>Head 3</th></tr>
                <tr><td>Data 1</td><td>Long Data 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Data 1</td><td>Long <b>Data</b> 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Data 1</td><td>Long Data 2</td><td>Really, realllllly, long data 3</td></tr>
                <tr><td>Different 1</td><td>Different reallllllly long 2</td><td>Diff 3</td></tr>
                <tr><td colspan="2">This spans 2 columns</td><td>Normal td</td></tr>
                <tfoot>
                <tr><td>In foot 1</td><td>In foot 2</td><td>In foot long 2</td></tr>
                </tfoot>
              </table>
            </div>
            <div>Nested div</div>
            <div>
            <pre>
            jQuery("#monkey");
            </pre>
            <br />
            <p><q>This is a fancy quote</q></p>
            <br />
            <br />
            Second nested div<br />
            <figure>
            <img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" />
            <figcaption>Available on GitHub</figcaption>
            </figure>
            </div>
            <div>Third nested div</div>
          </div>
          <h1>Second header</h1>
          <h1>Third header</h1>
          <div>Fourth div</div> 
""";

String cover, title, subtitle;
var slides = [cover, cover, cover];
// var imgList;

final List<dynamic> imgList = [];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

List<ItemCard> relatedCard = [
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "ប្រាសាទកោះគេ",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
  ItemCard(
      "https://kohsantepheapdaily.com.kh/wp-content/uploads/2019/12/d87365f00eaf4dfa813c1d848539bb37-8.jpg",
      "បន្ទាយឆ្មារ",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
  ItemCard(
      "https://i.imgur.com/AWdLPAp.jpg",
      "អាង ទំពាំងថ្ម",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "ប្រាសាទកោះគេ",
      "12 Feb",
      "10",
      "500",
      '440',
      ['']
  ),
];

class AboutThisPlace extends StatefulWidget {
  AboutThisPlace(String cv, String tl, String subtl, var slides) {
    imgList.clear();
    cover = cv;
    title = tl;
    subtitle = subtl;
    imgList.addAll(slides);
    print(imgList);
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
      imgList,
      (index, i) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: CachedNetworkImageProvider(i), fit: BoxFit.cover),
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
                        image: CachedNetworkImageProvider(cover),
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
                                data: raw),
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
                                children: relatedCard,
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
