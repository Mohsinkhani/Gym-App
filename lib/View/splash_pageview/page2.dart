import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
                   image: DecorationImage(image: AssetImage("assets/images/splashback2.png"),fit: BoxFit.fill),
                   //color: Colors.green
                 ),
               ),
             42.verticalSpace,
             Text("CREATE A WORKOUT PLAN",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.normal,),
               textAlign: TextAlign.center,),
             Text("TO STAY FIT",style: TextStyle(color: Colors.white,fontSize: 24.sp,fontWeight: FontWeight.w800,))],
         ),
       ),
     );
  }
}
