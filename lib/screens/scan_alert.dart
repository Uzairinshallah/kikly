
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';

class ViewAlert extends StatefulWidget {
  ViewAlert({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewAlert> createState() => _ViewAlertState();
}

class _ViewAlertState extends State<ViewAlert> {
  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          children: const [
            Text(
              'Scan Me',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            Text(
              'It will take you to my profile if any friend scan it',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            child: SfBarcodeGenerator(
              value: 'www.google.com',
              symbology: DataMatrix(),
            ),
          ),
          getHeight(10),
          Center(
            child: Container(
              height: 50.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Share Me",
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
    );
  }

  SizedBox getHeight(double h) {
    return SizedBox(
      height: h,
    );
  }
}
