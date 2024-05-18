import 'package:fitapp/View/app_screens/all_categories.dart';
import 'package:fitapp/View/app_screens/day1_workout.dart';
import 'package:fitapp/View/app_screens/premium_screen.dart';
import 'package:fitapp/View/splash_pageview/page2.dart';
import 'package:fitapp/data/dummydata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../widgets/begginer_item.dart';
import '../../widgets/custom_begginer_cat_display.dart';
import '../../widgets/custom_premium_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static String getGreeting() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning.';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon.';
    } else {
      return 'Good Evening.';
    }
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('E dd MMM').format(dateTime);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen({super.key});
  final String formattedDate = HomeScreen.formatDate(DateTime.now());

  final _pageController = PageController();

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.sp, left: 16.sp, top: 12.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "HELLO SARAH,",
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 12.0.sp),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumScreen()));
                    },
                    child: Container(
                      height: 30.sp,
                      width: 40.sp,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Center(child: Text("PRO",style: TextStyle(color: Colors.white,fontFamily: "SF Pro Text"),)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0.sp, left: 16.sp, top: 8.sp),
            child: Text(
              HomeScreen.getGreeting(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          20.verticalSpace,
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 8.0.sp, left: 16.sp, right: 8.sp),
                child: Text(
                  "Today Workout plan",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              55.horizontalSpace,
              Text(
                formattedDate,
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "SF Pro Text",
                    color: Color(0xffD0FD3E)),
              ),
            ],
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 16.0.sp, right: 15.sp),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkoutDay1()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Card.png",
                      ),
                      fit: BoxFit.fill),
                  //color: Colors.white
                ),
                height: 160.sp,
                width: 327.sp,
                child: Padding(
                  padding: EdgeInsets.all(
                    22.0.sp,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Day 01- Warp Up",
                            style: TextStyle(
                                fontSize: 20.0.sp,
                                fontFamily: "SF Pro Text",
                                color: Colors.white),
                          )),

                      //10.verticalSpace,
                      Row(
                        children: [
                          SizedBox(
                            height: 10.sp,

                            child: VerticalDivider(color: Color(0xffD0FD3E),thickness: 3.5,),
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "07:00 - 08:00",
                                style: TextStyle(
                                    fontSize: 18.0.sp,
                                    fontFamily: "SF Pro Text",
                                    color: Color(0xffD0FD3E)),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          30.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Workout Categories",
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "SF Pro Text",
                    color: Colors.white),
              ),
              110.horizontalSpace,
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategories()));
                },
                child: Text("See all",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "SF Pro Text",
                        color: Color(0xffD0FD3E))),
              )
            ],
          ),
          10.verticalSpace,
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey,
              ),
              height: 40.sp,
              width: 0.92.sw,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(0);

                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                        height: 30.sp,
                        width: 90.sp,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40)),
                            color: selectedIndex == 1
                                ? Color(0xffD0FD3E)
                                : Colors.transparent),
                        child: Center(
                          child: Text(
                            "Beginner",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: "SF Pro Text"),
                          ),
                        )),
                  ),
                  20.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(1);

                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      height: 30.sp,
                      width: 105.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: selectedIndex == 2
                              ? Color(0xffD0FD3E)
                              : Colors.transparent),
                      child: Center(
                        child: Text(
                          "Intermediate",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: "SF Pro Text"),
                        ),
                      ),
                    ),
                  ),
                  20.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(2);

                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: Container(
                      height: 30.sp,
                      width: 85.sp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: selectedIndex == 3
                              ? Color(0xffD0FD3E)
                              : Colors.transparent),
                      child: Center(
                        child: Text(
                          "Advance",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: "SF Pro Text"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: CustomBegginerCatDisplay(),
          // ),
          SizedBox(
            width: 0.9.sw,
            height: 0.4.sh,
            child: PageView(
            physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                CustomBegginerCatDisplay(),
                CustomBegginerCatDisplay(),

                CustomPremiumHome(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
