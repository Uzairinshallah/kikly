import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../extras/app_text_style.dart';
import '../extras/colors.dart';
import '../models/TestModel.dart';

class UserWidget extends StatelessWidget {
  UserWidget(this.model, this.check, {Key? key}) : super(key: key);
  Users model;
  String check;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: CColors.businessCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 1.25,
        margin: EdgeInsets.symmetric(horizontal: 19.w, vertical: 5.h),
        child: SizedBox(
          width: 387.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: NetworkImage(model.image!),
                        fit: BoxFit.cover,
                        width: 87.w,
                        height: 87.h, //fill type of image inside aspectRatio
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  Expanded(
                    child: Column(
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
                                Text(
                                  "${model.firstName!}  ${model.lastName!}",
                                  style: AppTextStyle.inter(
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          color: CColors.textBlack)),
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
                            Container(
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
                          ],
                        ),
                        getHeight(10.h),
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
}
