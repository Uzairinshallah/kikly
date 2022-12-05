import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:kikly/screens/cafe_details.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';
import '../models/UserModel.dart';
import 'get_user_details.dart';
import 'image_widget.dart';

class DetailsSheet extends StatefulWidget {
  DetailsSheet({required this.model, Key? key}) : super(key: key);
  Users model;

  @override
  State<DetailsSheet> createState() => _DetailsSheetState();
}

class _DetailsSheetState extends State<DetailsSheet> {
  List<String> images = [
    "https://cdn.pixabay.com/photo/2016/11/18/14/05/brick-wall-1834784__340.jpg",
    "https://cdn.pixabay.com/photo/2014/09/17/20/26/restaurant-449952__340.jpg",
    "https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/18/14/05/brick-wall-1834784__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/18/22/21/restaurant-1837150__340.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 30,
        ),
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
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GetUserDetails(
            model: widget.model,
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
        getHeight(10.h),
      ],
    );
  }

  SizedBox getHeight(double h) {
    return SizedBox(
      height: h,
    );
  }
}
