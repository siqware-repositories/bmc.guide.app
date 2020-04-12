import 'package:bmc_guide/get_api/services/load_travel_api.dart';
import 'package:bmc_guide/helpers/detail_screen_top.dart';
import 'package:flutter/material.dart';

class TravelHome extends StatefulWidget {
  @override
  _TravelHomeState createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {

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
          DetailScreenTop(),
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
              LoadTravelData(),
              /*Container(
                  height: 210,
                  child: travelBloc.travelApi.length == 0 ? Container(
                    height: 10,
                    child: Text('Data loading...'),
                  ) : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: travelBloc.travelApi.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListItemCard(
                        travelBloc.travelApi[index].id,
                        travelBloc.travelApi[index].title,
                        travelBloc.travelApi[index].thumbnail,
                        travelBloc.travelApi[index].description,
                        travelBloc.travelApi[index].location,
                        travelBloc.travelApi[index].locationUrl,
                        travelBloc.travelApi[index].category,
                        travelBloc.travelApi[index].status,
                        travelBloc.travelApi[index].views,
                        travelBloc.travelApi[index].createdAt,
                        travelBloc.travelApi[index].gallery,
                      );
                    },
                  )
              ),*/
              Padding(padding: const EdgeInsets.only(bottom: 40))
            ],
          )],
      ),
    );
  }
}