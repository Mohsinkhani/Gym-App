import 'package:fitapp/View/app_screens/home_handling_pageview/pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitapp/View/info_screens/genderscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              height: 460.h,
              width: 1.sw,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splashback3.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 42.sp),
            Text(
              "ACTION IS THE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "KEY TO ALL SUCCESS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20.sp),
            InkWell(
              onTap: () async {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  // User is already authenticated, navigate to home page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PageViewScreen()),
                  );
                } else {
                  // User is not authenticated, navigate to login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => GenderScreen()),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xffD0FD3E),
                ),
                height: 55.sp,
                width: 185.sp,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Start Now"),
                      SizedBox(width: 10.sp),
                      Image.asset("assets/images/chevron-right.png"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
