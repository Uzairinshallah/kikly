import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';
import '../models/UserModel.dart';
import '../screens/scan_alert.dart';

class GetUserDetails extends StatelessWidget {
  GetUserDetails({required this.model, Key? key}) : super(key: key);
  Users model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getHeight(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "${model.firstName!}  ${model.lastName!}",
                      style: AppTextStyle.inter(
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                              color: CColors.textBlack)),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Open",
                      style: AppTextStyle.inter(
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Text(
                  model.address?.address ?? "",
                  style: AppTextStyle.quickSand(
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: CColors.textBlack)),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewPage()));
                showDialog(
                    context: context,
                    builder: (context) => ViewAlert());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    IconlyLight.scan,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        getHeight(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  IconlyLight.video,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.wifi,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.currency_bitcoin,
                  color: Colors.black12,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  SizedBox getHeight(double h) {
    return SizedBox(
      height: h,
    );
  }
}
