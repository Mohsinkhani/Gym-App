import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/begginercats.dart';

class CustomReviews extends StatelessWidget {
  const CustomReviews({super.key, required this.selectedCat});
  final Reviews selectedCat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: Color(0xff2C2C2E),
        ),
        width: 0.95.sw,
        height: 210.sp,

        child: Column(
          children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  image:DecorationImage(image: AssetImage(selectedCat.image))
                ),
                height: 32.sp,
                width: 32.sp,

              ),
              10.horizontalSpace,
              Text(selectedCat.name,style: TextStyle(fontFamily: "SF Pro Text",fontSize: 15.sp,fontWeight: FontWeight.w500,color: Colors.white),),
              20.horizontalSpace,
              Padding(
                padding: EdgeInsets.only(
                    top: 8.sp,right: 24.0.sp, bottom: 8.sp),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffD0FD3E)
                    ),
                    height: 20.sp,
                    width: 40.sp,
                    child: Center(child: Text(selectedCat.rating.toString(),style: TextStyle(fontFamily: "SF Pro Text",
                        fontSize: 14.sp,fontWeight: FontWeight.w500),))),
              ),
              20.horizontalSpace,
              Text(selectedCat.timeduration,style: TextStyle(fontFamily: "SF Pro Text",
                  fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.white),),
            ],),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedCat.comment,style: TextStyle(fontSize: 14.sp,color: Colors.white,
                  fontWeight: FontWeight.w400,fontFamily: "SF Pro Text"
                  ),maxLines: 9,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
