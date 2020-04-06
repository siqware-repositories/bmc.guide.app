import 'package:bmc_guide/app/plugins/p_network_image.dart';
import 'package:bmc_guide/screens/destination_screen/destination_screen.dart';
import 'package:flutter/material.dart';

class ListItemCard extends StatelessWidget {
  final String title, description, thumbnail;
  final List galleryDetail;
  final int viewer;

  ListItemCard(this.title, this.description, this.thumbnail, this.galleryDetail, this.viewer);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        child: FlatButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>
                    AboutThisPlace(
                        thumbnail, title, description, galleryDetail
                    )
                )
            );
          },
          child: Stack(
            children: <Widget>[
              Container(
                width: 160,
                height: 210,
                child: PNetworkImage(
                  thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                width: 160,
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.black12])),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                width: 145,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                        /*Text(
                          'Ok',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal),
                        ),*/
                      ],
                    ),
                    /*Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "100%",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ))*/
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
