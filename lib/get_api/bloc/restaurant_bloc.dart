import 'package:flutter/material.dart';

class RestaurantBloc extends ChangeNotifier {
  List _restaurantApi = [];
  List get restaurantApi => _restaurantApi;
  set restaurantApi (List value) {
    _restaurantApi = value;
    notifyListeners();
  }
}