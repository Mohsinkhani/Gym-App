import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                height: 460.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/splashback1.png"),fit: BoxFit.fill),
                  //color: Colors.green
                ),
              ),
              42.verticalSpace,
              Text("MEET YOUR COACH,",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.w300,),
                textAlign: TextAlign.center,),
            Text("START YOUR JOURNEY",style: TextStyle(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.w800,))
            
            ],
          ),
        ),
      );
  }
}
