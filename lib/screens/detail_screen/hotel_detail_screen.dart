import 'dart:async';
import 'dart:convert';
import 'package:bmc_guide/get_api/bloc/travel_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HotelHome extends StatefulWidget {
  @override
  _HotelHomeState createState() => _HotelHomeState();
}

class _HotelHomeState extends State<HotelHome> {
  StreamController<TravelApi> streamController;
  List<TravelApi> list = [];

  @override
  void initState() {
    // TODO: implement initState
    streamController = StreamController.broadcast();
    streamController.stream.listen((p) => setState(() => list.add(p)));
    Load(streamController);

  }

  Load(StreamController sc) async {
    String url = 'https://bmc.guide.siqware.com/api/travel-api';
    var client =new http.Client();
    var req = new http.Request('get', Uri.parse(url));
    var streamRes = await client.send(req);
    streamRes.stream.transform(utf8.decoder).transform(json.decoder).expand((element) => element).map((map) => TravelApi.fromJsonMap(map)).pipe(streamController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamController?.close();
    streamController = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Api'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            print(index);
            return _makeElement(index);
          },
        ),
      ),
    );
  }
  Widget _makeElement(int index){
    if(index >= list.length){
      return CircularProgressIndicator();
    }

    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Text(list[index].title),
          Image.network(list[index].thumbnail)
        ],
      ),
    );
  }

}

class TravelApi {
  int id;
  String title;
  String thumbnail;
  String description;
  String location;
  String locationUrl;
  String category;
  bool status;
  int views;
  dynamic gallery;
  String createdAt;

  TravelApi.fromJsonMap(Map map) :
        title = map['title'],
        thumbnail = map['thumbnail'];
}