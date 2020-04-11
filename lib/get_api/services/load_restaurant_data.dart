import 'package:bmc_guide/get_api/bloc/restaurant_bloc.dart';
import 'package:bmc_guide/screens/store_api/list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadRestaurantData extends StatefulWidget {

  @override
  _LoadRestaurantDataState createState() => _LoadRestaurantDataState();
}

class _LoadRestaurantDataState extends State<LoadRestaurantData> {

  @override
  Widget build(BuildContext context) {
    final RestaurantBloc restaurantBloc = Provider.of<RestaurantBloc>(context);

    return Container(
        height: 210,
        child: restaurantBloc.restaurantApi.length != 0 ? ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: restaurantBloc.restaurantApi.length,
          itemBuilder: (BuildContext context,int index){
            return ListItemCard(
              restaurantBloc.restaurantApi[index].id,
              restaurantBloc.restaurantApi[index].title,
              restaurantBloc.restaurantApi[index].thumbnail,
              restaurantBloc.restaurantApi[index].description,
              restaurantBloc.restaurantApi[index].location,
              restaurantBloc.restaurantApi[index].locationUrl,
              restaurantBloc.restaurantApi[index].category,
              restaurantBloc.restaurantApi[index].status,
              restaurantBloc.restaurantApi[index].views,
              restaurantBloc.restaurantApi[index].createdAt,
              restaurantBloc.restaurantApi[index].gallery,
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
