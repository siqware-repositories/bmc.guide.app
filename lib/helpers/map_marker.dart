import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

/// [Fluster] can only handle markers that conform to the [Clusterable] abstract class.
///
/// You can customize this class by adding more parameters that might be needed for
/// your use case. For instance, you can pass an onTap callback or add an
/// [InfoWindow] to your marker here, then you can use the [toMarker] method to convert
/// this to a proper [Marker] that the [GoogleMap] can read.
class MapMarker extends Clusterable {
  final String id,locationName;
  final LatLng position;
  BitmapDescriptor icon;

  BuildContext context;

  MapMarker({
    @required this.id,
    @required this.position,
    @required this.locationName,
    this.icon,
    isCluster = false,
    clusterId,
    pointsSize,
    childMarkerId,
  }) : super(
          markerId: id,
          latitude: position.latitude,
          longitude: position.longitude,
          isCluster: isCluster,
          clusterId: clusterId,
          pointsSize: pointsSize,
          childMarkerId: childMarkerId,
        );
  Marker toMarker() => Marker(
        markerId: MarkerId(isCluster ? 'cl_$id' : id),
        position: LatLng(
          position.latitude,
          position.longitude,
        ),
        infoWindow: InfoWindow(title: locationName,snippet: 'Click to see more info'),
        icon: icon,
      );
}
