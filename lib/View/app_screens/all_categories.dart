import 'package:fitapp/View/app_screens/premium_screen.dart';
import 'package:fitapp/widgets/all-category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_begginer_cat_display.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  final _pageController = PageController();

  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        children: [
          60.verticalSpace,
          Text("Workout Categories",style: TextStyle(fontSize: 17.sp,fontFamily: "SF Pro Text",fontWeight: FontWeight.w600,color: Colors.white),),
          30.verticalSpace,
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
          Expanded(

            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                AllcategoriesItem(),
                CustomBegginerCatDisplay(),
                PremiumScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
