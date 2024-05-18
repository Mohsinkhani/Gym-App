import 'package:fitapp/widgets/custom_premium_canvasprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_profile_canvasindicator.dart';

class PremiumprofileScreen extends StatelessWidget {
  const PremiumprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomPrimiumProfileCircularIndicator(   size: 300.sp,
                  strokeWidth: 7.sp,
                  value: 0.75, // Example value (0 to 1)
                  image: "", ),

                Container(
                    width: 162.sp,
                    height: 103.sp,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Color(0xff2C2C2E),width: 1.sp,)),

                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Joined",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 14.sp,),),
                          Text("2 mon ago",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 20.sp,),),
                          Text("Pro Member",style: TextStyle(color:     Color(0xffFF2424),fontFamily: "SF Pro Text",fontSize: 12.sp,),),
                          Text("Until 18 Jul 2022",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 15.sp,),),
                          Text("12 Months Subscription",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 11.sp,),),
                        ],
                      ),
                    ))
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 40.0.sp),
              child: Text("SARAH",style: TextStyle(color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 40.0.sp),
              child: Text("WEGan",style: TextStyle(color: Colors.white,fontSize: 28.sp,),),
            ),
            10.verticalSpace,
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey.shade700,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Text("Edit Profile",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                ),
              ],
            ),
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.all(20.0.sp),
                  child: Text("Privacy Policy",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding:  EdgeInsets.all(20.0.sp),
                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                ),
              ],
            ),
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.all(20.0.sp),
                  child: Text("Settings",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding:  EdgeInsets.all(20.0.sp),
                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                ),
              ],
            ),
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
            150.verticalSpace,

            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),

            Padding(
              padding:  EdgeInsets.only(left: 20.0.sp,bottom: 15.sp,top: 15),
              child: Text("Sign Out",style: TextStyle(color: Colors.red,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
            ),
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
