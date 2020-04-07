import 'dart:async';
import 'dart:convert';

import 'package:bmc_guide/screens/maps/Service.dart';
import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:bmc_guide/helpers/map_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

String _travelUrl = 'https://bmc.guide.siqware.com/api/travel-api';
List travelApi = [];

String cover;

class TravelLocation extends StatefulWidget {
  @override
  _TravelLocationState createState() => _TravelLocationState();
}

class _TravelLocationState extends State<TravelLocation> {
  Future<String> getTravelApi() async {
    http.Response response = await http.get(_travelUrl);
    this.setState(() {
      travelApi = json.decode(response.body);
    });
    return 'Ok';
  }

  final List<Marker> markers = [];
  final Completer<GoogleMapController> _mapController = Completer();

  @override
  void initState() {
    super.initState();
    getTravelApi().then((value) {
      print(travelApi[0]['id']);
      for (var i = 0; i < travelApi.length; i++) {
        _markerLocations.add(
          MarkerData(
              locationImage:
                  'https://image.flaticon.com/icons/png/128/2230/2230606.png',
              locationName: 'ផ្សារហ៊ុយឡេង បន្ទាយមានជ័យ',
              position: LatLng(13.4895705, 102.8770725)),
        );
      }
      _initMarkers();
    });
  }

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = Set();

  /// Current map zoom. Initial zoom will be 15, street level
  double _currentZoom = 9.5;

  /// Map loading flag
  bool _isMapLoading = true;

  /// Markers loading flag
  bool _areMarkersLoading = true;

  /// Example marker coordinates
  final List<MarkerData> _markerLocations = [];

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.
  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
    setState(() {
      _isMapLoading = false;
    });
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers() async {
    for (MarkerData markerLocation in _markerLocations) {
      final BitmapDescriptor markerImage =
          await MapHelper.getMarkerImageFromUrl(markerLocation.locationImage);

      markers.add(Marker(
        markerId: MarkerId(_markerLocations.indexOf(markerLocation).toString()),
        position: markerLocation.position,
        infoWindow: InfoWindow(
            title: markerLocation.locationName,
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ServiceWelcome())),
            snippet: 'Click to see more info'),
//              icon: markerImage
      ));
    }
    setState(() {
      _areMarkersLoading = false;
    });
  }

  /// Gets the markers and clusters to be displayed on the map for the current zoom level and
  /// updates state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Locations'),
      ),
      body: Stack(
        children: <Widget>[
          // Google Map widget
          Opacity(
            opacity: _isMapLoading ? 0 : 1,
            child: GoogleMap(
              compassEnabled: true,
              mapToolbarEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(13.706879, 103.046504),
                zoom: _currentZoom,
              ),
              markers: Set.from(markers),
              onMapCreated: (controller) => _onMapCreated(controller),
              onTap: (latlang) {
                _markers.clear();
              },
            ),
          ),

          // Map loading indicator
          Opacity(
            opacity: _isMapLoading ? 1 : 0,
            child: Center(child: CircularProgressIndicator()),
          ),

          // Map markers loading indicator
          if (_areMarkersLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 2,
                  color: Colors.grey.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'Loading',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MarkerData {
  String locationName, locationImage;
  LatLng position;

  MarkerData({this.locationName, this.locationImage, this.position});
}
