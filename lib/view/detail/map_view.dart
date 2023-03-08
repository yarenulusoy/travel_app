import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapView extends StatefulWidget {
  String? location;
  MapView({Key? key,required this.location}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition? _kInitialPosition;
  late LatLng _kMapCenter;
  void initState() {
    // TODO: implement initState
    super.initState();
    adres();
  }

  Future adres() async{
    List<Location> adress = await locationFromAddress(widget.location!);
    _kMapCenter=LatLng(adress.first.latitude, adress.first.longitude);
    _kInitialPosition=CameraPosition(target: _kMapCenter, zoom:20.0, tilt: 0, bearing: 0);
    setState(() {
      _kMapCenter = LatLng(adress.first.latitude, adress.first.longitude);
      _kInitialPosition = CameraPosition(target: _kMapCenter, zoom:20.0, tilt: 0, bearing: 0);
    });
  }


  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
        infoWindow: InfoWindow(title: 'Marker 1'),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: _kInitialPosition!=null? GoogleMap(
        initialCameraPosition: _kInitialPosition!,
        markers: _createMarker(),
      ):SizedBox(),
    );
  }
}
