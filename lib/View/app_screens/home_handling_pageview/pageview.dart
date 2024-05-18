import 'package:fitapp/View/app_screens/bmi_calculator.dart';
import 'package:fitapp/View/app_screens/home_screen.dart';
import 'package:fitapp/View/app_screens/notification.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../profilescreen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController _pageController = PageController();
  int selectedpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildpageview(),
      bottomNavigationBar: buildbottomnav(),
    );
  }

  Widget buildpageview() {
    return SizedBox(
        height: 0.92.sh,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeScreen(),
            BmiCalculator(),
            NotificationScreen(),
            profileScreen()
          ],
          onPageChanged: (index) {
            onPageChanged(index);
          },
        ));
  }

  Widget buildbottomnav() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      elevation: 0,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xff505050),

      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedpage,
      items:  [
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_filled,
                  )
                  // 7.horizontalSpace,
                  // Text("Status",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Colors.white),)
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bar_chart,
                  ),
                  // 7.horizontalSpace,
                  // Text("Saved",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Colors.white),)
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset("assets/images/notifications.icon.png",height: 25.sp,width: 25.sp,)
                // 7.horizontalSpace,
                // Text("Gallery",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Colors.white),), // Your label text
              ],
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/login2.png",height: 25.sp,width: 25.sp,)
                // 7.horizontalSpace,
                // Text("Gallery",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Colors.white),), // Your label text
              ],
            ),
          ),
          label: "",
        ),
      ],
      onTap: (int index) {
        _pageController.animateToPage(index,
            duration: Duration(microseconds: 1000), curve: Curves.easeIn);
      },
    );
  }

  onPageChanged(int index) {
    setState(() {
      selectedpage = index;
    });
  }
}
