import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/UserModel.dart';
import '../widgets/bottom_sheet.dart';

class SelectLocation extends StatefulWidget {
  SelectLocation({required this.model, Key? key}) : super(key: key);
  List<Users> model;

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(38.263793, -85.700243),
    zoom: 15,
  );

  final Set<Marker> _markers = <Marker>{};
  final List<LatLng> _latLen = <LatLng>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLatLang();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            initialCameraPosition: _kGoogle,
            markers: _markers,
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ),
    );
  }

  setLatLang() {
    for (int i = 0; i < widget.model.length; i++) {
      _latLen.add(LatLng(widget.model[i].address!.coordinates!.lat!,
          widget.model[i].address!.coordinates!.lng!));
    }
  }

  loadData() async {
    for (int i = 0; i < widget.model.length; i++) {
      _markers.add(
        Marker(
          onTap: () {
            print(_latLen[i]);
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              context: context,
              builder: (builder) {
                return DetailsSheet(
                  model: widget.model[i],
                );
              },
            );
          },
          markerId: MarkerId('downloadResizePictureCircle$i'),
          icon: await MarkerIcon.downloadResizePictureCircle(
              widget.model[i].image!,
              size: 70,
              addBorder: true,
              borderColor: (i % 2 == 0) ? Colors.red : Colors.green,
              borderSize: 15),
          position: _latLen[i],
        ),
      );

      setState(() {});
    }
  }
}
