import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitapp/View/app_screens/editprofile.dart';
import 'package:fitapp/View/app_screens/premium_profile_screen.dart';
import 'package:fitapp/View/app_screens/privacypolicy.dart';
import 'package:fitapp/View/app_screens/profile_setting.dart';
import 'package:fitapp/View/login_screens/loginhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_profile_canvasindicator.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:
          Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)
        ,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomProfileCircularIndicator(   size: 300.sp,
                  strokeWidth: 7.sp,
                  value: 0.75, // Example value (0 to 1)
                  image: "", ),

                Container(
                  width: 142.sp,
                    height: 103.sp,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Color(0xff2C2C2E),width: 1.sp,)),

                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(left: 14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Joined",style: TextStyle(color: Colors.grey,fontFamily: "SF Pro Text",fontSize: 14.sp,),),
                          Text("2 months ago",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 20.sp,),),
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
            30.verticalSpace,
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>EditProfile()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Edit Profile",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Privacy Policy",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingProfile()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Settings",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 18.sp,fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),
            40.verticalSpace,
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumprofileScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Color(0xff2C2C2E),
                  ),
                  height: 87.sp,
                  width: 327.sp,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 20.sp,
                                width: 37.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.sp),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text("PRO",style: TextStyle(color: Colors.white,fontFamily: "Sf pro Text",fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:8.0),
                              child: Text("Upgrade to Premium",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",fontSize: 16.sp,
                                  fontWeight: FontWeight.w400)),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:8.0),
                              child: Text("This subscription is auto-renewable",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text",
                                  fontSize: 13.sp,fontWeight: FontWeight.w300)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                      )
                    ],
                  ),

                ),
              ),
            ),
            20.verticalSpace,
            Divider(
              height: 1.sp,
              indent: 20.sp,
              endIndent: 20.sp,
              color: Colors.grey,
            ),

            GestureDetector(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Loginhome()),
                  );
                } catch (e) {
                  print("Error signing out: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to sign out')),
                  );
                } finally {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20.0.sp, bottom: 15.sp, top: 15),
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.red),
                    SizedBox(width: 10.sp),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: "SF Pro Text",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
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
