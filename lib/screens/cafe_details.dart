import 'dart:async';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kikly/widgets/get_user_details.dart';

import '../extras/app_text_style.dart';
import '../models/UserModel.dart';
import '../widgets/image_widget.dart';

class CafeDetails extends StatefulWidget {
  CafeDetails({required this.model, Key? key}) : super(key: key);
  Users model;

  @override
  State<CafeDetails> createState() => _CafeDetailsState();
}

class _CafeDetailsState extends State<CafeDetails> {
  List<String> images = [
    "https://cdn.pixabay.com/photo/2016/11/18/14/05/brick-wall-1834784__340.jpg",
    "https://cdn.pixabay.com/photo/2014/09/17/20/26/restaurant-449952__340.jpg",
    "https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/18/14/05/brick-wall-1834784__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150__340.jpg",
  ];

  final Completer<GoogleMapController> _controller = Completer();

  static late CameraPosition _kGoogle;

  final Set<Marker> _markers = <Marker>{};
  final List<LatLng> _latLen = <LatLng>[];

  @override
  void initState() {
    // TODO: implement initState
    _kGoogle = CameraPosition(
      target: LatLng(widget.model.address!.coordinates!.lat!,
          widget.model.address!.coordinates!.lng!),
      zoom: 15,
    );
    setLatLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    addMark();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              getHeight(40.h),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                      child: const Icon(Icons.arrow_back_ios)),
                  Text(
                    "${widget.model.firstName!} ${widget.model.lastName!}",
                    style: AppTextStyle.inter(
                      style: TextStyle(
                        fontSize: 30.w,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              getHeight(10.h),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.blue,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    images[4],
                  ),
                ),
              ),
              getHeight(10.h),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ImageWidget(
                      images: images,
                      index: index,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetUserDetails(model: widget.model),
              ),
              getHeight(20.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 200,
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
              getHeight(10.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CafeDetails(model: widget.model),
                    ),
                  );
                },
                child: Container(
                  height: 50.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Reserve Table",
                      style: AppTextStyle.inter(
                        style: TextStyle(
                          fontSize: 30.w,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox getHeight(double h) {
    return SizedBox(
      height: h,
    );
  }

  setLatLang() {
    _latLen.add(LatLng(widget.model.address!.coordinates!.lat!,
        widget.model.address!.coordinates!.lng!));
  }

  addMark() async {
    print('nnnnnnnnn');
    print(widget.model.firstName);
    _markers.add(
      Marker(
        onTap: () {},
        markerId:
            MarkerId('downloadResizePictureCircl${widget.model.firstName}'),
        icon: await MarkerIcon.downloadResizePictureCircle(widget.model.image!,
            size: 70,
            addBorder: true,
            borderColor: Colors.green,
            borderSize: 15),
        position: _latLen.first,
      ),
    );
  }
}
