import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';


class SearchField extends StatefulWidget {
  SearchField({this.controller, this.padding = 39, this.enabled = true, Key? key}) : super(key: key);

  double? padding;
  TextEditingController? controller;


  bool enabled;
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: widget.padding!.w),
      child: Container(
        decoration: BoxDecoration(
          color: CColors.businessCardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 12.w,
            ),
            Icon(
              IconlyLight.search,
              color: Colors.black,
              size: 20,
            ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                enabled: widget.enabled,
                style: AppTextStyle.spliceSans(
                  style: TextStyle(
                    color: CColors.fieldText,
                    fontSize: 16.w,
                  ),
                ),
                decoration: InputDecoration(
                  hintText: "Search",
                  isDense: false,
                  hintStyle: AppTextStyle.quickSand(
                    style: TextStyle(
                      color: CColors.fieldText,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.w,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 16.58.w,
                  ),
                  fillColor: CColors.textFieldFill,
                  border: InputBorder.none,
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(right: 15.w, top: 8.h, bottom: 8.h),
            //   child: Image.asset('assets/images/filter.png', height: 15,width: 22.5,),
            // ),
          ],
        ),
      ),
    );
  }
}
