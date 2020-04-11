import 'dart:developer';

import 'package:bmc_guide/get_api/bloc/travel_bloc.dart';
import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final TravelBloc travelBloc = Provider.of<TravelBloc>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TravelBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green
        ),
        home: Text('Under developing'),
      ),
    );
  }
}