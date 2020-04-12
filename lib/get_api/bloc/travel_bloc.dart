import 'package:flutter/material.dart';

class TravelBloc extends ChangeNotifier {
  List _travelApi = [];
  List get travelApi => _travelApi;
  set travelApi (List value) {
    _travelApi = value;
    notifyListeners();
  }
}