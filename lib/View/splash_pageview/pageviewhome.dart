
import 'dart:async';

import 'dart:async';
import 'package:fitapp/View/splash_pageview/page1.dart';
import 'package:fitapp/View/splash_pageview/page2.dart';
import 'package:fitapp/View/splash_pageview/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController _pageController = PageController();
  int selectedpage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Initialize timer to change page every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (selectedpage < 2) {
        selectedpage++;
      } else {
        selectedpage = 2;
      }
      _pageController.animateToPage(
        selectedpage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // Cancel the timer and dispose of the PageController
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildpageview(),
    );
  }

  Widget buildpageview() {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            Page1(),
            Page2(),
            Page3(),
          ],
          onPageChanged: (index) {
            onPageChanged(index);
          },
        ),
        Positioned(
          bottom: 64,
          left: 173,
          right: 133,
          child: buildbottomnav(),
        ),
      ],
    );
  }

  Widget buildbottomnav() {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.0.sp),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: selectedpage == 0 ? Color(0xffD0FD3E) : Colors.grey[300],
            ),
            height: 3.sp,
            width: selectedpage == 0 ? 28 : 8,
          ),
          5.horizontalSpace,
          Container(
            decoration: BoxDecoration(
              color: selectedpage == 1 ? Color(0xffD0FD3E) : Colors.grey[300],
            ),
            height: 3.sp,
            width: selectedpage == 1 ? 28 : 8,
          ),
          5.horizontalSpace,
          Container(
            decoration: BoxDecoration(
              color: selectedpage == 2 ? Color(0xffD0FD3E) : Colors.grey[300],
            ),
            height: 3.sp,
            width: selectedpage == 2 ? 28 : 8,
          ),
        ],
      ),
    );
  }

  onPageChanged(int index) {
    setState(() {
      selectedpage = index;
      _pageController.jumpToPage(index);
    });
  }
}
