import 'package:fitapp/data/notificationsdata.dart';
import 'package:fitapp/model/begginercats.dart';
import 'package:fitapp/widgets/customallnotifications.dart';
import 'package:fitapp/widgets/customeventnotifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_begginer_cat_display.dart';
import '../../widgets/custom_premium_home.dart';
import '../../widgets/cutom_notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final _pageController = PageController();

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Notification",style: TextStyle(color: Colors.white),),
      ),
      body:  Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xff2C2C2E),
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
                              "New",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.white,
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
                            "Events",
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
                            "All",
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
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                CustomNotifications( ),
                CustomEventNotifications(),
                CustomallNotifications(),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
