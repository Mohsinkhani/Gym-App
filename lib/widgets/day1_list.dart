import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Day1list extends StatelessWidget {
  const Day1list({super.key,required this.image,required this .title,required this.duration,required this.subtile});
final String image;
final String title;
final String subtile;
final String duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.0.sp,bottom: 10.sp,right: 24.sp),
      child: Container(
        height: 86.sp,
        width: 327.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: Color(0xff2C2C2E),
        ),
        child: Row(
          children: [
            Image.asset(image,fit: BoxFit.fitHeight,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start  ,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 8.0.sp,top: 10.sp),
                    child: Text(title,style: TextStyle(
                        fontSize: 15.0.sp,
                        fontFamily: "SF Pro Text",
                        color: Colors.white),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.sp,),
                    child: Text(subtile,style: TextStyle(
                        fontSize: 15.0.sp,
                        fontFamily: "SF Pro Text",
                        color: Colors.white),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 8.0.sp,),
                    child: Text(duration,style: TextStyle(
                        fontSize: 15.0.sp,
                        fontFamily: "SF Pro Text",
                        color: Color(0xffD0FD3E)),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}
