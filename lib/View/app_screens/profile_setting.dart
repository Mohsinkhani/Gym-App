import 'package:fitapp/View/app_screens/setting_notification.dart';
import 'package:fitapp/View/app_screens/unitsofmeasure_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingProfile extends StatelessWidget {
  const SettingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Setting",style: TextStyle(color: Colors.white),),
        leading:
        Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)
        ,
      ),
      body: Column(
        children: [
          40.verticalSpace,
          Divider(
            height: 1.sp,
            indent: 20.sp,
            endIndent: 20.sp,
            color: Colors.grey.shade800,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UnitsOfMeasure()));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Text("Units of measure",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.sp,
            indent: 20.sp,
            endIndent: 20.sp,
            color: Colors.grey.shade800,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingNotification()));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Text("Notifications",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.sp,
            indent: 20.sp,
            endIndent: 20.sp,
            color: Colors.grey.shade800,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Text("Language",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
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
            color: Colors.grey.shade800,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Text("Contact Us ",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
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
            color: Colors.grey.shade800,
          ),
        ],
      ),
    );
  }
}
