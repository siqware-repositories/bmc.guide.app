import 'package:flutter/material.dart';

class RestaurantLocation extends StatefulWidget {
  @override
  _RestaurantLocationState createState() => _RestaurantLocationState();
}

class _RestaurantLocationState extends State<RestaurantLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant,Cafe or Hotel Location'),
      ),
    );
  }
}
