import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';

class GetButton extends StatelessWidget {
  String text;
  Function onTap;

  GetButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 57.w,
      ),
      child: SizedBox(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrangeAccent,
            padding: EdgeInsets.symmetric(vertical: 15.5.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.map,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                text,
                style: AppTextStyle.spliceSans(
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
