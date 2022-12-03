import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../extras/app_text_style.dart';
import '../extras/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const AppBarWidget({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: AppTextStyle.quickSand(
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.sp),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Icon(
            Icons.arrow_back,
            size: 33,
            color: CColors.textBlack,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
