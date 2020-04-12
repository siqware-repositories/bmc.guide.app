import 'dart:async';
import 'dart:convert';
import 'package:bmc_guide/get_api/bloc/travel_bloc.dart';
import 'package:bmc_guide/screens/store_api/list_card.dart';
import 'package:http/http.dart' as http;
import 'package:bmc_guide/get_api/models/data_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadTravelData extends StatefulWidget {

  @override
  _LoadTravelDataState createState() => _LoadTravelDataState();
}

class _LoadTravelDataState extends State<LoadTravelData> {

  @override
  Widget build(BuildContext context) {
    final TravelBloc travelBloc = Provider.of<TravelBloc>(context);

    return Container(
        height: 210,
        child: travelBloc.travelApi.length != 0 ? ListView.builder(
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
            : Container(
          height: 10,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}
